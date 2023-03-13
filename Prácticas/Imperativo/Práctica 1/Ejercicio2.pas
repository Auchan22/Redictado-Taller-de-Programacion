{
* 2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. 
* De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. 
* La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}


program ej2p1;
const
	dimF = 300;
type
	oficina = record
		codigo: integer;
		dni: integer;
		valor: integer;
	end;
	
	vector = array[1..dimF] of oficina;

procedure GenerarVector(var v: vector; var dimL: integer);

	procedure LeerOficina(var o: oficina);
	begin
		writeln('-----');
		o.codigo:= random(300) - 1;
		writeln('Ingrese codigo de oficina: ', o.codigo);
		if(o.codigo <> -1) then begin
			o.dni:= random(100) + 1;
			writeln('Ingrese DNI del propietario: ', o.dni);
			o.valor:= random(4000) + 1;
			writeln('Ingrese Valor de las expensas: ', o.valor);
		end;
		writeln('-----');
	end;
	
var
	o: oficina;
begin
	writeln(' ');
	writeln('Iniciando carga...');
	LeerOficina(o);
	while(o.codigo <> -1) do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		LeerOficina(o);
	end;
	writeln(' ');
end;

procedure imprimirVector(v: vector; dimL: integer);

	procedure imprimirOficina(o: oficina);
	begin
		writeln(' ');
		writeln('-> Codigo de oficina: ', o.codigo);
		writeln('-> Dni del propietario: ', o.dni);
		writeln('-> Valor de la expensa: ', o.valor);
		writeln(' ');
	end;
	
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		imprimirOficina(v[i]);
	end;
end;

procedure ordenarInsercion(var v: vector; dimL: integer);
var
	i,j: integer;
	actual: oficina;
begin
	for i:= 2 to dimL do begin
		actual:= v[i];
		j:= i - 1;
		while(j > 0) and (v[j].codigo > actual.codigo) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j + 1]:= actual;
	end;
end;

procedure ordenarSeleccion(var v: vector; dimL: integer);
var
	i, j, p: integer;
	item: oficina;
begin
	for i:= 1 to dimL - 1 do begin
		p:= i;
		for j:= i+1 to dimL do 
			if(v[j].codigo < v[p].codigo) then p:= j;
			
		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;
	end;
end;
var
	v: vector;
	dimL: integer;
begin
	Randomize;
	dimL:= 0;
	GenerarVector(v, dimL);
	if(dimL = 0) then
		writeln('--- Vector Vacio :( ---')
	else begin
		imprimirVector(v, dimL);
		ordenarInsercion(v, dimL);
		writeln('---');
		writeln('Vector Ordenado');
		writeln('---');
		imprimirVector(v, dimL);
	end;
end.
