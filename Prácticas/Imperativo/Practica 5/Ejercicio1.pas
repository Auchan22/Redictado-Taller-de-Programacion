program ejercicio1;
const
	DIMF = 300;
type
	TOficina = record
		codeIdentificacion: integer;
		dni: integer;
		valor: integer;
	end;
	
	TVector = array[1..DIMF] of TOficina;
	
//Inciso A
procedure generarVector(var v: TVector; var dimL: integer);

	procedure leerOficina(var o: TOficina);
	begin
		writeln;
		writeln('---');
		o.codeIdentificacion:= random(100) - 1;
		writeln('Ingrese codigo de identificacion: ', o.codeIdentificacion);
		if(o.codeIdentificacion <> -1) then begin
			o.dni:= random(1000) + 1;
			writeln('Ingrese dni: ', o.dni);
			o.valor:= random(200) + 300;
			writeln('Ingrese valor de la expensa: ',o.valor);
		end;
		writeln('---');
		writeln;
	end;

var
	o: TOficina;
begin
	writeln;
	leerOficina(o);
	while(o.codeIdentificacion <> -1) and (dimL < DIMF) do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		leerOficina(o);
	end;
	writeln;
end;

//Inciso B
procedure ordenarSeleccion(var v: TVector; dimL: integer);
var
	i, j, p: integer;
	item: TOficina;
begin
	for i:= 1 to dimL - 1 do begin
		p:= i;
		for j:= i+1 to dimL do
			if(v[j].codeIdentificacion < v[p].codeIdentificacion) then
				p:= j;
		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;
	end;
end;

//Inciso C
procedure informarPropietario(v: TVector; dimL: integer);

	procedure busquedaDicotomica(v: TVector; dimL, c: integer; var pos: integer);
	var
		pri, ult, med: integer;
	begin
		pri:= 1;
		ult:= dimL;
		med:= (pri + ult) DIV 2;
		while(pri <= ult) and (c <> v[med].codeIdentificacion) do begin
			if(c < v[med].codeIdentificacion) then
				ult:= med - 1
			else
				pri:= med + 1;
			med:= (pri + ult) DIV 2;
		end;
		
		if(pri <= ult) then
			pos:= med
		else
			pos:= -1;
	end;
	
	procedure leerParametro(var c: integer);
	begin
		writeln;
		write('Ingrese codigo de busqueda: ');
		readln(c);
		writeln;
	end;

var
	pos, cBusqueda: integer;
begin
	pos:= -1;
	leerParametro(cBusqueda);
	busquedaDicotomica(v, dimL, cBusqueda, pos);
	writeln('---');
	if(pos <> -1) then
		writeln('El dni del propietario de la oficina con codigo: ', cBusqueda, ' es: ', v[pos].dni)
	else
		writeln('La oficina con ese codigo no existe');
	writeln('---');
end;

//Inciso D
function totalExpensas(v: TVector; dimL: integer): integer;
begin
	if(dimL = 0) then
		totalExpensas:= 0
	else
		totalExpensas:= v[dimL].valor + totalExpensas(v, dimL - 1);
end;

procedure imprimirVector(v: TVector; dimL: integer);

	procedure imprimirDatos(o: TOficina);
	begin
		writeln('/\/\/\/\');
		writeln(' -> Codigo de Identificacion: ', o.codeIdentificacion);
		writeln(' -> DNI del propietario: ', o.dni);
		writeln(' -> Valor de las expensas: ', o.valor);
		writeln('\/\/\/\/');
	end;

var
	i: integer;
begin
	for i:= 1 to dimL do 
		imprimirDatos(v[i]);
end;

var
	v: TVector;
	dimL: integer;
begin
	dimL:= 0;
	Randomize;
	generarVector(v, dimL);
	ordenarSeleccion(v, dimL);
	imprimirVector(v, dimL);
	informarPropietario(v, dimL);
	writeln('El total de expensas es: ', totalExpensas(v, dimL));
end.
	

