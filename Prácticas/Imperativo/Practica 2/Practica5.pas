{
5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); 

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.
}

program ejercicio5;
const
	DIMF = 10;
type
	TRangoVector = 1..DIMF;
	
	TVector = array[TRangoVector] of integer;
	
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

procedure ordenarSeleccion(var v:TVector; dimL: integer);
var
	i, j, p, item: integer;
begin
	for i:= 1 to dimL - 1 do begin
		p:= i;
		for j:= i+1 to dimL do
			if(v[j] < v[p]) then p:= j;
		item:= v[p];
		v[p] := v[i];
		v[i]:= item;
	end;
end;

procedure busquedaDicotomica(v: TVector; ini,fin: integer; dato:integer; var pos: integer);
var
	medio: integer;
begin
	medio:= (ini + fin) DIV 2;
	while(ini <= fin) and (dato <> v[medio]) do begin
		if(dato < v[medio]) then
			fin := medio - 1
		else
			ini:= medio + 1;
		medio := (ini + fin) DIV 2;
	end;
	if(ini <= fin) then
		pos:= medio
	else
		pos:= -1
end;

procedure imprimirVector(v: TVector; dimL: integer);
begin
	if(dimL > 0) then begin
		imprimirVector(v, dimL - 1);
		writeln('Elemento en la pos ', dimL, ' es: ', v[dimL]);
	end;
end;

var
	v: TVector;
	dimL, ini, dato, pos: integer;
begin
	Randomize;
	dimL:= 0;
	ini:= 1;
	pos:= -1;
	generarVector(v, dimL);
	ordenarSeleccion(v, dimL);
	imprimirVector(v, dimL);
	writeln(' ');
	writeLN('Ingrese elemento a buscar: ');
	readln(dato);
	writeln(' ');
	busquedaDicotomica(v, ini, dimL, dato, pos);
	if(pos = -1) then
		writeln('No se encontro el elemento')
	else
		writeln('El elemento esta en la pos: ', pos);
end.
