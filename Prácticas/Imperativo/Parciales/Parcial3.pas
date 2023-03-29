{
Una ciudad necesita un sistema para administrar la limpieza de sus esquinas. Para ello, el
sistema necesita un módulo que lea la información de cada esquina que se limpia: número
de calle, número de avenida, cantidad de objetos recolectados y número identificatorio del
camión (1..10) que se encargó de la limpieza de la esquina. A partir de esa información,
debe generar una estructura que almacene las esquinas agrupadas por número de camión.
Para cada camión, las esquinas deben ordenarse por número de avenida. La lectura finaliza
con el número de camión 0, el cual no se procesa.

Se pide implementar un programa en Pascal que incluya:

a) Un módulo Cargar que (de manera aleatoria) genere datos de las esquinas y los
    almacene en una estructura adecuada.

b) Un módulo que reciba la estructura generada en a) y (usando merge acumulador)   
   obtenga para cada avenida el total de objetos recolectados (entre todos los
   camiones). Genere un ABB que contenga número de avenida y el total de objetos
   recolectados en la avenida, ordenado por total de objetos recolectados.
}

program Parcial3;
const
	DIMF = 10;
type
	TRangoCamion = 1..DIMF;
	TRangoCarga = 0..DIMF;
	
	TEsquina = record
		nroCalle: integer;
		nroAvenida: integer;
		cantObjetos: integer;
		nroIdentificatorio: TRangoCarga;
	end;
	
	TEsquinaAguardar = record
		nroCalle: integer;
		nroAvenida: integer;
		cantObjetos: integer;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TEsquinaAguardar;
		sig: TLista;
	end;
	
	TVector = array[TRangoCamion] of TLista;
	
	TDatoAcumulador = record
		nroAvenida: integer;
		totalObjetos: integer;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TDatoAcumulador;
		HI: TArbol;
		HD: TArbol;
	end;
	
//Inciso A
procedure inicializarVector(var v: TVector);
var
	i: TRangoCamion;
begin
	for i:= 1 to DIMF do 
		v[i]:= nil;
end;

procedure cargarVector(var v: TVector);

	procedure leerEsquina(var e: TEsquina);
	begin
		writeln;
		writeln('---');
		e.nroIdentificatorio:= random(DIMF + 1);
		writeln('Ingrese Nro  Identificatorio: ', e.nroIdentificatorio);
		if(e.nroIdentificatorio <> 0) then begin
			e.nroCalle:= random(100) + 1;
			e.nroAvenida:= random(100) + 1;
			e.cantObjetos:= random(50);
			writeln('Ingrese Nro de Calle: ', e.nroCalle);
			writeln('Ingrese Nro de Avenida: ', e.nroAvenida);
			writeln('Ingrese Cantidad de Objetos: ', e.cantObjetos);
		end;
		writeln('---');
		writeln;
	end;
	
	procedure cargarDatosAguardar(var eg: TEsquinaAguardar; e: TEsquina);
	begin
		eg.nroCalle:= e.nroCalle;
		eg.nroAvenida:= e.nroAvenida;
		eg.cantObjetos:= e.cantObjetos;
	end;
	
	procedure insertarOrdenado(var L: TLista; e: TEsquinaAguardar);
	var
		act, ant, nue: TLista;
	begin
		new(nue);
		nue^.dato:= e;
		act := L;
		ant:= L;
		while(act <> nil) and (act^.dato.nroAvenida < e.nroAvenida) do begin
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
	e: TEsquina;
	eg: TEsquinaAguardar;
begin
	leerEsquina(e);
	while(e.nroIdentificatorio <> 0) do begin
		cargarDatosAguardar(eg, e);
		insertarOrdenado(v[e.nroIdentificatorio], eg);
		leerEsquina(e);
	end;
end;

//Inciso B
procedure merge(v: TVector; var a: TArbol);

	procedure minimo(var v: TVector; var e: TEsquinaAguardar);
	var
		i, pos: integer;
	begin
		e.nroAvenida := 32766;
		pos:= -1;
		for i:= 1 to DIMF do 
			if(v[i] <> nil) and (v[i]^.dato.nroAvenida <= e.nroAvenida) then begin
				pos:= i;
				e:= v[i]^.dato;
			end;
		
		if(pos <> -1) then begin
			e:= v[pos]^.dato;
			v[pos]:= v[pos]^.sig;
		end;
	end;
	
	procedure crear(var a: TArbol; d: TDatoAcumulador);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= d;
			a^.HD := nil;
			a^.HI:= nil;
		end
		else
			if(a^.dato.nroAvenida > d.nroAvenida) then
				crear(a^.HI, d)
			else
				crear(a^.HD, d);
	end;

var
	e: TEsquinaAguardar;
	d: TDatoAcumulador;
begin
	minimo(v, e);
	while(e.nroAvenida <> 32766) do begin
		d.nroAvenida:= e.nroAvenida;
		d.totalObjetos:= 0;
		while(e.nroAvenida <> 32766) and (d.nroAvenida = e.nroAvenida) do begin
			d.totalObjetos:= d.totalObjetos + e.cantObjetos;
			minimo(v, e);
		end;
		crear(a, d);
	end;
end;

//Funciones Generales
procedure imprimirDatosArbol(d: TDatoAcumulador);
begin
	writeln;
	writeln('---');
	writeln(' -> Nro de Avenida: ', d.nroAvenida);
	writeln(' -> Total de Objetos: ', d.totalObjetos);
	writeln('---');
	writeln;
end;

procedure imprimirArbol(a: TArbol);
begin
	if(a <> nil) then begin
		imprimirArbol(a^.HI);
		imprimirDatosArbol(a^.dato);
		imprimirArbol(a^.HD);
	end;
end;

var
	v: TVector;
	a: TArbol;
begin
	Randomize;
	inicializarVector(v);
	cargarVector(v);
	a:= nil;
	merge(v, a);
	writeln;
	writeln('Imprimiendo arbol...');
	writeln;
	imprimirArbol(a);
end.
