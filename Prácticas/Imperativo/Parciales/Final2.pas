program Final2;
type
	TString = string[20];

	TAlumno = record
		nombre: TString;
		dni: integer;
		puntaje: real;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TAlumno;
		HI: TArbol;
		HD: TArbol;
	end;
	
	TParametros = record
		inf: real;
		sup: real;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TAlumno;
		sig: TLista;
	end;

//Inciso A
procedure cargarArbol(var a: TArbol);

	procedure leerAlumno(var a: TAlumno);
	begin
		writeln;
		writeln('---');
		a.dni:= random(50);
		writeln('Ingrese DNI de alumno: ', a.dni);
		if(a.dni <> 0) then begin
			a.nombre:= 'a';
			writeln('Ingrese nombre de alumno: ', a.nombre);
			a.puntaje:= random(100);
			writeln('Ingrese puntaje de fotografia: ', a.puntaje:1:1);
		end;
		writeln('---');
		writeln;
	end;
	
	procedure crear(var a: TArbol; al: TAlumno);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= al;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if(a^.dato.puntaje > al.puntaje) then
				crear(a^.HI, al)
			else
				crear(a^.HD, al);
	end;

var
	al: TAlumno;
begin
	leerAlumno(al);
	while(al.dni <> 0) do begin
		crear(a, al);
		leerAlumno(al);
	end;
end;

//Inciso B
	procedure leerParametros(var p: TParametros);
	begin
		writeln;
		writeln('---');
		write('Ingrese valor inferior: ');
		readln(p.inf);
		write('Ingrese valor superior: ');
		readln(p.sup);
		writeln('---');
		writeln;
	end;

procedure generarLista(var L: TLista; a: TArbol);

	procedure insertarOrdenado(var L: TLista; a: TAlumno);
	var
		nue, act, ant: TLista;
	begin
		new(nue);
		nue^.dato:= a;
		nue^.sig:= nil;
		act:= L;
		ant:= L;
		while (act <> nil) and (act^.dato.puntaje < a.puntaje) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(act = ant) then
			L:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
	procedure busquedaAcotada(a: TArbol; p: TParametros; var L: TLista);
	begin
		if(a <> nil) then 
			if(a^.dato.puntaje >= p.inf) then 
				if(a^.dato.puntaje <= p.sup) then begin
					insertarOrdenado(L, a^.dato);
					busquedaAcotada(a^.HI, p, L);
					busquedaAcotada(a^.HD, p, L);
				end	
				else
					busquedaAcotada(a^.HI, p, L)
			else
				busquedaAcotada(a^.HD, p, L);
	end;

var
	p: TParametros;
begin
	writeln;
	leerParametros(p);
	busquedaAcotada(a, p, L);
	writeln('---');
	writeln('Generando lista...');
	writeln('---');
	writeln;
end;

//Inciso C
procedure encontrarPuntaje(a: TArbol);

	procedure minimo(a: TArbol;var minDni: integer;var minPuntaje: real);
	begin
		if (a <> nil) then begin
			minimo(a^.HI, minDni, minPuntaje);
			if(a^.dato.dni <= minDni) then begin
				minDni:= a^.dato.dni;
				minPuntaje:= a^.dato.puntaje;
			end;
			minimo(a^.HD, minDni, minPuntaje);
		end;
	end;
	
var
	minDni: integer;
	minPuntaje: real;
begin
	minDni:= 32766;
	minPuntaje:= 0;
	minimo(a, minDni, minPuntaje);
	writeln;
	writeln('---');
	writeln('El alumno con dni mas chico es: ', minDni, ', con un puntaje de: ',minPuntaje:1:1);
	writeln('---');
	writeln;
end;

var
	a: TArbol;
	L: TLista;
begin
	Randomize;
	a:= nil;
	cargarArbol(a);
	L:= nil;
	generarLista(L, a);
	encontrarPuntaje(a)
end.
