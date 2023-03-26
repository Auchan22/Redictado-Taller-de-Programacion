program ejercicio3;
const
	DIMF = 10;
type
	
	TRangoRubro = 1..DIMF;
	
	TProducto = record
		codigo: integer;
		rubro: TRangoRubro;
		stock: integer;
		precio: integer;
	end;
	
	TProductoAguardar = record
		codigo: integer;
		stock: integer;
		precio: integer;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TProductoAguardar;
		HD: TArbol;
		HI: Tarbol;
	end;
	
	TVector = array[TRangoRubro] of TArbol;

	TParametros = record
		codigo: integer;
		rubro: TRangoRubro;
	end;
	
	TParametros2 = record
		max: integer;
		min: integer;
	end;
	
//Inciso A
procedure inicializarVector(var v: TVector);
var
	i: TRangoRubro;
begin
	for i:= 1 to DIMF do 
		v[i]:= nil;
end;

procedure cargarVector(var v: TVector);

	procedure leerProducto(var p: TProducto);
	begin
		writeln;
		writeln('---');
		p.codigo:= random(50) - 1;
		writeln('Ingrese codigo de producto: ', p.codigo);
		if(p.codigo <> -1) then begin
			p.rubro:= random(DIMF) + 1;
			writeln('Ingrese rubro de producto: ', p.rubro);
			p.stock:= random(100);
			writeln('Ingrese stock de producto: ', p.stock);
			p.precio:= random(200) + 200;
			writeln('Ingrese precio de producto: ', p.precio);
		end;
		writeln('---');
		writeln;
	end;
	
	procedure crear(var a: TArbol; p: TProductoAguardar);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if(a^.dato.codigo > p.codigo) then
				crear(a^.HI, p)
			else
				crear(a^.HD, p)
	end;
	
	procedure cargarDatosAguardar(p: TProducto; var pg: TProductoAguardar);
	begin
		pg.codigo:= p.codigo;
		pg.stock:= p.stock;
		pg.precio:= p.precio;
	end;
	
var
	p: TProducto;
	pg: TProductoAguardar;
begin
	leerProducto(p);
	while(p.codigo <> -1) do begin
		cargarDatosAguardar(p, pg);
		crear(v[p.rubro], pg);
		leerProducto(p);
	end;
end;

//Inciso B
procedure informarExiste(v: TVector);

	procedure leerParametros(var p: TParametros);
	begin
		writeln;
		writeln('---');
		write('Ingrese el rubro a buscar (1-10): ');
		readln(p.rubro);
		write('Ingrese el codigo a buscar: ');
		readln(p.codigo);
		writeln('---');
		writeln;
	end;
	
	function busqueda(a: TArbol; c: integer): boolean;
	begin
		if(a = nil) then
			busqueda:= false
		else
			if(a^.dato.codigo = c) then
				busqueda:= true
			else
				busqueda:= busqueda(a^.HI, c) or busqueda(a^.HD, c);
	end;

var
	p: TParametros;
begin
	writeln;
	leerParametros(p);
	if(busqueda(v[p.rubro], p.codigo)) then
		writeln('El producto del rubro: ', p.rubro, ' con codigo: ', p.codigo, ' existe!')
	else
		writeln('El producto del rubro: ', p.rubro, ' con codigo: ', p.codigo, ' no existe!');
	writeln;
end;

//Inciso C
procedure imprimirDatos(p: TProductoAguardar);
begin
	writeln('/\/\/\/\');
	writeln(' -> Codigo: ', p.codigo);
	writeln(' -> Stock: ', p.stock);
	writeln('\/\/\/\/');
end;

function Maximo(a: TArbol):TArbol;
begin
	if(a = nil) then
		Maximo:= nil
	else
		if(a^.HD = nil) then
			Maximo:= a
		else
			Maximo:= Maximo(a^.HD);
end;

procedure imprimirMayor(a: TArbol);
begin
	imprimirDatos(Maximo(a)^.dato);
end;

procedure imprimirVector(v: TVector);
var
	i: TRangoRubro;
begin
	for i:= 1 to DIMF do begin
		writeln('Imprimiendo productos del rubro: ', i);
		if(v[i] = nil) then
			writeln('Arbol vacio...')
		else
			imprimirMayor(v[i]);
	end;
end;

//Inciso D
procedure informarEntre(v: TVector);

	procedure leerParametros(var p: TParametros2);
	begin
		writeln;
		writeln('---');
		write('Ingrese el codigo min: ');
		readln(p.min);
		write('Ingrese el codigo max: ');
		readln(p.max);
		writeln('---');
		writeln;
	end;
	
	procedure recorridoAcotado(p: TParametros2; a: TArbol; var cant: integer);
	begin
		if(a <> nil) then
			if(a^.dato.codigo >= p.min) then
				if(a^.dato.codigo <= p.max) then begin
					cant:= cant + 1;
					recorridoAcotado(p, a^.HI, cant);
					recorridoAcotado(p, a^.HD, cant);
				end
			else
				recorridoAcotado(p, a^.HI, cant)
		else
			recorridoAcotado(p, a^.HD, cant);
	end;

var
	p: TParametros2;
	i: TRangoRubro;
	cant: integer;
begin
	writeln;
	leerParametros(p);
	for i:= 1 to DIMF do begin
		cant:= 0;
		recorridoAcotado(p, v[i], cant);
		writeln('La cantidad de productos del rubro: ', i, ' entre los codigos ', p.min, ' y ', p.max, ' son: ', cant);
	end;
	writeln;
end;

var
	v: TVector;
begin
	Randomize;
	inicializarVector(v);
	cargarVector(v);
	informarExiste(v);
	imprimirVector(v);
	informarEntre(v);
end.
