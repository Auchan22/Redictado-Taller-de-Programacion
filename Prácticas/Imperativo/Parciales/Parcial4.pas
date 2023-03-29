{
La Organización Mundial de la Salud (OMS) necesita un sistema para obtener estadísticas
de las dosis de vacunas aplicadas contra el COVID-19 en cada país. Cada país notifica
diariamente a la OMS la cantidad de dosis aplicadas por tipo de vacuna. De cada
notificación se conoce: fecha, nombre del país, tipo de vacuna (1:Sinopharm, 2:CanSino,
3:AstraZeneca, 4:Sputnik) y cantidad de dosis aplicadas.

Se dispone una estructura que almacena las notificaciones agrupadas por tipo de vacuna.
Para cada tipo, las notificaciones realizadas se encuentran ordenadas por nombre de país.
Implemente un programa que:

a) Reciba la estructura que almacena las notificaciones y, usando la técnica de merge
     acumulador, genere un ABB (ordenado por cantidad de dosis) que contenga para
     cada país, la cantidad total de dosis aplicadas.

b) Implementar un módulo recursivo que reciba la estructura generada en a) y retorne
    el nombre del país que aplicó la mayor cantidad de dosis.

NOTA: Cada país puede aplicar más de un tipo de vacuna por día.
No es necesario implementar la carga de la estructura que se dispone. Alcanza con declarar
el encabezado del procedimiento e invocarlo para que el programa compile
}

program Parcial4;
const
	DIMF = 4;
	MAXSTRING = 'zzz';
type
	TRangoVacuna = 1..DIMF;
	TRangoCarga = 0..DIMF;
	
	TFecha = record
		dia: integer;
		mes: integer;
	end;
	
	TString = string[20];

	TNotificacion = record
		fecha: TFecha;
		nombrePais: TString;
		tipoV: TRangoCarga;
		cantDosis: integer;
	end;
	
	TNotificacionAguardar = record
		fecha: TFecha;
		nombrePais: TString;
		cantDosis: integer;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TNotificacionAguardar;
		sig: TLista;
	end;
	
	TVector = array[TRangoVacuna] of TLista;
	
	TDatoAcumulador = record
		nombrePais: TString;
		totalDosis: integer;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TDatoAcumulador;
		HI: TArbol;
		HD: TArbol;
	end;

//Carga Vector
procedure inicializarVector(var v: TVector);
var
	i: TRangoVacuna;
begin
	for i:= 1 to DIMF do
		v[i]:= nil;
end;

procedure cargarVector(var v: TVector);

	procedure cargarDatosAguardar(n: TNotificacion; var ng: TNotificacionAguardar);
	begin
		ng.nombrePais:= n.nombrePais;
		ng.cantDosis:= n.cantDosis;
		ng.fecha:= n.fecha;
	end;
	
	procedure insertarOrdenado(var L: TLista; ng: TNotificacionAguardar);
	var
		act, ant, nue: TLista;
	begin
		new(nue);
		nue^.dato:= ng;
		act:= L;
		ant:= L;
		while (act <> nil) and (act^.dato.nombrePais < ng.nombrePais) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if(act = ant) then
			L:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
	procedure leerNotificacion(var n: TNotificacion);
	begin
		write('Ingrese nombre pais: ');
		readln(n.nombrePais);
		if(n.nombrePais <> MAXSTRING) then begin
			n.fecha.dia:= random(31) + 1;
			n.fecha.mes:= random(12) + 1;
			n.tipoV:= random(DIMF) + 1;
			n.cantDosis:= random(100) + 1;
		end;
	end;

var
	N: TNotificacion;
	NG: TNotificacionAguardar;
begin
	leerNotificacion(N);
	while (N.nombrePais <> MAXSTRING) do begin
		cargarDatosAguardar(N, NG);
		insertarOrdenado(v[N.tipoV], NG);
		leerNotificacion(N);
	end;
end;

//Inciso A
procedure merge(v: TVector; var a: TArbol);

	procedure minimo(var v: TVector; var n: TNotificacionAguardar);
	var
		i, pos: integer;
	begin
		pos:= -1;
		n.nombrePais:= 'zzz';
		for i:= 1 to DIMF do 
			if(v[i] <> nil) and (v[i]^.dato.nombrePais < n.nombrePais) then begin
				pos:= i;
				n:= v[i]^.dato;
			end;
			
		if(pos <> -1) then begin
			n:= v[pos]^.dato;
			v[pos]:= v[pos]^.sig;
		end;
	end;
	
	procedure crear(var a: TArbol; d: TDatoAcumulador);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:= d;
			a^.HD:= nil;
			a^.HI:= nil;
		end
		else
			if(a^.dato.totalDosis > d.totalDosis) then
				crear(a^.HI, d)
			else
				crear(a^.HD, d);
	end;

var
	d: TDatoAcumulador;
	n: TNotificacionAguardar;
begin
	minimo(v, n);
	while(n.nombrePais <> MAXSTRING) do begin
		d.nombrePais:= n.nombrePais;
		d.totalDosis:= 0;
		while(n.nombrePais <> MAXSTRING) and (d.nombrePais = n.nombrePais) do begin
			d.totalDosis := d.totalDosis + n.cantDosis;
			minimo(v, n);
		end;
		crear(a, d);
	end;
end;

//Inciso B
procedure informarMaxVacunas(a: TArbol);
	
	function maximo(a: TArbol): TString;
	begin
		if(a^.HD = nil) then
			maximo:= a^.dato.nombrePais
		else
			maximo:= maximo(a^.HD);
	end;

begin
	writeln;
	writeln('---');
	writeln('El nombre del pais que aplico la mayor cantidad de dosis es: ', maximo(a));
	writeln('---');
	writeln;
end;

//Funciones Generales
procedure imprimirDatos(n: TNotificacionAguardar);
begin
	writeln;
	writeln('-> Dia: ', n.fecha.dia, ' | -> Mes: ', n.fecha.mes, ' | -> Nombre Pais: ', n.nombrePais, ' | -> Cantidad de Dosis: ', n.cantDosis);
	writeln;
end;


procedure imprimirLista(L: TLista);
begin
	if(L <> NIL) then begin
		imprimirDatos(L^.dato);
		imprimirLista(L^.sig);
	end;
end;


procedure imprimirVector(v: TVector);
var
	i: TRangoVacuna;
begin
	for i:= 1 to DIMF do begin
		writeln('Imprimiendo Notificaciones de la vacuna Tipo: ', i);
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
	merge(v, a);
	if( a = nil) then
		writeln('NIL');
	informarMaxVacunas(a);
end.
