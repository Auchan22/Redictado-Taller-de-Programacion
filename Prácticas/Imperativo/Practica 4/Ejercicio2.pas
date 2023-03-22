program ejercicio2;
const
	DIMF = 8;
type
	TRangoGenero = 1..DIMF;

	TPelicula = record
		cPelicula: integer;
		cGenero: TRangoGenero;
		puntaje: real;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TPelicula;
		sig: TLista;
	end;
	
	TVector = array[TRangoGenero] of TLista;

//Inciso A
procedure cargarVector(var v: TVector);

	procedure leerPelicula(var p: TPelicula);
	begin
		p.cPelicula:= random(100) - 1;
		writeln;
		writeln('Ingrese codigo de Pelicula: ', p.cPelicula);
		if(p.cPelicula <> -1) then begin
			p.cGenero:= random(DIMF) + 1;
			writeln('Ingrese codigo de Genero: ', p.cGenero);
			p.puntaje:= random(10) + 0.5;
			writeln('Ingrese puntaje: ', p.puntaje:1:1);
		end;
		writeln;
	end;
	
	procedure insertarOrdenado(var L: TLista; p: TPelicula);
	var
		ant, act, nue: TLista;
	begin
		new(nue);
		nue^.dato:= p;
		act:= L;
		ant:= L;
		while (act <> nil) and (act^.dato.cPelicula < p.cPelicula) do begin
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
	p: TPelicula;
begin
	writeln;
	leerPelicula(p);
	while(p.cPelicula <> -1) do begin
		insertarOrdenado(v[p.cGenero], p);
		leerPelicula(p);
	end;
	writeln;
end;

procedure inicializarVector(var v: TVector);
var
	i: TRangoGenero;
begin
	for i:= 1 to DIMF do 
		v[i]:= nil;
end;

	procedure imprimirDatos(p: TPelicula);
	begin
		writeln;
		writeln('/\/\/\/\');
		writeln('-> Codigo de pelicula: ', p.cPelicula);
		writeln('-> Codigo de Genero: ', p.cGenero);
		writeln('-> Puntaje de pelicula: ', p.puntaje:1:1);
		writeln('\/\/\/\/');
		writeln;
	end;

	procedure imprimirLista(L: Tlista);
	begin
		if(L <> nil) then begin
			imprimirDatos(L^.dato);
			imprimirLista(L^.sig);
		end;
	end;

procedure imprimirVector(v: TVector);
var
	i: TRangoGenero;
begin
	for i:= 1 to DIMF do begin
		writeln('Imprimiendo genero: ', i);
		if(v[i] <> nil) then
			imprimirLista(v[i])
		else begin
			writeln('---');
			writeln('Lista vacia');
			writeln('---');
		end;
	end;
end;

//Inciso b
procedure merge(v: TVector; var L: TLista);
	
	procedure minimo(var v: TVector; var p: TPelicula);
	var
		pos, i: integer;
	begin
		pos:= -1;
		p.cPelicula := 32766;
		for i:= 1 to DIMF do
			if(v[i] <> nil) and (v[i]^.dato.cPelicula <= p.cPelicula) then begin
				p:= v[i]^.dato;
				pos:= i;
			end;
		
		if(pos <> -1) then
			v[pos]:= v[pos]^.sig;
	end;
	
	procedure agregarAtras(var pri, ult: TLista; p: TPelicula);
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

var
	p: TPelicula;
	ult: TLista;
begin
	ult:= nil;
	minimo(v, p);
	while(p.cPelicula <> 32766) do begin
		agregarAtras(L, ult, p);
		minimo(v, p);
	end;
end;

var
	v: TVector;
	LM: TLista;
begin
	Randomize;
	LM:= nil;
	inicializarVector(v);
	cargarVector(v);
	imprimirVector(v);
	writeln;
	writeln('Imprimiendo lista mergeada...');
	writeln;
	merge(v, LM);
	imprimirLista(LM);
end.
