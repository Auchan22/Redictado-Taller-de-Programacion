program ejercicio2;
const
	MAXF = 2018;
type
	
	TRangoFabricacion = 2010..MAXF;
	
	TString = string[20];
	
	TAuto = record
		patente: integer;
		aFabricacion: TRangoFabricacion;
		marca: TString;
		modelo: integer;
	end;

	TArbol = ^TNodo;
	TNodo = record
		dato: TAuto;
		HI: TArbol;
		HD: TArbol;
	end;
	
	TAutoAguardar = record
		patente: integer;
		marca: TString;
		modelo: integer;
	end;
	
	TLista = ^TNodoLista;
	TNodoLista = record
		dato: TAutoAguardar;
		sig: TLista;
	end;
	
	TVector = array[TRangoFabricacion] of TLista;

//Inciso A
procedure cargarArbol(var a: TArbol);

	procedure leerAuto(var a: TAuto);
	begin
		writeln;
		writeln('---');
		a.patente := random(50);
		writeln('Ingrese nro de patente: ', a.patente);
		if(a.patente <> 0) then begin
			a.aFabricacion := random(8) + 2011;
			writeln('Ingrese anio de fabricacion: ', a.aFabricacion);
			write('Ingrese marca: ');
			readln(a.marca);
			a.modelo:= random(10) + 1;
			writeln('Ingrese modelo: ', a.modelo);
		end;
		writeln('---');
		writeln;
	end;

	procedure crear(var a: TArbol; au: TAuto);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= au;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if(a^.dato.patente > au.patente) then
				crear(a^.HI, au)
			else
				crear(a^.HD, au);
	end;
	
var
	au: TAuto;
begin
	writeln;
	leerAuto(au);
	while(au.patente <> 0) do begin
		crear(a, au);
		leerAuto(au);
	end;
	writeln;
end;

//Inciso b

procedure informarCantMarca(a: TArbol);

	procedure leerMarca(var m: TString);
	begin
		writeln;
		writeln('---');
		write('Ingrese la marca a buscar: ');
		readln(m);
		writeln('---');
		writeln;
	end;
	
	function busqueda(a: TArbol; m: TString): integer;
	begin
		if(a = nil) then 
			busqueda:= 0
		else begin
			if(a^.dato.marca = m) then
				busqueda:= 1 + busqueda(a^.HI, m) + busqueda(a^.HD, m)
			else
				busqueda:= busqueda(a^.HI, m) + busqueda(a^.HD, m);
		end;
	end;

var
	m: TString;
begin
	writeln;
	leerMarca(m);
	writeln('La cantidad de autos de la marca ', m, ' es: ', busqueda(a, m));
	writeln;
end;

//Inciso C
procedure inicializarVector(var v: TVector);
var
	i: TRangoFabricacion;
begin
	for i:= 2010 to MAXF do
		v[i]:= nil;
end;

procedure cargarVector(var v: TVector; a: TArbol);

	procedure cargarDatosAguardar(a: TAuto; var ag: TAutoAguardar);
	begin
		ag.patente:= a.patente;
		ag.marca:= a.marca;
		ag.modelo:= a.modelo;
	end;
	
	procedure agregarAdelante(var L: TLista; ag: TAutoAguardar);
	var
		nue: TLista;
	begin
		new(nue);
		nue^.dato:= ag;
		nue^.sig:= L;
		L:= nue;
	end;

var
	ag: TAutoAguardar;
begin
	if(a <> nil) then begin
		cargarDatosAguardar(a^.dato, ag);
		agregarAdelante(v[a^.dato.aFabricacion], ag);
		cargarVector(v, a^.HI);
		cargarVector(v, a^.HD);
	end;
end;

//Inciso D
procedure informarDatoAuto(a: TArbol);

	procedure leerPatente(var p: integer);
	begin
		writeln;
		writeln('---');
		write('Ingrese la patente a buscar: ');
		readln(p);
		writeln('---');
		writeln;
	end;
	
	function busqueda(a: TArbol; p: integer): integer;
	begin
		if(a = nil) then
			busqueda:= -1
		else
			if(a^.dato.patente = p) then
				busqueda:= a^.dato.aFabricacion
			else
				if(a^.dato.patente > p) then
					busqueda:= busqueda(a^.HI, p)
				else
					busqueda:= busqueda(a^.HD, p);
	end;

var
	p: integer;
	result: integer;
begin
	writeln;
	leerPatente(p);
	result:= busqueda(a, p);
	if(result = -1) then
		writeln('El auto con esa patente no existe')
	else
		writeln('Anio de fabricacion: ', result);
	writeln;
end;

//Funciones Varias
procedure imprimirDatos2(a: TAutoAguardar);
begin
	writeln('/\/\/\/\');
	writeln(' -> Patente: ', a.patente);
	writeln(' -> Marca: ', a.marca);
	writeln(' -> Modelo: ', a.modelo);
	writeln('\/\/\/\/');
end;

procedure imprimirLista(L: TLista);
begin
	if(L <> nil) then begin
		imprimirDatos2(L^.dato);
		imprimirLista(L^.sig);
	end;
end;

procedure imprimirVector(v: TVector);
var
	i: TRangoFabricacion;
begin
	for i:= 2010 to MAXF do begin
		writeln('Imprimiendo datos del año ', i);
		if(v[i] = nil) then
			writeln('Lista vacia')
		else
			imprimirLista(v[i]);
	end;
end;

procedure imprimirDatos(a: TAuto);
begin
	writeln('/\/\/\/\');
	writeln(' -> Patente: ', a.patente);
	writeln(' -> Anio de Fabricacion: ', a.aFabricacion);
	writeln(' -> Marca: ', a.marca);
	writeln(' -> Modelo: ', a.modelo);
	writeln('\/\/\/\/');
end;

procedure imprimirArbol(a: TArbol);
begin
	if(a <> nil) then begin
		imprimirArbol(a^.HI);
		imprimirDatos(a^.dato);
		imprimirArbol(a^.HD);
	end;
end;

var
	a: TArbol;
	v: TVector;
begin
	Randomize;
	a:= nil;
	cargarArbol(a);
	imprimirArbol(a);
	informarCantMarca(a);
	inicializarVector(v);
	cargarVector(v, a);
	imprimirVector(v);
	informarDatoAuto(a);
end.
