program Parcial1;
type
	TFecha = record
		dia: integer;
		mes: integer;
		anio: integer;
	end;

	TVenta = record
		fecha: TFecha;
		codigoProducto: integer;
		cantVendida: integer;
		monto: real;
	end;
	
	TVentaAguardar = record
		codigoProducto: integer;
		montoTotal: real;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TVentaAguardar;
		HI: TArbol;
		HD: TArbol;
	end;
	
//Inciso A
procedure cargarArbol(var a: TArbol);

	procedure leerFecha(var f: TFecha);
	begin
		f.dia:= random(31) + 1;
		f.mes:= random(12) + 1;
		f.anio:= random(5) + 2018;
		writeln('  Ingrese dia: ', f.dia);
		writeln('  Ingrese mes: ', f.mes);
		writeln('  Ingrese Anio: ', f.anio);
	end;

	procedure leerVenta(var v: TVenta);
	begin
		writeln;
		writeln('---');
		v.codigoProducto:= random(50) - 1;
		writeln('Ingrese codigo de producto: ', v.codigoProducto);
		if(v.codigoProducto <> -1) then begin
			leerFecha(v.fecha);
			v.cantVendida:= random(100) + 1;
			writeln('Ingrese Cantidades Vendidas: ', v.cantVendida);
			v.monto:= random(500) + 50.5;
			writeln('Ingrese Monto: ', v.monto:1:1);
		end;
		writeln('---');
		writeln;
	end;
	
	procedure crear(var a: TArbol; v: TVenta);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.codigoProducto:= v.codigoProducto;
			a^.dato.montoTotal:= v.monto;
			a^.HD:= nil;
			a^.HI:= nil;
		end
		else
			if(a^.dato.codigoProducto = v.codigoProducto) then
				a^.dato.montoTotal:= a^.dato.montoTotal + v.monto
			else
				if(a^.dato.codigoProducto > v.codigoProducto) then
					crear(a^.HI, v)
				else
					crear(a^.HD, v);
	end;

var
	v: TVenta;
begin
	leerVenta(v);
	while(v.codigoProducto <> -1) do begin
		crear(a, v);
		leerVenta(v);
	end;
end;

//Inciso B
procedure informarMontoTotal(a: TArbol);

	procedure leerCodigo(var c: integer);
	begin
		writeln;
		writeln('---');
		write('Ingrese codigo a buscar: ');
		readln(c);
		writeln('---');
		writeln;
	end;
	
	function sumatoria(a: TArbol; c: integer): real;
	begin
		if(a = nil) then
			sumatoria:= 0
		else
			if(a^.dato.codigoProducto > c) then
				sumatoria:= a^.dato.montoTotal + sumatoria(a^.HD, c) + sumatoria(a^.HI, c)
			else
				sumatoria:= sumatoria(a^.HD, c)
	end;

var
	c: integer;
begin
	writeln;
	leerCodigo(c);
	writeln('---');
	writeln('El total del monto para el producto con codigo: ', c, ' es: ', sumatoria(a, c):1:1);
	writeln('---');
	writeln;
end;

var
	a: TArbol;
begin
	a:= nil;
	cargarArbol(a);
	informarMontoTotal(a);
end.
