{
4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}

program ejercicio4;
const 
	DIMF = 20;
type
	TRangoVector = 1..DIMF;
	
	TVector = array [TRangoVector] of integer;
	
//Inciso A
procedure generarVector(var v: TVector; var dimL: integer);
var
	n: integer;
begin
	if(dimL < DIMF) then begin
		n:= random(100) + 1;
		writeln('Numero: ', n);
		dimL:= dimL + 1;
		v[dimL]:= n;
		generarVector(v, dimL);
	end;
end;

//Inciso B
function maximoValor(v: TVector; dimL, max: integer ): integer;
begin
	if(dimL = 0) then
		maximoValor:= max
	else begin
		if(v[dimL] > max) then
			max:= v[dimL];
		maximoValor:= maximoValor(v, dimL - 1, max);
	end;
end;

//Inciso C
function sumaTotal(v: TVector; dimL: integer): integer;
begin
	if(dimL = 0) then
		sumaTotal:= 0
	else
		sumaTotal:= v[dimL] + sumaTotal(v, dimL - 1);
end;

var
	v: TVector;
	dimL, max: integer;
begin
	Randomize;
	dimL:= 0;
	max:= 0;
	generarVector(v, dimL);
	writeln('El valor maximo es: ', maximoValor(v, dimL, max));
	writeln(' ');
	writeln('La suma total de los elementos es: ', sumaTotal(v, dimL));
end.


