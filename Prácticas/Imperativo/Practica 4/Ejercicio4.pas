program ejercicio4;
const
	DIMF = 7;
type
	TRangoDias = 1..DIMF;
	
	TEntrada = record
		dia: TRangoDias;
		cObra: integer;
		asiento: integer;
		monto: integer;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TEntrada;
		sig: TLista;
	end;
	
	TVector = array[TRangoDias] of TLista;
	
	TDatoAcumulador = record
		cObra: integer;
		totalEntradasVendidas: integer;
	end;
	
	TListaAcumulador = ^TNodoAcumulador;
	TNodoAcumulador = record
		dato: TDatoAcumulador;
		sig: TListaAcumulador;
	end;

//Inciso a
procedure inicializarVector(var v: TVector);
var
	i: TRangoDias;
begin
	for i:= 1 to DIMF do
		v[i]:= nil;
end;

procedure cargarVector(var v:TVector);

	procedure leerEntrada(var e: TEntrada);
	begin
		writeln;
		writeln('---');
		e.cObra:= random(50);
		writeln('Ingrese codigo de obra: ', e.cObra);
		if(e.cObra <> 0) then begin
			e.dia:= random(DIMF) + 1;
			writeln('Ingrese dia: ', e.dia);
			e.asiento:= random(100) + 1;
			writeln('Ingrese asiento: ', e.asiento);
			e.monto:= random(200) + 300;
			writeln('Ingrese monto: ', e.monto);
		end;
		writeln('---');
		writeln;
	end;
	
	procedure insertarOrdenado(var L: TLista; e: TEntrada);
	var
		nue, act, ant: TLista;
	begin
		new(nue);
		nue^.dato:= e;
		act:= L;
		ant:= L;
		while(act <> nil) and (act^.dato.cObra < e.cObra) do begin
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
begin
	writeln;
	leerEntrada(e);
	while(e.cObra <> 0) do begin
		insertarOrdenado(v[e.dia], e);
		leerEntrada(e);
	end;
	writeln;
end;

procedure mergeAcumulador(v: TVector; var LA: TListaAcumulador);

	procedure minimo(var v: TVector; var e: TEntrada);
	var
		pos, i: integer;
	begin
		pos:= -1;
		e.cObra:= 32766;
		for i:= 1 to DIMF do
			if(v[i] <> nil) and (v[i]^.dato.cObra <= e.cObra) then begin
				e:= v[i]^.dato;
				pos:= i;
			end;
		
		if(pos <> -1) then begin
			e:= v[pos]^.dato;
			v[pos] := v[pos]^.sig;
		end;
	end;
	
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

var
	ult: TListaAcumulador;
	e: TEntrada;
	dA: TDatoAcumulador;
begin
	ult:= nil;
	minimo(v, e);
	while(e.cObra <> 32766) do begin
		dA.cObra:= e.cObra;
		dA.totalEntradasVendidas:= 0;
		while(e.cObra <> 32766) and (dA.cObra = e.cObra) do begin
			dA.totalEntradasVendidas := dA.totalEntradasVendidas + 1;
			minimo(v, e);
		end;
		agregarAtras(LA, ult, dA);
	end;
end;

procedure imprimirListaMerge(LA: TListaAcumulador);
begin
	if(LA <> nil) then begin
		writeln;
		writeln('/\/\/\/\');
		writeln('-> Codigo de obra: ', LA^.dato.cObra);
		writeln('-> Total de entradas vendidas: ', LA^.dato.totalEntradasVendidas);
		writeln('\/\/\/\/');
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
	writeln;
	writeln('Mergeando lista...');
	writeln;
	mergeAcumulador(v, LA);
	imprimirListaMerge(LA);
end.
