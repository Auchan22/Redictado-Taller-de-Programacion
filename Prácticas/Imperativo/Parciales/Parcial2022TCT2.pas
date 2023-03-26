program parcial2022TCT2;
const
	MAXHORAS = 8;
type
	TRangoHoras = 1..MAXHORAS;
	TRangoDia = 0..31;
	TRangoMes = 1..12;
	TEmpleado = record
		nroEmpleado: integer;
		dia: TRangoDia;
		mes: TRangoMes;
		cantHoras: TRangoHoras;
	end;
	
	TEmpleadoAguardar = record
		dia: TRangoDia;
		mes: TRangoMes;
		cantHoras: TRangoHoras;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TEmpleadoAguardar;
		sig: TLista;
	end;
	
	TDatoArbol = record
		nroEmpleado: integer;
		lista: TLista;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TDatoArbol;
		HD: TArbol;
		HI: TArbol;
	end;
	
	TParametros = record
		min: integer;
		max: integer;
	end;
	
//Inciso A
procedure cargarDatosAguardar(var eG: TEmpleadoAguardar; e: TEmpleado);
begin
	eG.dia:= e.dia;
	eG.mes:= e.mes;
	eG.cantHoras:= e.cantHoras;
end;

procedure agregarAdelante(var L: TLista; e: TEmpleado);
var
	nue: TLista;
	eG:TEmpleadoAguardar;
begin
	new(nue);
	cargarDatosAguardar(eG, e);
	nue^.dato:= eG;
	nue^.sig:= L;
	L:= nue;
end;

procedure cargarArbol(var a: TArbol);

	procedure leerEmpleado(var e: TEmpleado);
	begin
		writeln;
		writeln('---');
		e.dia:= random(32);
		writeln('Ingrese Dia: ',e.dia);
		if(e.dia <> 0) then begin
			e.nroEmpleado:= random(50) + 1;
			writeln('Ingrese Nro de empleado: ',e.nroEmpleado);
			e.mes:= random(12) + 1;
			writeln('Ingrese Mes: ',e.mes);
			e.cantHoras:= random(8) + 1;
			writeln('Ingrese Nro de horas: ',e.cantHoras);
		end;
		writeln('---');
		writeln;
	end;
	
	procedure crear(var a: TArbol; e: TEmpleado);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.nroEmpleado:= e.nroEmpleado;
			a^.dato.lista:= nil;
			agregarAdelante(a^.dato.lista, e);
			a^.HD:= nil;
			a^.HI:= nil;
		end
		else
			if(a^.dato.nroEmpleado = e.nroEmpleado) then
				agregarAdelante(a^.dato.lista, e)
			else 
				if(a^.dato.nroEmpleado > e.nroEmpleado) then
					crear(a^.HI, e)
				else
					crear(a^.HD, e);
	end;

var
	e: TEmpleado;
begin
	writeln;
	leerEmpleado(e);
	while(e.dia <> 0) do begin
		crear(a, e);
		leerEmpleado(e);
	end;
	writeln;
end;

//Inciso B
procedure informarHoras(a: TArbol);

	procedure leerParametros(var p: TParametros);
	begin
		writeln;
		write('-> Ingrese parametro X (minimo): ');
		readln(p.min);
		write('-> Ingrese parametro Y (maximo): ');
		readln(p.max);
		writeln;
	end;
	
	procedure imprimirDatos(nro, totalHoras: integer);
	begin
		writeln;
		writeln('/\/\/\/\');
		writeln('-> Nro de Empleado: ', nro);
		writeln('-> Cantidad de Horas Trabajadas: ', totalHoras);
		writeln('\/\/\/\/');
		writeln;
	end;
	
	function sumaHoras(L: TLista): integer;
	begin
		if(L = nil) then
			sumaHoras:= 0
		else
			sumaHoras:= sumaHoras(L^.sig) + L^.dato.cantHoras;
	end;
	
	procedure encontrarEntre(a: TArbol; p: TParametros);
	var
		totalHoras: integer;
	begin
		if(a <> nil) then begin
			if(a^.dato.nroEmpleado <= p.min) then 
				encontrarEntre(a^.HD, p)
			else
				if(a^.dato.nroEmpleado >= p.max) then
					encontrarEntre(a^.HI, p)
				else begin
					if(a^.dato.nroEmpleado >= p.min) and (a^.dato.nroEmpleado <= p.max) then begin
						totalHoras:= sumaHoras(a^.dato.lista);
						imprimirDatos(a^.dato.nroEmpleado, totalHoras);
						encontrarEntre(a^.HI, p);
						encontrarEntre(a^.HD, p);
					end;
				end;
		end;
	end;
var
	p: TParametros;
begin
	leerParametros(p);
	encontrarEntre(a, p);
end;

procedure imprimirLista(L: TLista);

	procedure imprimirDatos(e: TEmpleadoAguardar);
	begin
		writeln;
		writeln('/\/\/\/\');
		writeln('-> Dia: ', e.dia);
		writeln('-> Mes: ', e.mes);
		writeln('-> Cantidad de Horas: ', e.cantHoras);
		writeln('\/\/\/\/');
		writeln;
	end;

begin
	if(L <> nil) then begin
		imprimirDatos(L^.dato);
		imprimirLista(L^.sig);
	end;
end;

procedure imprimirArbol(a: TArbol);
begin
	if(a<> nil) then begin
		imprimirArbol(a^.HI);
		writeln;
		writeln('Imprimiendo datos del empleado: ', a^.dato.nroEmpleado);
		writeln;
		imprimirLista(a^.dato.lista);
		imprimirArbol(a^.HD)
	end;	
end;
//¿Puede ser un arbol de listas? ¿Esta bien formulada la estructura de los registros? ¿En el inciso c se tiene que analizar un vector de listas?

var
	a: TArbol;
begin
	Randomize;
	a:= nil;
	writeln;
	writeln('Iniciando ejecucion...');
	writeln;
	writeln('Cargando arbol...');
	writeln;
	cargarArbol(a);
	
	imprimirArbol(a);
	informarHoras(a);
end.
