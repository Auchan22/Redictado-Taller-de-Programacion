{
Realizar un programa que lea números hasta leer el valor 0 e imprima,
* para cada número leído, sus dígitos en el orden en que aparecen en el número. 
* Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. 
* Ejemplo si se lee el valor 256, se debe imprimir 2  5  6
}

program ejercicio2;

procedure imprimirDigitos(n: integer);
begin
	if (n <> 0) then begin
		{writeln(n DIV 10);}
		imprimirDigitos(n DIV 10);
		write(n MOD 10, ' ');
	end;
end;

procedure leerNumeros();
var
	n: integer;
begin
	writeln('Ingrese un numero: ');
	readln(n);
	
	while(n <> 0) do begin
		
		imprimirDigitos(n);
		writeln(' ');
		writeln('Ingrese un numero: ');
		readln(n);
	end;
end;
begin
	leerNumeros();
end.
