{

}

program ejercicio1;
type
	TSocio = record
		numero: integer;
		nombre: string[20];
		edad: integer;
	end;
	
	TArbol = ^TNodo;
	TNodo = record
		dato: TSocio;
		HI: TArbol;
		HD: TArbol;
	end;
	
procedure cargarArbol(var a: TArbol);

	procedure leerSocio(var s: TSocio);
	begin
		writeln(' ');
		s.numero:= random(50);
		writeln('Ingrese Nro de Socio: ', s.numero);
		if(s.numero <> 0) then begin
			s.nombre:= 'a';
			writeln('Ingrese Nombre de Socio: ', s.nombre);
			s.edad:= random(100) + 1;
			writeln('Ingrese Edad de Socio: ', s.edad);
		end;
		writeln(' ');
	end;
	
	procedure crearArbol(var a: TArbol; s: TSocio);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= s;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if(s.numero > a^.dato.numero) then
				crearArbol(a^.HD, s)
			else
				crearArbol(a^.HI, s);
	end;

var
	s: TSocio;
begin
	leerSocio(s);
	while(s.numero <> 0) do begin
		crearArbol(a, s);
		leerSocio(s);
	end;
end;

procedure imprimirArbol(a: TArbol);

	procedure imprimirSocio(s: TSocio);
	begin
		writeln('---');
		writeln('-> Nro Socio: ', s.numero);
		writeln('-> Nombre Socio: ', s.nombre);
		writeln('-> Edad Socio: ', s.edad);
		writeln('---');
	end;
	
begin
	if(a <> nil) then begin
		imprimirArbol(a^.HI);
		imprimirSocio(a^.dato);
		imprimirArbol(a^.HD);
	end;
end;

var
	a: TArbol;
begin
	Randomize;
	a:= nil;
	writeln(' ');
	cargarArbol(a);
	imprimirArbol(a);
	writeln(' ');
end.
