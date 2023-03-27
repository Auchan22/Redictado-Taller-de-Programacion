program ejercicio4;
const
	DIMF = 7;
type
	TRangoDias = 1..DIMF;
	
	TEntrada = record
		dia: TRangoDias;
		codigo: integer;
		asiento: integer;
		monto: integer;
	end;
	
	TEntradaAguardar = record
		codigo: integer;
		asiento: integer;
		monto: integer;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TEntradaAguardar;
		sig: TLista;
	end;
	
	TVector = array[TRangoDias] of TLista;
	
	TDatoAcumulador = record
		codigo: integer;
		entradasVendidas: integer;
	end;
	
	TListaAcumulador = ^TNodoAcumulador;
	TNodoAcumulador = record
		dato: TDatoAcumulador;
		sig: TListaAcumulador;
	end;

//Inciso A
procedure inicializarVector (var v: TVector);
var
	i: TRangoDias;
begin
	for i:= 1 to DIMF do
		v[i]:= nil;
end;

procedure cargarVector(var v: TVector);

	procedure leerEntrada(var e: TEntrada);
	begin
		writeln;
		writeln('---');
		e.codigo:= random(50);
		writeln('Ingrese codigo de entrada: ', e.codigo);
		if(e.codigo <> 0) then begin
			e.dia:= random(DIMF) + 1;
			writeln('Ingrese dia: ', e.dia);
			e.asiento:= random(100);
			writeln('Ingrese asiento: ', e.asiento);
			e.monto:= random(50) + 200;
			writeln('Ingrese monto: ', e.monto);
		end;
		writeln('---');
		writeln;
	end;
	
	procedure cargarDatosAguardar(e: TEntrada; var eg: TEntradaAguardar);
	begin
		eg.codigo:= e.codigo;
		eg.asiento:= e.asiento;
		eg.monto:= e.monto;
	end;
	
	procedure insertarOrdenado(var L: TLista; e: TEntradaAguardar);
	var
		nue, act, ant: TLista;
	begin
		new(nue);
		nue^.dato:= e;
		nue^.sig:= nil;
		act:= L;
		ant:= L;
		while(act <> nil) and (act^.dato.codigo < e.codigo) do begin
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
	e: TEntrada;
	eg: TEntradaAguardar;
begin
	leerEntrada(e);
	while(e.codigo <> 0) do begin
		cargarDatosAguardar(e, eg);
		insertarOrdenado(v[e.dia], eg);
		leerEntrada(e);
	end;
end;

//Inciso B
procedure mergeAcumulador(var L: TListaAcumulador; v: TVector);

	procedure minimo(var v: TVector; var e: TEntradaAguardar);
	var
		i, pos: integer;
	begin
		pos:= -1;
		e.codigo:= 32766;
		for i:= 1 to DIMF do begin
			if(v[i] <> nil) and (v[i]^.dato.codigo <= e.codigo) then begin
				pos:= i;
				e:= v[i]^.dato;
			end;
		end;
		if(pos <> -1) then begin
			e:= v[pos]^.dato;
			v[pos]:= v[pos]^.sig;
		end;
	end;
	
	procedure agregarAtras(var pri, ult: TListaAcumulador; da: TDatoAcumulador);
	var
		nue: TListaAcumulador;
	begin
		new(nue);
		nue^.dato:= da;
		nue^.sig:= nil;
		if(pri = nil) then 
			pri:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

var
	ult: TListaAcumulador;
	da: TDatoAcumulador;
	e: TEntradaAguardar;
begin
	ult:= nil;
	minimo(v, e);
	while(e.codigo <> 32766) do begin
		da.codigo:= e.codigo;
		da.entradasVendidas:= 0;
		while(e.codigo <> 32766) and (e.codigo = da.codigo) do begin
			da.entradasVendidas:= da.entradasVendidas + 1;
			minimo(v, e);
		end;
		agregarAtras(L, ult, da);
	end;
end;

//Inciso C
procedure imprimirDatos(d: TDatoAcumulador);
begin
	writeln;
	writeln('/\/\/\/\');
	writeln(' -> Codigo: ', d.codigo);
	writeln(' -> Cantidad de entradas Vendidas: ', d.entradasVendidas);
	writeln('\/\/\/\/');
	writeln;
end;

procedure imprimirLista(L: TListaAcumulador);
begin
	if(L <> nil) then begin
		imprimirDatos(L^.dato);
		imprimirLista(L^.sig);
	end;
end;

var
	v: TVector;
	L: TListaAcumulador;
begin
	Randomize;
	inicializarVector(v);
	cargarVector(v);
	L:= nil;
	mergeAcumulador(L, v);
	imprimirLista(L);
end.
