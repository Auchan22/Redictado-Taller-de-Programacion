program ejercicio3;
const
	DIMF = 4;
type
	TRangoSucursal = 1..DIMF;
	
	TFecha = record
		dia: integer;
		mes: integer;
		anio: integer;
	end;

	TVenta = record
		fecha: TFecha;
		cProducto: integer;
		cSucursal: integer;
		cantVendida: integer;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TVenta;
		sig: TLista;
	end;
	
	TVector = array[TRangoSucursal] of TLista;
	
	TDatoAcumulador = record
		cProducto: integer;
		totalCantVendida: integer;
	end;
	
	TListaAcumulador = ^TNodoAcumulador;
	TNodoAcumulador = record
		dato: TDatoAcumulador;
		sig: TListaAcumulador;
	end;

//Inciso A 
procedure inicializarVector(var v: TVector);
var
	i: TRangoSucursal;
begin
	for i:= 1 to DIMF do
		v[i]:= nil;
end;

procedure cargarVector(var v: TVector);

	procedure leerFecha(var f: TFecha);
	begin
		f.dia:= random(31) + 1;
		f.mes:= random(12) + 1;
		f.anio:= random(15) + 2008;
		writeln('Ingrese dia: ', f.dia);
		writeln('Ingrese mes: ', f.mes);
		writeln('Ingrese anio: ', f.anio);
	end;

	procedure leerVenta(var v: TVenta);
	begin
		writeln;
		v.cSucursal:= random(DIMF) - 1;
		writeln('Ingrese codigo de Sucursal: ', v.cSucursal + 1);
		if(v.cSucursal <> -1) then begin
			v.cProducto:= random(100) + 1;
			writeln('Ingrese codigo de Producto: ', v.cProducto );
			leerFecha(v.fecha);
			v.cantVendida:= random(50) + 1;
			writeln('Ingrese cantidades Vendidas: ', v.cantVendida );
		end;
		writeln;
	end;
	
	procedure insertarOrdenado(var L: TLista; v: TVenta);
	var
		act, ant, nue: TLista;
	begin
		new(nue);
		nue^.dato:= v;
		act:= L;
		ant:= L;
		while (act <> nil) and (act^.dato.cProducto < v.cProducto) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(act = ant) then
			L:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
var
	ve: TVenta;
begin
	writeln;
	leerVenta(ve);
	while(ve.cSucursal <> -1) do begin
		insertarOrdenado(v[ve.cSucursal + 1], ve);
		leerVenta(ve);
	end;
	writeln;
end;

procedure imprimirVector(v: TVector);

	procedure imprimirFecha(f: TFecha);
	begin
		writeln('--> Dia: ', f.dia);
		writeln('--> Mes: ', f.mes);
		writeln('--> Anio: ', f.anio);
	end;

	procedure imprimirDatos(v: TVenta);
	begin
		writeln;
		writeln('/\/\/\/\');
		writeln('-> Codigo Producto: ', v.cProducto);
		writeln('-> Fecha: ');
		imprimirFecha(v.fecha);
		writeln('-> Codigo Sucursal: ', v.cSucursal + 1);
		writeln('-> Cantidades vendidas: ', v.cantVendida);
		writeln('\/\/\/\/');
		writeln;
	end;

	procedure imprimirLista(L: TLista);
	begin
		if(L <> nil) then begin
			imprimirDatos(L^.dato);
			imprimirLista(L^.sig);
		end;
	end;

var
	i: TRangoSucursal;
begin
	for i:= 1 to DIMF do begin
		writeln('Imprimiendo Sucursal ', i);
		if(v[i] <> nil) then
			imprimirLista(v[i])
		else begin
			writeln('---');
			writeln('Lista vacia');
			writeln('---');
		end;
	end;
end;

//Inciso B
procedure mergeAcumulador(v: TVector; var LA: TListaAcumulador);

	procedure agregarAtras(var pri, ult: TListaAcumulador; dA: TDatoAcumulador);
	var
		nue: TListaAcumulador;
	begin
		new(nue);
		nue^.dato:= dA;
		nue^.sig:= nil;
		if(pri = nil) then
			pri:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;
	
	procedure minimo(var v: TVector; var ve: TVenta);
	var
		pos, i: integer;
	begin
		ve.cProducto := 32766;
		pos:= -1;
		for i:= 1 to DIMF do
			if(v[i] <> nil) and (v[i]^.dato.cProducto <= ve.cProducto) then begin
				ve:= v[i]^.dato;
				pos:= i;
			end;
		
		if(pos <> -1) then begin
			ve:= v[pos]^.dato;
			v[pos]:= v[pos]^.sig;
		end;
	end;

var
	dA: TDatoAcumulador;
	ve: TVenta;
	ult: TListaAcumulador;
begin
	ult:= nil;
	minimo(v, ve);
	while(ve.cProducto <> 32766) do begin
		dA.totalCantVendida:= 0;
		dA.cProducto:= ve.cProducto;
		while(ve.cProducto <> 32766) and (dA.cProducto = ve.cProducto) do begin
			dA.totalCantVendida := dA.totalCantVendida + ve.cantVendida;
			minimo(v, ve);
		end;
		agregarAtras(LA, ult, dA);
	end;
end;

procedure imprimirListaMerge(LA: TListaAcumulador);
begin
	if(LA <> nil) then begin
		writeln;
		writeln('---');
		writeln('-> Codigo de producto: ', LA^.dato.cProducto);
		writeln('-> Cantidad Total Vendida: ', LA^.dato.totalCantVendida);
		writeln('---');
		writeln;
		imprimirListaMerge(LA^.sig);
	end;
end;

var
	v: TVector;
	LA: TListaAcumulador;
begin
	Randomize;
	LA:= nil;
	inicializarVector(v);
	cargarVector(v);
	imprimirVector(v);
	writeln;
	writeln('Mergeando Listas...');
	writeln;
	mergeAcumulador(v, LA);
	imprimirListaMerge(LA);
end.
