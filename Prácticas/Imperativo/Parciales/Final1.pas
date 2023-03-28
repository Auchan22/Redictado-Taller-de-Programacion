program Final2022;
type
	TString = string[20];

	TPedido = record
		nroRepartidor: integer;
		dRetiro: TString;
		dEntrega: TString;
		monto: real;
	end;
	
	TDatoArbol = record
		nroRepartidor: integer;
		cantPedidos: integer;
		montoTotal: real;
	end;
	
	TArbol = ^TNodo;
	TNodo = record
		dato: TDatoArbol;
		HI: TArbol;
		HD: TArbol;
	end;
	
	TParametros = record
		inf: integer;
		sup: integer;
	end;

//Iniciso A
procedure cargarArbol(var a: TArbol);

	procedure leerPedido(var p: TPedido);
	begin
		writeln;
		writeln('---');
		write('Ingrese direccion de entrega: ');
		readln(p.dEntrega);
		if(p.dEntrega <> 'ZZZ') then begin
			p.nroRepartidor:= random(50) + 1;
			writeln('Ingrese numero de repartidor: ', p.nroRepartidor);
			p.dRetiro:= 'a';
			writeln('Ingrese direccion de retiro: ', p.dRetiro);
			p.monto:= random(300) + 200.5;
			writeln('Ingrese monto: ', p.monto:1:1);
		end;
		writeln('---');
		writeln;
	end;
	
	procedure cargarDatos(p: TPedido; var d: TDatoArbol);
	begin
		d.nroRepartidor:= p.nroRepartidor;
		d.cantPedidos:= 1;
		d.montoTotal:= p.monto;
	end;
	
	procedure crear(var a: TArbol; p: TPedido);
	var
		d: TDatoArbol;
	begin
		if(a = nil) then begin
			new(a);
			cargarDatos(p, d);
			a^.dato:= d;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if(a^.dato.nroRepartidor = p.nroRepartidor) then begin
				a^.dato.cantPedidos:= a^.dato.cantPedidos + 1;
				a^.dato.montoTotal:= a^.dato.montoTotal + p.monto;
			end
			else
				if(a^.dato.nroRepartidor > p.nroRepartidor) then
					crear(a^.HI, p)
				else
					crear(a^.HD, p);
	end;

var
	p: TPedido;
begin
	leerPedido(p);
	while(p.dEntrega <> 'ZZZ') do begin
		crear(a, p);
		leerPedido(p);
	end;
end;

//Inciso B
	procedure leerParametros(var p: TParametros);
	begin
		writeln;
		writeln('---');
		write('Ingrese valor inferior: ');
		readln(p.inf);
		write('Ingrese valor superior: ');
		readln(p.sup);
		writeln('---');
		writeln;
	end;

procedure informarCantidad(a: TArbol);
	
	function cantidad(a: TArbol; p: TParametros): integer;
	begin
		if(a = nil) then
			cantidad:= 0
		else begin
			if(a^.dato.montoTotal >= p.inf) and (a^.dato.montoTotal <= p.sup) then
				cantidad:= 1 + cantidad(a^.HI, p) + cantidad(a^.HD, p)
			else
				cantidad:=cantidad(a^.HI, p) + cantidad(a^.HD, p);
		end;
	end;

var
	p: TParametros;
begin
	writeln;
	leerParametros(p);
	writeln('---');
	writeln('Nro de repartidores cuyo monto total esta entre: ', p.inf, ' y ', p.sup,' es: ', cantidad(a, p));
	writeln('---');
	writeln;
end;

//Inciso C
procedure imprimirDatos(d: TDatoArbol);
begin
	writeln;
	writeln('---');
	writeln(' -> Nro de repartidor: ', d.nroRepartidor);
	writeln(' -> Cantidad de pedidos: ', d.cantPedidos);
	writeln(' -> Monto Total: ', d.montoTotal:1:1);
	writeln('---');
	writeln;
end;

procedure imprimirRepartidores(a: TArbol);

	procedure imprimirEntre(a: TArbol; p: TParametros);
	begin
		if(a <> nil) then begin
			
			if(a^.dato.nroRepartidor >= p.inf) then
				if (a^.dato.nroRepartidor <= p.sup) then begin
					imprimirDatos(a^.dato);
					imprimirEntre(a^.HI, p);
					imprimirEntre(a^.HD, p);
				end
				else
					imprimirEntre(a^.HI, p)
			else
				imprimirEntre(a^.HD, p);
		end;	
	end;

var
	p: TParametros;
begin
	writeln;
	leerParametros(p);
	writeln('---');
	writeln('Informacion de repartidores cuyo nro de repartidor esta entre: ', p.inf, ' y ', p.sup);
	writeln('---');
	imprimirEntre(a, p);
	writeln;
end;

var
	a: TArbol;
begin
	Randomize;
	a:= nil;
	cargarArbol(a);
	informarCantidad(a);
	imprimirRepartidores(a);
end.
