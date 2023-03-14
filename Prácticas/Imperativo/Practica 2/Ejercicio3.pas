{

3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. 

}

program ejercicio3;
const
	MAXNUM = 100;
	MINNUM = 0;
type
	TLista = ^TNodo;
	TNodo = record
		dato: integer;
		sig: TLista;
	end;

//Inciso A
procedure generarLista(var L: TLista);

	procedure agregarAdelante(var L: TLista; n: integer);
	var
		nue: TLista;
	begin
		new(nue);
		nue^.dato:= n;
		nue^.sig:=L;  
		L:=nue;
	end;

var
	n: integer;
begin
	n:= random(MAXNUM);
	writeln('Numero generado: ', n);
	if(n <> 0) then begin
		agregarAdelante(L, n);
		generarLista(L);
	end;
end;

//Inciso B
function minimoRecursivo(L: TLista; min: integer): integer;
begin
	if(L = nil) then
		minimoRecursivo:= min
	else begin
		if(L^.dato < min) then
			min:= L^.dato;
		L:= L^.sig;
		minimoRecursivo:= minimoRecursivo(L, min);
	end;
end;

//Inciso C
function maximoRecursivo(L: TLista; max: integer): integer;
begin
	if(L = nil) then
		maximoRecursivo:= max
	else begin
		if(L^.dato > max) then
			max:= L^.dato;
		L:= L^.sig;
		maximoRecursivo:= maximoRecursivo(L, max);
	end;
end;

//Inciso D
function encontrarNumero(L: TLista; n: integer): boolean;
begin
	if(L = nil) then
		encontrarNumero:= false
	else begin
		if(L^.dato = n) then
			encontrarNumero:= true
		else
			encontrarNumero:= encontrarNumero( L^.sig, n);
	end;
end;

procedure imprimirLista(L: TLista);
begin
	if(L <> nil) then begin
		writeln('Elemento: ', L^.dato);
		imprimirLista(L^.sig);
	end;
end;

var
	L: TLista;
	max, min, numFind: integer;
begin
	Randomize;
	L:= nil;
	max:= 0;
	min:= 100;
	
	writeln('---');
	writeln('Comenzando ejecución...');
	writeln(' ');
	generarLista(L);
	imprimirLista(L);
	writeln(' ');
	writeln('El maximo es: ', maximoRecursivo(L, max));
	writeln(' ');
	writeln('El minimo es: ', minimoRecursivo(L, min));
	writeln(' ');
	writeln('Ingrese numero a buscar: (entre 1 y 99)');
	readln(numFind);
	if(encontrarNumero(L, numFind)) then
		writeln('El elemento se encontro')
	else
		writeln('El elemento no se encuentra en la lista');
	writeln(' ');
	writeln('---');
end.
