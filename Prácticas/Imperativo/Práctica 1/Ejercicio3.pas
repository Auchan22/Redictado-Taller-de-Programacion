{
3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. 
* De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
*  y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. 
* La lectura finaliza cuando se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.

}

program ejercicio3;
const
	dimF = 8;
type
	rangoGenero = 1..dimF;
	pelicula = record
		codigoP: integer;
		codigoG: rangoGenero;
		puntaje: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	vector = array[rangoGenero] of lista;
	
	pelicula2 = record
		codigoP: integer;
		puntaje: real;
	end;
	
	vectorPuntaje = array[rangoGenero] of pelicula2;

procedure CargarVector(var v: vector);

	procedure LeerPelicula(var p: pelicula);
	begin
		writeln('---');
		p.codigoP:= random(200) - 1;
		writeln('Codigo de pelicula: ', p.codigoP);
		if(p.codigoP <> -1) then begin
			p.codigoG:= random(dimF) + 1;
			writeln('Codigo de Genero: ', p.codigoG);
			p.puntaje:= random(10);
			writeln('Puntaje: ', p.puntaje);
		end;
		writeln('---');
	end;
	
	procedure agregarAtras(var pri: lista; p: pelicula);
	var
		nue, act: lista;
	begin
		new(nue);
		nue^.dato:= p;
		nue^.sig:= nil;
		if pri <> Nil then 
		begin
			act := pri ;
			while  (act^.sig <> NIL ) do 
				act := act^.sig ;
			act^.sig := nue ;
		end
		else
			pri:= nue;
	end;
	
var
	p: pelicula;
begin
	writeln(' ');
	writeln('Cargando Vector...');
	LeerPelicula(p);
	while(p.codigoP <> -1) do begin
		agregarAtras(v[p.codigoG], p);
		LeerPelicula(p);
	end;
	writeln(' ');
end;

procedure imprimirVector(v: vector);

	procedure imprimirPelicula(p: pelicula);
	begin
		writeln('---');
		writeln('-> Codigo Pelicula: ', p.codigoP);
		writeln('-> Codigo Genero: ', p.codigoG);
		writeln('-> Puntaje: ', p.puntaje:0:0);
		writeln('---');
	end;
	
	procedure imprimirLista(L: lista);
	begin
		while(L <>  nil) do begin
			imprimirPelicula(L^.dato);
			L:= L^.sig;
		end;
	end;

var
	i: integer;
begin
	writeln(' ');
	writeln('Imprimiendo vector...');
	for i:= 1 to dimF do begin
		writeln('Imprimiendo genero ', i);
		imprimirLista(v[i]);
	end;
	writeln(' ');
end;

procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= nil;
end;

procedure GenerarVectorPuntaje(v: vector; var v2: vectorPuntaje);

	procedure maximo(var mp: real; var mc: integer; p: real; c: integer);
	begin
		if(p >= mp) then begin
			mp:= p;
			mc:= c;
		end;
	end;

	function encontrarMaximo(L: lista): pelicula2;
	var
		maxPuntaje: real;
		maxCodigo: integer;
		p: pelicula2;
	begin
		maxCodigo:= 999;
		maxPuntaje:= 0;
		while(L <> nil) do begin
			maximo(maxPuntaje, maxCodigo, L^.dato.puntaje, L^.dato.codigoP);
			L:= L^.sig;
		end;
		p.codigoP:= maxCodigo;
		p.puntaje:= maxPuntaje;
		encontrarMaximo:= p;
	end;

var
	i: integer;
begin
	for i:= 1 to dimF do begin
		v2[i]:= encontrarMaximo(v[i]);
	end;
end;

procedure imprimirVectorPuntaje(vP: vectorPuntaje);
var
	i: integer;
begin
	writeln('---');
	for i:= 1 to dimF do
		writeln('Genero: ', i, ' | Codigo Pelicula con Max puntaje: ', vP[i].codigoP);
	writeln('---');
end;

procedure ordenarSeleccion(var vP: vectorPuntaje);
var
	i, j, p: integer;
	actual: pelicula2;
begin
	for i:= 1 to dimF - 1 do begin
		p:= i;
		for j:= 2 to dimF do
			if (vP[j].puntaje < vP[p].puntaje) then p:= j;
		actual:= vP[p];
		vP[p]:= vP[i];
		vP[i]:= actual;
	end;
end;

procedure incisoD(vP: vectorPuntaje);
begin
	writeln('Pelicula con menor puntaje: Codigo: ', vP[1].codigoP, ' Puntaje: ', vP[1].puntaje);
	writeln('Pelicula con mayor puntaje: Codigo: ', vP[dimF].codigoP, ' Puntaje: ', vP[dimF].puntaje);
end;

var
	v: vector;
	vP: vectorPuntaje;
begin
	Randomize;
	inicializarVector(v);
	CargarVector(v);
	imprimirVector(v);
	GenerarVectorPuntaje(v, vP);
	imprimirVectorPuntaje(vP);
	ordenarSeleccion(vP);
	incisoD(vP);
end.
