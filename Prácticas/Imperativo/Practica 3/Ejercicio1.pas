{

}

program ejercicio1;
type
	TString = string[20];	
	TSocio = record
		numero: integer;
		nombre: TString;
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


	procedure imprimirSocio(s: TSocio);
	begin
		writeln('---');
		writeln('-> Nro Socio: ', s.numero);
		writeln('-> Nombre Socio: ', s.nombre);
		writeln('-> Edad Socio: ', s.edad);
		writeln('---');
	end;

procedure imprimirArbol(a: TArbol);
begin
	if(a <> nil) then begin
		imprimirArbol(a^.HI);
		imprimirSocio(a^.dato);
		imprimirArbol(a^.HD);
	end;
end;

//Inciso i
procedure informarSocioNroMasGrande(a: TArbol);

	function socioMasGrande(a: TArbol): integer;
	begin
		if(a = nil) then
			socioMasGrande:= -1
		else
			if(a^.HD = nil) then
				socioMasGrande:= a^.dato.numero
			else
				socioMasGrande:= socioMasGrande(a^.HD);
	end;
var
	maxNro: integer;
begin
	writeln('---');
	writeln;
	writeln('Informar el nro de socio mas grande...');
	maxNro:= socioMasGrande(a);
	if(maxNro = -1) then
		writeln('El arbol esta vacío')
	else
		writeln('El nro de socio mas grande es: ', maxNro);
	writeln('---');
end;

//Inciso ii
procedure informarSocioNroMasChico(a: TArbol);
	function socioMasChico(a: TArbol): TArbol;
	begin
		if(a = nil) then
			socioMasChico:= nil
		else
			if(a^.HI = nil) then
				socioMasChico:= a
			else
				socioMasChico:= socioMasChico(a^.HI);
	end;
var
	socioMinNro: TArbol;
begin
	writeln('---');
	writeln;
	writeln('Informar Socio Nro mas chico...');
	writeln;
	socioMinNro:= socioMasChico(a);
	if(socioMinNro = nil) then
		writeln('Arbol vacío')
	else
		imprimirSocio(socioMinNro^.dato);
	writeln('---');
end;

//Inciso iii
procedure informarMaximoEdad(a: TArbol);

	procedure maximo(var maxNro, maxEdad: integer; nro, edad: integer);
	begin
		if(edad > maxEdad) then begin
			maxEdad:= edad;
			maxNro:= nro;
		end;
	end;
	
	procedure encontrarMaxEdad(a: TArbol; var maxNro, maxEdad: integer);
	begin
		if(a <> nil) then begin
			maximo(maxNro, maxEdad, a^.dato.numero, a^.dato.edad);
			encontrarMaxEdad(a^.HI, maxNro, maxEdad);
			encontrarMaxEdad(a^.HD, maxNro, maxEdad);
		end;
	end;

var
	maxNro, maxEdad: integer;
begin
	maxEdad:= -1;
	maxNro:= 0;
	writeln('---');
	writeln;
	writeln('Informar Socio de Mayor edad...');
	encontrarMaxEdad(a, maxNro, maxEdad);
	writeln;
	if(maxEdad= -1) then
		writeln('Arbol vacío')
	else
		writeln('El socio ', maxNro, ' es el socio mas grande, con edad: ', maxEdad);
	writeln('---');
end;

//Inciso iv
procedure aumentarEdad(a: TArbol);
begin
	if(a <> nil) then begin
		aumentarEdad(a^.HI);
		a^.dato.edad := a^.dato.edad + 1;
		aumentarEdad(a^.HD);
	end;
end;

//Inciso v
procedure informarNroSocioExiste(a: TArbol);

	procedure leerNroABuscar(var n: integer);
	begin
		writeln;
		writeln('Ingrese nro de socio a buscar: ');
		readln(n);
		writeln;
	end;
	
	function Buscar(a: TArbol; n: integer): boolean;
	begin
		if(a = nil) then
			Buscar:= false
		else
			if(n = a^.dato.numero) then
				Buscar:= true
			else
				if(n < a^.dato.numero) then
					Buscar:= Buscar(a^.HI, n)
				else
					Buscar:= Buscar(a^.HD, n)
	end;

var
	nroABuscar: integer;
begin
	writeln('---');
	writeln;
	leerNroABuscar(nroABuscar);
	writeln('Informar si existe socio con nro de socio: ', nroABuscar);
	writeln;
	if(Buscar(a, nroABuscar)) then
		writeln('El socio con nro: ', nroABuscar, ' existe!')
	else
		writeln('El socio no existe');
	writeln('---');
end;

//Inciso vi
procedure informarNombreSocioExiste(a: TArbol);
	
	procedure leerNombreABuscar(var n: TString);
	begin
		writeln;
		writeln('Ingrese nombre de socio a buscar: ');
		readln(n);
		writeln;
	end;
	
	function Buscar(a: TArbol; n: TString): boolean;
	begin
		if(a = nil) then
			Buscar:= false
		else
			if(a^.dato.nombre = n) then
				Buscar:= true
			else
				Buscar:= Buscar(a^.HI, n) or Buscar(a^.HD, n);
	end;
var
	nombreABuscar: string;
begin
	writeln('---');
	writeln;
	leerNombreABuscar(nombreABuscar);
	writeln('Informar si existe socio con nombre: ', nombreABuscar);
	writeln;
	if(Buscar(a, nombreABuscar)) then
		writeln('El socio con nombre: ', nombreABuscar, ' existe!')
	else
		writeln('El socio no existe');
	writeln('---');
end;

//Inciso vii
function cantidad(a: TArbol): integer;
	begin
		if(a = nil) then
			cantidad:= 0
		else 
			cantidad:= cantidad(a^.HI) + cantidad(a^.HD) + 1;
	end;

procedure informarCantidadSocios(a: TArbol);

begin
	writeln('---');
	writeln;
	writeln('Informar cantidad de socios: ', cantidad(a));
	writeln;
	writeln('---');
end;

//Inciso viii
procedure informarPromedioEdad(a: TArbol);

	function sumatoriaEdad(a: TArbol): integer;
	begin
		if(a = nil) then
			sumatoriaEdad:= 0
		else
			sumatoriaEdad:= sumatoriaEdad(a^.HI) + sumatoriaEdad(a^.HD) + a^.dato.edad;
	end;
	
	function promedio(): real;
	begin
		promedio:= sumatoriaEdad(a) / cantidad(a);
	end;

begin
	writeln('---');
	writeln;
	writeln('Informar promedio de edad entre socios: ', promedio:1:1);
	writeln;
	writeln('---');
end;

//Inciso ix
procedure informarCantidadEntreValores(a: TArbol);
	
	procedure leerValores(var a, b: integer);
	begin
		writeln('---');
		write('Ingrese valor a (minimo): ');
		readln(a);
		writeln;
		write('Ingrese valor b (maximo): ');
		readln(b);
		writeln('---');
	end;
	
	procedure cantidadEntreValores(a: TArbol; n1, n2: integer; var cant: integer);
	begin
		if(a <> nil) then begin
			cantidadEntreValores(a^.HI, n1, n2, cant);
			if(a^.dato.numero > n1) and (a^.dato.numero < n2) then
				cant:= cant + 1;
			cantidadEntreValores(a^.HD, n1, n2, cant);
		end;
	end;
var
	min, max: integer;
	cant: integer;
begin
	cant:= 0;
	writeln('---');
	writeln;
	writeln('Informar cantidad de socios entre 2 valores...');
	writeln;
	leerValores(min, max);
	cantidadEntreValores(a, min, max, cant);
	writeln;
	writeln('Cantidad de socios con nro entre ',min, ' y ', max,' es: ', cant);
	writeln('---');
end;

//Inciso x
procedure informarNroSocioCreciente(a: TArbol);
	
	procedure imprimirEnOrden(a: TArbol);
	begin
		if(a <> nil) then begin
			imprimirEnOrden(a^.HI);
			writeln('-> Nro Socio: ', a^.dato.numero);
			imprimirEnOrden(a^.HD);
		end;
	end;

begin
	writeln('---');
	writeln;
	writeln('Nros de socio de forma creciente...');
	writeln;
	imprimirEnOrden(a);
	writeln('---');
end;

//Inciso xi
procedure informarNroSocioParDecreciente(a: TArbol);

	function esPar(n: integer): boolean;
	begin
		esPar:= (n MOD 2) = 0;
	end;
	
	procedure imprimirDecreciente(a: TArbol);
	begin
		if(a <> nil) then begin
			imprimirDecreciente(a^.HD);
			if(esPar(a^.dato.numero)) then
				writeln('-> Nro de socio: ', a^.dato.numero);
			imprimirDecreciente(a^.HI);
		end;
	end;

begin
	writeln('---');
	writeln;
	writeln('Nros de socio par de forma decreciente...');
	writeln;
	imprimirDecreciente(a);
	writeln('---');
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
	informarSocioNroMasGrande(a);
	informarSocioNroMasChico(a);
	informarMaximoEdad(a);
	aumentarEdad(a);
	informarNroSocioExiste(a);
	informarNombreSocioExiste(a);
	informarCantidadSocios(a);
	informarPromedioEdad(a);
	informarCantidadEntreValores(a);
	informarNroSocioCreciente(a);
	informarNroSocioParDecreciente(a);
end.
