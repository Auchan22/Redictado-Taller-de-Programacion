program ejercicio3;
type
	TAlumno = record
		legajo: integer;
		dni: integer;
		anioIngreso: integer;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TAlumno;
		HI: TArbol;
		HD: TArbol;
	end;
	
procedure cargarArbol(var a: TArbol);

	procedure leerAlumno(var al: TAlumno);
	begin
		writeln('---');
		al.legajo:= random(50);
		writeln('Ingrese Nro de legajo: ', al.legajo);
		if(al.legajo <> 0) then begin
			al.dni:= random(1000) + 1;
			writeln('Ingrese DNI del alumno: ', al.dni);
			al.anioIngreso:= random(20) + 2000;
			writeln('Ingrese Anio de ingreso: ', al.anioIngreso);
		end;
		writeln('---');
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
			if(a^.dato.legajo > al.legajo) then
				crear(a^.HI, al)
			else
				crear(a^.HD, al);
	end;
	
	function esPosterior(al: TAlumno): boolean;
	begin
		esPosterior:= al.anioIngreso > 2010;
	end;

var
	al: TAlumno;
begin
	writeln('---');
	leerAlumno(al);
	while( al.legajo <> 0) do begin
		if(esPosterior(al)) then
			crear(a, al);
		leerAlumno(al);
	end;
	writeln('---');
end;

procedure imprimirDatos(a: TAlumno);
	begin
		writeln;
		writeln('-> DNI: ', a.dni, ' | ', a.legajo);
		writeln('-> Anio de ingreso: ', a.anioIngreso);
		writeln;
	end;

procedure informarAlumnosLegajoMenor(a: TArbol);

	procedure leerParametros(var l: integer);
	begin
		writeln('---');
		write('Ingrese numero de legajo: ');
		readln(l);
		writeln('---');
	end;	
	
	procedure Buscar(a: TArbol; l: integer);
	begin
		if(a <> nil) then begin
			
			if(a^.dato.legajo > l) then
				Buscar(a^.HI, l);
			imprimirDatos(a^.dato);
			Buscar(a^.HD, l);
		end;
	end;
var
	l: integer;
begin
	writeln;
	writeln('Alumnos con legajo menor a x...');
	leerParametros(l);
	Buscar(a, l);
	writeln;
end;

procedure informarAlumnosEntreLegajo(a: TArbol);
	procedure leerParametros(var min, max: integer);
	begin
		writeln('---');
		write('Ingrese numero de legajo minimo: ');
		readln(min);
		write('Ingrese numero de legajo maximo: ');
		readln(max);
		writeln('---');
	end;	
	
	procedure Buscar(a: TArbol; min, max: integer);
	begin
		if(a <> nil) then begin
			Buscar(a^.HI, min, max);
			if(a^.dato.legajo < max) and (a^.dato.legajo > min) then begin
				imprimirDatos(a^.dato);
				Buscar(a^.HI, min, max);
				Buscar(a^.HD, min, max);
			end;
			Buscar(a^.HD, min, max);
		end;
	end;
	
var
	min, max: integer;
begin
	writeln;
	writeln('Alumnos con legajos entre...');
	leerParametros(min, max);
	Buscar(a, min, max);
	writeln;
end;

procedure informarDNIMasGrande(a: TArbol);
	
	procedure maximo(var maxDni: integer; dni: integer);
	begin
		if(dni > maxDNI) then
			maxDNI:= dni
	end;
	
	procedure recorrer(a: TArbol; var maxDNI: integer);
	begin
		if(a <> nil) then begin
			maximo(maxDNI, a^.dato.dni);
			recorrer(a^.HI, maxDNI);
			recorrer(a^.HD, maxDNI);
		end;
	end;

var
	maxDNI: integer;
begin
	maxDNI:= 0;
	recorrer(a, maxDNI);
	writeln;
	writeln('DNI Mas grande: ', maxDNI);
	writeln;
end;

procedure informarCantLegajoImpar(a: TArbol);

	function esImpar(l: integer): boolean;
	begin
		esImpar:=  (l MOD 2) <> 0;
	end;
	
	function cant(a: TArbol): integer;
	begin
		if(a = nil) then
			cant:= 0
		else begin
			if(esImpar(a^.dato.legajo)) then
				cant:= 1;
			cant:= cant(a^.HI) + cant(a^.HD);
		end;
	end;

begin
	writeln;
	writeln('Cantidad de legajos impares: ', cant(a));
	writeln;
end;

procedure imprimirArbol(a: TArbol);

	procedure imprimirAlumno(a: TAlumno);
	begin
		writeln;
		writeln('-> Legajo: ', a.legajo);
		writeln('-> DNI: ', a.dni);
		writeln('-> Anio Ingreso: ', a.anioIngreso);
		writeln;
	end;

begin
	if(a <> nil) then begin
		imprimirArbol(a^.HI);
		imprimirAlumno(a^.dato);
		imprimirArbol(a^.HD);
	end;
end;

var
	a: TArbol;
begin
	Randomize;
	a:= nil;
	cargarArbol(a);
	imprimirArbol(a);
	informarAlumnosLegajoMenor(a);
	informarAlumnosEntreLegajo(a);
	informarDNIMasGrande(a);
	informarCantLegajoImpar(a);
end.

