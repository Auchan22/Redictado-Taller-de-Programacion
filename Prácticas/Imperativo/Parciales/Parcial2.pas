program Parcial2;
const
	DIMF = 5;
	DIMF2 = 180;
type
	TRangoSucursal = 1..DIMF;

	TRangoVentas = 1..DIMF2;

	TVenta = record
		codigo: integer;
		cantVendida: integer;
		montoTotal: real;
	end;
	
	TVectorVentas = array[TRangoVentas] of TVenta;
	
	TDatoVector = record
		dimL: integer;
		vector: TVectorVentas;
	end;
	
	TVector = array[TRangoSucursal] of TDatoVector;
	
	TDatoLista = record
		codigo: integer;
		montoTotal: real;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TDatoLista;
		sig: TLista;
	end;


procedure inicializarVectores(var v: TVector);
var
	i: TRangoSucursal;
begin
	for i:= 1 to DIMF do
		v[i].dimL:= 0;
end;

procedure cargarVector(var v: TVector);

	procedure leerVenta(var v: TVenta);
	begin
		writeln;
		writeln('---');
		write('Ingrese codigo de producto: ');
		readln(v.codigo);
		if(v.codigo <> -1) then begin
			v.cantVendida:= random(100) + 1;
			writeln('Ingrese cantidades vendidas: ', v.cantVendida);
			v.montoTotal:= random(200) + 300.05;
			writeln('Ingrese monto total: ', v.montoTotal:1:1);
		end;
		writeln('---');
		writeln;
	end;

var
	i: integer;
	ve: TVenta;
begin
	i:= 0;
	while (i < DIMF) do begin
		i:= i + 1;
		writeln('Cargando sucursal: ', i);
		leerVenta(ve);
		while(v[i].dimL < DIMF2) and (ve.codigo <> -1) do begin
			v[i].dimL:= v[i].dimL + 1;
			v[i].vector[v[i].dimL]:= ve;
			leerVenta(ve);
		end;
	end;
end;

// Inciso A
procedure mergeAcumulador(var L: TLista; v: TVector);

	procedure borrarPos(var dv: TDatoVector);
	var
		i: integer;
	begin
		if (1 <= dv.dimL) then begin
			for i:= 2 to dv.dimL do 
				dv.vector[i - 1]:= dv.vector[i];
			dv.dimL:= dv.dimL - 1;
		end;
	end;

	procedure minimo(var v: TVector; var ve: TVenta);
	var
		i, pos: integer;
	begin
		pos:= -1;
		ve.codigo:= 32766;
		for i:= 1 to DIMF do
			if(v[i].vector[1].codigo <= ve.codigo) and (v[i].dimL >= 1) then begin
				pos:= i;
				ve:= v[i].vector[1];
			end;
		
		if(pos <> -1) then begin
			ve:= v[pos].vector[1];
			borrarPos(v[pos]);
		end;
	end;
	
	procedure agregarAtras(var pri, ult: TLista; dl: TDatoLista);
	var
		nue: TLista;
	begin
		new(nue);
		nue^.dato:= dl;
		nue^.sig:= nil;
		if(pri = nil) then
			pri:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;

var
	ult: TLista;
	ve: TVenta;
	dl: TDatoLista;
begin
	ult:= nil;
	minimo(v, ve);
	while(ve.codigo <> 32766) do begin
		dl.codigo:= ve.codigo;
		dl.montoTotal:= 0;
		while(ve.codigo <> 32766) and (dl.codigo = ve.codigo) do begin
			dl.montoTotal:= dl.montoTotal + ve.montoTotal;
			minimo(v, ve);
		end;
		agregarAtras(L, ult, dl);
	end;
end;

procedure imprimirLista(L: TLista);
begin
	if(L <> nil) then begin
		writeln;
		writeln('---');
		writeln('Codigo de producto: ', L^.dato.codigo, ' | Monto total Vendido: ', L^.dato.montoTotal:1:1);
		writeln('---');
		writeln;
		imprimirLista(L^.sig);
	end;
end;

//Inciso B
function cantMenor(L: TLista): integer;
begin
	if(L = nil) then
		cantMenor:= 0
	else
		if(L^.dato.montoTotal < 300000) then
			cantMenor:= 1 + cantMenor(L^.sig)
		else
			cantMenor:= cantMenor(L^.sig);
end;

var
	v: TVector;
	L: TLista;
begin
	Randomize;
	inicializarVectores(v);
	cargarVector(v);
	L:= nil;
	mergeAcumulador(L, v);
	imprimirLista(L);
	writeln;
	writeln('Cantidad de productos con monto menor a 300.000: ', cantMenor(L));
	writeln;
end.
