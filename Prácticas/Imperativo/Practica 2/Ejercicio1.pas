{
 1.- Implementar un programa que invoque a los siguientes módulos.
a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. 
El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados.

}

program ejercicio1;
const 
	DIMF = 10;
type
	TRangoVector = 1..DIMF;
	TVector = array[TRangoVector] of char;
	
	TLista = ^TNodo;
	TNodo = record
		dato: char;
		sig: TLista;
	end;

//Inciso A
procedure leerSecuencia(var v: TVector; var dimL: integer);
var
	c: char;
begin
	readln(c);
	if(c <> '.') and (dimL < DIMF) then begin
		dimL:= dimL + 1;
		v[dimL]:= c;
		leerSecuencia(v, dimL);
	end;
end;

//Inciso B
procedure imprimir(v: TVector; dimL: integer);
var
	i: integer;
begin
	if(dimL <> 0) then
		for i:= 1 to dimL do
			writeln('Elemento ', i, ': ',v[i])
	else
		writeln('El vector esta vacio :(');
end;

//Inciso C
procedure imprimirRecursivo(v: TVector; dimL: integer);
begin
	if(dimL > 0) then begin
		imprimirRecursivo(v, dimL - 1);
		writeln('Elemento ', dimL, ': ',v[dimL]);
	end;
end;

//Inciso D
function contarCaracteres(): integer;
var
	c: char;
begin
	readln(c);
	if(c = '.') then
		contarCaracteres:= 0
	else
		contarCaracteres:= 1 + contarCaracteres();
end;

//Inciso E
function listaCaracteres(): TLista; // Agregar adelante de manera "recursiva" 
var
	c: char;
	nue: TLista;
begin
	readln(c);
	new(nue);
	nue^.dato:= c;
	nue^.sig:= nil;
	if(c = '.') then
		listaCaracteres:= nil
	else begin
		nue^.sig:= listaCaracteres();
		listaCaracteres:= nue;
	end;
end;

{
procedure generarLista(var L, ult: TLista);
	procedure agregarAtras(var L, ult: TLista; c: char);
	var
		nue: TLista;
	begin
		new(nue);
		nue^.dato:= c;
		nue^.sig:= nil;
		if(L <> nil) then
			ult^.sig:= nue
		else
			L:= nue;
		ult:= nue;
	end;
var
	c: char;
begin
	writeln('Ingrese un caracter: ');
	readln(c);
	if(c <> '.') then begin
		agregarAtras(L, ult, c);
		generarLista(L, ult);
	end;
end;
}

//Inciso F
procedure imprimirListaEnOrden(L: TLista);
begin
	if(L <> nil) then begin
		writeln('Elemento: ', L^.dato);
		imprimirListaEnOrden(L^.sig);
	end;
end;

//Inciso G
procedure imprimirListaEnDesorden(L: TLista);
begin
	if(L <> nil) then begin
		imprimirListaEnDesorden(L^.sig);
		writeln('Elemento: ', L^.dato);
	end;
end;

var
	v: TVector;
	dimL, cantCaracteres: integer;
	L: TLista;
begin
	dimL:= 0;
	L:= nil;
	
	writeln('---');
	writeln('Comenzando ejecucion...');
	writeln(' ');
	
	leerSecuencia(v, dimL);
	writeln(' ');
	imprimir(v, dimL);
	writeln(' ');
	imprimirRecursivo(v, dimL);
	writeln(' ');
	writeln('Contando caracteres...');
	writeln(' ');
	cantCaracteres:= contarCaracteres();
	writeln('La cantidad de caracteres es: ', cantCaracteres);
	writeln(' ');
	writeln('Leyendo caracteres...');
	writeln(' ');
	{generarLista(L, ult)};
	L:= listaCaracteres();
	imprimirListaEnOrden(L);
	writeln(' ');
	imprimirListaEnDesorden(L);
	writeln('---');
end.
