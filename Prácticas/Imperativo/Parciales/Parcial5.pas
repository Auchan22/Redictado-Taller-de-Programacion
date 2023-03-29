program Parcial5;
const 
	DIMF = 5;
type
	TRangoSucursal = 1..DIMF;
	
	TFecha = record
		dia: integer;
		mes: integer;
	end;
	
	TAsistencia = record
		cSucursal: TRangoSucursal;
		dni: integer;
		cCliente: integer;
		fecha: TFecha;
		cantMinutos: integer;
	end;
	
	TAsistenciaAguardar = record
		dni: integer;
		cCliente: integer;
		fecha: TFecha;
		cantMinutos: integer;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TAsistenciaAguardar;
		sig: TLista;
	end;
	
	TVector = array[TRangoSucursal] of TLista;
	
	TDatoAcumulador = record
		dni: integer;
		totalAsistencias: integer;
	end;

	TArbol = ^THoja;
	THoja = record
		dato: TDatoAcumulador;
		HI: TArbol;
		HD: TArbol;
	end;
	
//Inciso A: Carga de los datos
procedure inicializarVector(var v: TVector);
var
	i: TRangoSucursal;
begin
	for i:= 1 to DIMF do
		v[i]:= nil;
end;

procedure cargarVector(var v: TVector);

	procedure leerAsistencia(var a: TAsistencia);
	begin
		a.cCliente:= random(50);
		if(a.cCliente <> 0) then begin
			a.cSucursal:= random(DIMF) + 1;
			a.fecha.dia:= random(31) + 1;
			a.fecha.mes:= random(12) + 1;
			a.dni:= random(100) + 1;
			a.cantMinutos:= random(120) + 1;
		end;
	end;
	
	procedure cargarDatosAguardar(a: TAsistencia; var ag: TAsistenciaAguardar);
	begin
		ag.cCliente:= a.cCliente;
		ag.fecha:= a.fecha;
		ag.dni:= a.dni;
		ag.cantMinutos:= a.cantMinutos;
	end;
	
	procedure insertarOrdenado(var L: TLista; a: TAsistenciaAguardar);
	var
		nue, act, ant: TLista;
	begin
		new(nue);
		nue^.dato:= a;
		act:= L;
		ant:= L;
		while(act <> nil) and (act^.dato.cCliente < a.cCliente) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(act = ant) then
			L:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;	

var
	a: TAsistencia;
	ag: TAsistenciaAguardar;
begin
	leerAsistencia(a);
	while (a.cCliente <> 0) do begin
		cargarDatosAguardar(a, ag);
		insertarOrdenado(v[a.cSucursal], ag);
		leerAsistencia(a);
	end;
end;

//Inciso B: Por medio de merge, generar un arbol que contenga dni del cliente y cantidad total de veces que asistio a las sucursales
procedure mergeAcumulador(v: TVector; var a: TArbol);

	procedure minimo(var v: TVector; var a: TAsistenciaAguardar);
	var
		pos, i: integer;
	begin
		pos:= -1;
		a.dni:= 32766;
		for i:= 1 to DIMF do
			if(v[i]<>nil) and (v[i]^.dato.dni < a.dni) then begin
				pos:= i;
				a.dni:= v[i]^.dato.dni;
			end;
		
		if(pos <> -1) then begin
			a:= v[pos]^.dato;
			v[pos]:= v[pos]^.sig;
		end;
	end;
	
	procedure crear(var a: TArbol; d: TDatoAcumulador);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= d;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if(a^.dato.dni = d.dni) then
				a^.dato.totalAsistencias := a^.dato.totalAsistencias + d.totalAsistencias
			else
				if(a^.dato.dni > d.dni) then
					crear(a^.HI, d)
				else
					crear(a^.HD, d);
	end;

var
	ag: TAsistenciaAguardar;
	d: TDatoAcumulador;
begin
	minimo(v, ag);
	while(ag.dni <> 32766) do begin
		d.dni:= ag.dni;
		d.totalAsistencias:= 0;
		while(ag.dni <> 32766) and (ag.dni = d.dni) do begin
			d.totalAsistencias:= d.totalAsistencias + 1;
			minimo(v, ag);
		end;
		crear(a, d);
	end;
end;

//Funciones Generales
procedure imprimirDatos(d: TDatoAcumulador);
begin
	writeln;
	writeln(' -> DNI: ', d.dni, ' | -> Total de asistencias: ', d.totalAsistencias);
	writeln;
end;

procedure imprimirArbol(a: TArbol);
begin
	if(a <> nil) then begin
		imprimirArbol(a^.HI);
		imprimirDatos(a^.dato);
		imprimirArbol(a^.HD);
	end;
end;

procedure imprimirDatos2(a: TAsistenciaAguardar);
begin
	writeln;
	writeln(' -> DNI: ', a.dni, ' | -> Cant de minutos de asistencias: ', a.cantMinutos, ' | -> Codigo de Cliente: ', a.cCliente );
	writeln;
end;

procedure imprimirLista(L: TLista);
begin
	if(L <> nil) then begin
		imprimirDatos2(L^.dato);
		imprimirLista(L^.sig);
	end;
end;

procedure imprimirVector(v: TVector);
var
	i: TRangoSucursal;
begin
	for i:= 1 to DIMF do begin
		writeln('Imprimiendo asistencias de la sucursal: ', i);
		imprimirLista(v[i]);
	end;
end;

var
	v: TVector;
	a: TArbol;
begin
	Randomize;
	inicializarVector(v);
	cargarVector(v);
	imprimirVector(v);
	a:= nil;
	mergeAcumulador(v, a);
	imprimirArbol(a);
end.
