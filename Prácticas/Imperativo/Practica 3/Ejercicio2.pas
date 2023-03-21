program ejercicio2;
type
	TFecha = record
		dia: integer;
		mes: integer;
		anio: integer;
	end;
	
	TVenta = record
		codigoP: integer;
		fecha: TFecha;
		cantVendidas: integer;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TVenta;
		sig: TLista;
	end;
	
	TDatoHoja = record
		lista: TLista;
		ult: TLista;
		codigoP: integer;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TDatoHoja;
		HI: TArbol;
		HD: TArbol;
	end;
	
	TDatoHoja2 = record
		codigoP: integer;
		cantTotalVendidos: integer;
	end;
	
	TArbol2 = ^THoja2;
	THoja2 = record
		dato: TDatoHoja2;
		HI: TArbol2;
		HD: TArbol2;
	end;

procedure cargarArbol(var a: TArbol);

	procedure leerFecha(var f: TFecha);
	begin
		f.dia:= random(31) + 1;
		writeln(' -> Dia: ', f.dia);
		f.mes:= random(12) + 1;
		writeln(' -> Mes: ', f.mes);
		f.anio:= 2023;
		writeln(' -> Anio: ', f.anio);
	end;

	procedure leerVenta(var v: TVenta);
	begin
		writeln;
		v.codigoP:= random(50);
		writeln('-> Codigo de producto: ', v.codigoP);
		if(v.codigoP <> 0) then begin
			writeln('-> Fecha: ');
			leerFecha(v.fecha);
			v.cantVendidas:= random(100) + 1;
			writeln('-> Cantidades vendidas: ', v.cantVendidas);
		end;
		writeln;
	end;
	
	procedure agregarAtras(var pri, ult: TLista; v: TVenta);
	var
		nue: TLista;
	begin
		new(nue);
		nue^.dato:= v;
		nue^.sig:= nil;
		if(pri <> nil) then
			ult^.sig:= nue
		else
			pri:= nue;
		ult:= nue;
	end;
	
	function cargarDatosHoja( v: TVenta): TDatoHoja;
	var
		dh: TDatoHoja;
	begin
		dh.lista:= nil;
		dh.ult:= nil;
		dh.codigoP:= v.codigoP;
		cargarDatosHoja:= dh;
	end;
	
	procedure crear(var a: TArbol; v: TVenta);
	begin
		if(a = nil) then begin
			new(a);		
			a^.dato:= cargarDatosHoja(v);
			agregarAtras(a^.dato.lista, a^.dato.ult, v);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if(a^.dato.codigoP = v.codigoP) then begin
				agregarAtras(a^.dato.lista, a^.dato.ult, v);
			end
			else
				if(v.codigoP < a^.dato.codigoP) then
					crear(a^.HI, v)
				else
					crear(a^.HD, v);
	end;

var
	v: TVenta;
begin
	writeln;
	writeln('---');
	writeln('Cargando Arbol...');
	writeln('---');
	leerVenta(v);
	while(v.codigoP <> 0) do begin
		crear(a, v);
		leerVenta(v);
	end;
	writeln;
end;

procedure imprimirArbol(a: TArbol);

	procedure imprimirFecha(f: TFecha);
	begin
		writeln(' -> Dia: ', f.dia);
		writeln(' -> Mes: ', f.mes);
		writeln(' -> Anio: ', f.anio);
	end;
	
	procedure imprimirLista(L: TLista);
	begin
		if(L <> nil) then begin
			writeln('---');
			writeln('-> Codigo de Producto: ', L^.dato.codigoP);
			writeln('-> Fecha: ');
			imprimirFecha(L^.dato.fecha);
			writeln('-> Cantidades Vendidas: ',L^.dato.cantVendidas);
			writeln('---');
			imprimirLista(L^.sig);
		end;
	end;

begin
	if(a <> nil) then begin
		imprimirArbol(a^.HI);
		writeln;
		writeln('Imprimiendo ventas del producto: ', a^.dato.codigoP);
		writeln;
		if(a^.dato.lista <> nil) then
			imprimirLista(a^.dato.lista)
		else
			writeln('Lista vacia');
		imprimirArbol(a^.HD);
	end;
end;

procedure cargarArbol2(var aN: TArbol2; a: TArbol);

	function totalCantVendidas(L: TLista): integer;
	begin
		if(L = nil) then
			totalCantVendidas:= 0
		else
			totalCantVendidas:= L^.dato.cantVendidas + totalCantVendidas(L^.sig);
	end;
	
	procedure crearNodo(var aN: TArbol2; codigoP, cantTotal: integer);
	begin
		if(aN = nil) then begin
			new(aN);
			aN^.dato.codigoP:= codigoP;
			aN^.dato.cantTotalVendidos:= cantTotal;
			aN^.HI:= nil;
			aN^.HD:= nil;
		end
		else
			if(aN^.dato.codigoP > codigoP) then
				crearNodo(aN^.HI, codigoP, cantTotal)
			else
				crearNodo(aN^.HD, codigoP, cantTotal);
	end;
	
begin
	if(a <> nil) then begin
		crearNodo(aN, a^.dato.codigoP, totalCantVendidas(a^.dato.lista));
		cargarArbol2(aN, a^.HI);
		cargarArbol2(aN, a^.HD);
	end;
end;

procedure imprimirArbol2(aN: TArbol2);
begin
	if(aN <> nil) then begin
		writeln;
		imprimirArbol2(aN^.HI);
		writeln('Codigo de producto: ', aN^.dato.codigoP, ' | Cant total de ventas: ', aN^.dato.cantTotalVendidos);
		imprimirArbol2(aN^.HD);
		writeln;
	end;
end;

	procedure leerCodigoProducto(var c: integer);
	begin
		writeln('---');
		write('Ingrese codigo de producto a buscar:');
		readln(c);
		writeln('---');
	end;

procedure informarCantVendidas(a: TArbol);
	
	function Buscar(a: TArbol; c: integer): TArbol;
	begin
		if(a = nil) then
			Buscar:= nil
		else
			if(a^.dato.codigoP = c) then
				Buscar:= a
			else
				if(a^.dato.codigoP > c) then
					Buscar:= Buscar(a^.HI, c)
				else
					Buscar:= Buscar(a^.HD, c);
	end;
	
	function cantTotalVentas(l: TLista): integer;
	begin
		if(l = nil) then
			cantTotalVentas:= 0
		else
			cantTotalVentas:= l^.dato.cantVendidas + cantTotalVentas(l^.sig);
	end;

var
	codigoP: integer;
	abb: TArbol;
begin
	writeln;
	writeln('Informar cantidad total de ventas de x producto...');
	leerCodigoProducto(codigoP);
	abb:= Buscar(a, codigoP);
	if(abb = nil) then
		writeln('No se encuentra el producto con el codigo: ', codigoP)
	else
		writeln('El codigo ', codigoP, ' tiene un total de ventas de: ', cantTotalVentas(abb^.dato.lista));
	writeln;
end;

procedure informarCantVendidas2(a: TArbol2);

function Buscar(a: TArbol2; c: integer): TArbol2;
	begin
		if(a = nil) then
			Buscar:= nil
		else
			if(a^.dato.codigoP = c) then
				Buscar:= a
			else
				if(a^.dato.codigoP > c) then
					Buscar:= Buscar(a^.HI, c)
				else
					Buscar:= Buscar(a^.HD, c);
	end;

var
	codigoP: integer;
	abb: TArbol2;
begin
	writeln;
	writeln('Informar cantidad total de ventas de x producto...');
	leerCodigoProducto(codigoP);
	abb:= Buscar(a, codigoP);
	if(abb = nil) then
		writeln('No se encuentra el producto con el codigo: ', codigoP)
	else
		writeln('El codigo ', codigoP, ' tiene un total de ventas de: ',abb^.dato.cantTotalVendidos);
	writeln;
end;

var
	a: TArbol;
	aN: TArbol2;
begin
	Randomize;
	a:= nil;
	aN:= nil;
	cargarArbol(a);
	imprimirArbol(a);
	cargarArbol2(aN, a);
	imprimirArbol2(aN);
	informarCantVendidas(a);
	informarCantVendidas2(aN);
end.
