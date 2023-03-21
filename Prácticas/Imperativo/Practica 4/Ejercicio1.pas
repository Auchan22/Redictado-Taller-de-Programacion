program ejercicio1;
const
	DIMF = 12;
type
	TRangoMes = 1..DIMF;
	TFecha = record
		dia: integer;
		mes: TRangoMes;
	end;

	TPrestamo = record
		ISBN: integer;
		nroSocio: integer;
		fecha: TFecha;
		cantDias: integer;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TPrestamo;
		sig: TLista;
	end;
	
	
	TVector = array[TRangoMes] of TLista;
	
	TDatoAcumulador = record
		ISBN: integer;
		vecesPrestadas: integer;
	end;
	
	TListaAcumulador = ^TNodoAcumulador;
	TNodoAcumulador = record
		dato: TDatoAcumulador;
		sig: TListaAcumulador;
	end;
	
//Inciso a
procedure cargarVector(var v: TVector);

	procedure inicializarVector(var v: TVector);
	var
		i: TRangoMes;
	begin
		for i:= 1 to DIMF do 
			v[i]:= nil;
	end;

	procedure leerPrestamo(var p: TPrestamo);
	begin
		writeln('---');
		p.ISBN:= random(50) - 1;
		writeln('- Ingrese ISBN: ', p.ISBN);
		if(p.ISBN <> -1) then begin
			p.nroSocio:= random(1000) + 1;
			writeln('- Ingrese Nro de Socio: ', p.nroSocio);
			p.fecha.dia:= random(31) + 1;
			writeln('- Ingrese Dia: ', p.fecha.dia);
			p.fecha.mes:= random(12) + 1;
			writeln('- Ingrese Mes: ', p.fecha.mes);
			p.cantDias:= random(365) + 1;
			writeln('- Ingrese cantidad de dias Prestados: ', p.cantDias);
		end;
		writeln('---');
	end;
	
	procedure insertarOrdenado(var L: TLista; p: TPrestamo);
	var
		nue, act, ant: TLista;
	begin
		new(nue);
		nue^.dato:= p;
		act:= L;
		ant:= L;
		while(act <> nil) and (p.ISBN > act^.dato.ISBN) do begin
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
	p: TPrestamo;
begin
	inicializarVector(v);
	writeln;
	writeln('Cargando vector...');
	writeln;
	leerPrestamo(p);
	while(p.ISBN <> -1) do begin
		insertarOrdenado(v[p.fecha.mes], p);
		leerPrestamo(p);
	end;
	writeln;
end;

//Inciso b
procedure imprimirVector(v: TVector);

	procedure imprimirDatos(p: TPrestamo);
	begin
		writeln('/\/\/\/\');
		writeln('-> ISBN: ', p.ISBN);
		writeln('-> Nro de Socio: ', p.nroSocio);
		writeln('\/\/\/\/');
	end;

	procedure imprimirLista(L: TLista);
	begin
		if(L <> nil) then begin
			imprimirDatos(L^.dato);
			imprimirLista(L^.sig);
		end;
	end;

var
	i: TRangoMes;
begin
	for i:= 1 to DIMF do begin
		writeln;
		writeln('Imprimiendo mes ', i);
		if(v[i] = nil) then begin
			writeln('---');
			writeln('Lista vacia');
			writeln('---');
		end
		else
			imprimirLista(v[i]);
		writeln;
	end;
end;

//Inciso C
procedure merge(v: TVector; var L: TLista);
	
	procedure agregarAtras(var pri, ult: TLista; p: TPrestamo);
	var
		nue: TLista;
	begin
		new(nue);
		nue^.dato:= p;
		nue^.sig:= nil;
		if(pri = nil) then
			pri:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;
	
	procedure minimo(var v: TVector; var p: TPrestamo);
	var
		pos, i: integer;
		L: TLista;
	begin
		p.ISBN:= 32766;
		pos:= -1;
		for i:= 1 to DIMF do begin
			L:= v[i];
			if(L <> nil) then
				if (L^.dato.ISBN <= p.ISBN) then begin
					p:= L^.dato;
					pos:= i;
				end
		end;
			
		if(p.ISBN <> 32766) then
			v[pos] := v[pos]^.sig;
	end;

var
	elemento: TPrestamo;
	ult: TLista;
begin
	minimo(v, elemento);
	while(elemento.ISBN <> 32766) do begin
		agregarAtras(L, ult, elemento);
		minimo(v, elemento);
	end;
end;

//Inciso D
procedure imprimirListaMerge(L: TLista);

	procedure imprimirDatos(p: TPrestamo);
	begin
		writeln('/\/\/\/\');
		writeln('-> ISBN: ', p.ISBN);
		writeln('-> Nro de Socio: ', p.nroSocio);
		writeln('\/\/\/\/');
	end;

begin
	if(L <> nil) then begin
		imprimirDatos(L^.dato);
		imprimirListaMerge(L^.sig);
	end;
end;

//Inciso E
procedure mergeAcumulador(v: TVector; var L: TListaAcumulador);

	procedure minimo(var v: TVector; var p: TPrestamo);
	var
		i, pos: integer;
	begin
		pos:= -1;
		p.ISBN := 32766;
		for i:= 1 to DIMF do
			if(v[i] <> nil) and (v[i]^.dato.ISBN <= p.ISBN) then begin
				pos:= i;
				p:= v[i]^.dato;
			end;
		
		if(pos <> -1) then begin
			p:= v[pos]^.dato;
			v[pos]:= v[pos]^.sig;
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
	p: TPrestamo;
	dA: TDatoAcumulador;
	ult: TListaAcumulador;
begin
	minimo(v, p);
	while(p.ISBN <> 32766) do begin
		dA.vecesPrestadas:= 0;
		dA.ISBN:= p.ISBN;
		while(p.ISBN <> 32766) and (dA.ISBN = p.ISBN) do begin
			dA.vecesPrestadas:= dA.vecesPrestadas + 1;
			minimo(v, p);
		end;
		agregarAtras(L, ult,dA);
	end;
end;

//Inciso F
procedure imprimirListaMergeAcumulador(LA: TListaAcumulador);
begin
	if(LA <> nil) then begin
		writeln('---');
		writeln('-> ISBN: ', LA^.dato.ISBN);
		writeln('-> Total de veces prestado: ', LA^.dato.vecesPrestadas);
		writeln('---');
		imprimirListaMergeAcumulador(LA^.sig);
	end;
end;

var
	v: TVector;
	L: TLista;
	LA: TListaAcumulador;
begin
	Randomize;
	L:= nil;
	LA:= nil;
	cargarVector(v);
	imprimirVector(v);
	writeln('Mergeando lista...');
	merge(v, L);
	imprimirListaMerge(L);
	mergeAcumulador(v, LA);
	imprimirListaMergeAcumulador(LA);
end.

