{
4.- Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. 
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. 
* El ingreso de los productos finaliza cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. 
* Considerar que puede haber más o menos de 30 productos del rubro 3. 
* Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría. 
e. Muestre los precios del vector ordenado.

}

program ejercicio4;
const
	dimF = 8;
type
	rangoRubro = 1..dimF;
	producto = record
		codigoP: integer;
		codigoR: rangoRubro;
		precio: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	
	vector = array[rangoRubro] of lista;
	vectorProductos = array[1..30] of producto;
	
procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= nil;
end;
	
procedure cargarVector(var v: vector);

	procedure leerProducto(var p: producto);
	begin
		writeln('---');
		p.codigoP:= random(100);
		writeln('Codigo del producto: ', p.codigoP);
		if(p.codigoP <> 0) then begin
			p.codigoR:= random(dimF) + 1;
			writeln('Codigo de rubro: ', p.codigoR);
			p.precio:= random(1000);
			writeln('Precio del producto: ', p.precio);
		end;
		writeln('---');
	end;
	
	procedure insertarOrdenado(var L: lista; p: producto);
	var 
		ant, nue, act: lista;
	begin
		new (nue);
		nue^.dato := p;
		act := L;
		ant := L;
		while (act<>NIL) and (act^.dato.codigoP < p.codigoP) do 
		begin
			ant := act;
			act := act^.sig ;
		end;
		if (ant = act)  then 
			L := nue   
		else  
			ant^.sig  := nue; 
		nue^.sig := act ;
	end;

var
	p: producto;
begin
	writeln(' ');
	writeln('Cargando vector...');
	leerProducto(p);
	while(p.codigoP <> 0) do begin
		insertarOrdenado(v[p.codigoR], p);
		leerProducto(p);
	end;
	writeln(' ');
end;

procedure imprimirVector(v: vector);

	procedure imprimirProducto(p: producto);
	begin
		writeln('---');
		writeln('-> Codigo del Producto: ', p.codigoP);
		{writeln('-> Rubro del Producto: ', p.codigoR);}
		writeln('-> Precio del Producto: ', p.precio);
		writeln('---');
	end;

	procedure imprimirLista(L: lista);
	begin
		while(L <> nil) do begin
			imprimirProducto(L^.dato);
			L:= L^.sig;
		end;
	end;

var
	i: integer;
begin
	writeln('---');
	for i:= 1 to dimF do begin
		writeln('Imprimiendo rubro ', i);
		imprimirLista(v[i]);
	end;
	writeln('---');
end;

procedure cargarVectorRubro3(var v: vectorProductos; var dimL: integer; vO: vector);
var
	LActual: lista;
begin
	LActual:= vO[3];
	while(LActual <> nil) and (dimL <= 30) do begin
		dimL:= dimL + 1;
		v[dimL] := LActual^.dato;
		LActual:= LActual^.sig;
	end;
end;

procedure ordenarInsercion(var v: vectorProductos; dimL: integer);
var
	i, j: integer;
	item: producto;
begin
	for i:= 2 to dimL do begin
		item:= v[i];
		j:= i - 1;
		while(j > 0) and (v[j].precio > item.precio) do begin
			v[j + 1]:= v[j];
			j:= j - 1;
		end;
		v[j + 1]:= item;
	end;
end;

procedure imprimirVectorOrdenado(v: vectorProductos; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('-> ', v[i].precio);
	end;
end;

var
	v: vector;
	vP: vectorProductos;
	dimL: integer;
begin
	dimL:= 0;
	Randomize;
	inicializarVector(v);
	cargarVector(v);
	imprimirVector(v);
	cargarVectorRubro3(vP, dimL, v);
	imprimirVectorOrdenado(vP, dimL);
	ordenarInsercion(vP, dimL);
	writeln(' ');
	imprimirVectorOrdenado(vP, dimL);
end.
