{
6.- Realizar un programa que lea números y que utilice un procedimiento 
* recursivo que escriba el equivalente en binario de un número decimal. 
* El programa termina cuando el usuario ingresa el número 0 (cero). 

Ayuda:  Analizando las posibilidades encontramos que: 
* Binario (N) es N si el valor es menor a 2. ¿Cómo obtenemos los dígitos que componen al número? 
* ¿Cómo achicamos el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, 
* el programa debe mostrar: 10111.

}

program ejercicio6;

procedure digitoBinario(n: integer); //Empezamos del valor mas grande en binario, al mas chico, es decir, se escribe de izquierda a derecha
begin
	if(n > 0) then begin
		digitoBinario(n DIV 2); //Le paso a la proxima iteracion, el resultado de dividir n entre 2
		write(n MOD 2); //El restante, es lo que me va a marcar un 1 o 0 en el digito x
	end;
end;

procedure leerNumeros();
var
	n: integer;
begin
	writeln('Ingrese un numero: ');
	readln(n);
	if(n <> 0) then begin
		digitoBinario(n);
		writeln(' ');
		leerNumeros();
	end;
end;

begin
	leerNumeros();
end.
