program Parcial6;
type
	TString = string[20];
	
	TFecha = record
		dia: integer;
		mes: integer;
		anio: integer;
	end;

	TPedido = record
		dni: integer;
		nombre: TString;
		fecha: TFecha;
		monto: real;
	end;
	
	TDatoLista = record
		fecha: TFecha;
		monto: real;
	end;
	
	TLista = ^TNodo;
	TNodo = record
		dato: TDatoLista;
		sig: TLista;
	end;
	
	TPedidoAguardar = record
		nombre: TString;
		lista: TLista;
		ult: TLista;
	end;
	
	TDatoArbol = record
		dni: integer;
		pedido: TPedidoAguardar;
	end;
	
	TArbol = ^THoja;
	THoja = record
		dato: TDatoArbol;
		HI: TArbol;
		HD: TArbol;
	end;
	
//Inciso A
procedure cargarArbol(var a: TArbol);

	procedure leerPedido(var p: TPedido);
	begin
		p.monto:= random(100);
		if(p.monto <> 0) then begin
			p.fecha.dia
		end;
	end;

var
	p: TPedido;
	pg: TPedidoAguardar;
begin

end;
