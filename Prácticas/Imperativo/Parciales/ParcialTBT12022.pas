program parcialTBT12022;
type
	TRangoDia = 1..31;

	TCompra = record
		codigoCliente: integer;
		dia: TRangoDia;
		cantProducto: integer;
		monto: integer;
	end;
	
	TCompraAguardar = record
		dia: TRangoDia;
		cantProducto: integer;
		monto: integer;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TCompraAguardar;
		sig: TLista;
	end;
	
	TDatoHoja = record
		lista: TLista;
		ult: TLista;
		codigoCliente: integer;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TDatoHoja;
		HD: TArbol;
		HI: TArbol;
	end;

//Inciso a
procedure cargarArbol(var a: TArbol);

	procedure leerCompra(var c: TCompra);
	begin
		writeln;
		writeln('---');
		c.cantProducto:= random(50);
		writeln('Ingrese cantidad de producto: ', c.cantProducto);
		if(c.cantProducto <> 0) then begin
			c.codigoCliente:= random(100) + 1;
			writeln('Ingrese codigo de cliente: ', c.codigoCliente);
			c.dia:= random(31) + 1;
			writeln('Ingrese dia: ', c.dia);
			c.monto:= random(300) + 200;
			writeln('Ingrese monto: ', c.monto);
		end;
		writeln('---');
		writeln;
	end;
	
	procedure cargarDatosAguardar(c: TCompra;var cg: TCompraAguardar);
	begin
		cg.cantProducto:= c.cantProducto;
		cg.dia:= c.dia;
		cg.monto:= c.monto;
	end;
	
	procedure agregarAtras(var pri, ult: TLista; c: TCompra);
	var
		nue: TLista;
		cg: TCompraAguardar;
	begin
		new(nue);
		cargarDatosAguardar(c, cg);
		nue^.dato:= cg;
		nue^.sig:= nil;
		if(pri = nil) then
			pri:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;
	
	procedure crear(var a: TArbol; c: TCompra);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.codigoCliente:= c.codigoCliente;
			a^.dato.lista:= nil;
			a^.dato.ult:= nil;
			agregarAtras(a^.dato.lista, a^.dato.ult, c);
		end
		else
			if(a^.dato.codigoCliente = c.codigoCliente) then
				agregarAtras(a^.dato.lista, a^.dato.ult, c)
			else
				if(a^.dato.codigoCliente > c.codigoCliente) then
					crear(a^.HI, c)
				else
					crear(a^.HD, c);
	end;

var
	c: TCompra;
begin
	leerCompra(c);
	while(c.cantProducto <> 0) do begin
		crear(a, c);
		leerCompra(c);
	end;
end;

//Inciso B
procedure comprasDeCliente(a: TArbol; var L: TLista);

	procedure leerCodigo(var c: integer);
	begin
		writeln;
		writeln('---');
		write('Ingrese codigo a buscar: ');
		readln(c);
		writeln('---');
		writeln;
	end;
	
	function buscar(a: TArbol; c: integer): TLista;
	begin
		if(a = nil) then
			buscar:= nil
		else
			if(a^.dato.codigoCliente = c) then
				buscar:= a^.dato.lista
			else
				if(a^.dato.codigoCliente > c) then
					buscar:= buscar(a^.HI, c)
				else
					buscar:= buscar(a^.HD, c)
	end;
var
	c: integer;
begin
	writeln;
	leerCodigo(c);
	L:= buscar(a, c);
	if(L = nil) then
		writeln('No se encontro el cliente con codigo: ', c)
	else
		writeln('Cliente encontrado correctamente!');
	writeln;
end;

//Inciso C
function maximo(L: TLista; maxCantidad, maxMonto: integer): integer;
begin
	if(L = nil) then
		maximo:= maxMonto
	else begin
		if(L^.dato.cantProducto >= maxCantidad) then begin
			maxCantidad:= L^.dato.cantProducto;
			maxMonto:= L^.dato.monto;
		end;
		maximo:= maximo(L^.sig, maxCantidad, maxMonto);
	end;
end;

procedure informarMaxProducto(L: TLista);
var
	maxCantidad, maxMonto: integer;
begin
	maxCantidad:= -1;
	maxMonto:= 0;
	writeln;
	writeln('---');
	writeln('El monto de la compra con mayor cantidad de productos es: ', maximo(L, maxCantidad, maxMonto));
	writeln('---');
	writeln;
end;


//Funciones Varias
procedure imprimirDatos(c: TCompraAguardar);
begin
	writeln;
	writeln('---');
	writeln(' -> Dia: ', c.dia);
	writeln(' -> Monto: ', c.monto);
	writeln(' -> Cantidades Vendidas: ', c.cantProducto);
	writeln('---');
	writeln;
end;

procedure imprimirLista(L: TLista);
begin
	if(L <> nil) then begin
		imprimirDatos(L^.dato);
		imprimirLista(L^.sig);
	end;
end;

var
	a: TArbol;
	L: TLista;
begin
	Randomize;
	a:= nil;
	cargarArbol(a);
	L:= nil;
	comprasDeCliente(a, L);
	if(L <> nil) then begin
		imprimirLista(L);
		informarMaxProducto(L);
	end;
end.
