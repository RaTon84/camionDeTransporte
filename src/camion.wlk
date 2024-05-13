import cosas.*

object camion {
	var cosas=[];
	const tara=1000;
	const pesoMaximo=2500;
	
	method cargar(cosa){
		cosas.add(cosa);
		cosas.last().cargar()
	}
	method descargar(cosa){
		cosas.remove(cosa);
	}	
	method todoPesoPar(){
		return cosas.all({c=>c.peso().even()});
	}	
	method hayAlgunoQuePesa(peso){
		return cosas.any({c=>c.peso()==peso});
	}	
	method elDeNivel(nivel){
		return cosas.filter({c=>c.nivel()==nivel}).first();
	}
	method pesoTotal(){
		return cosas.sum({c=>c.peso()})+tara;
	}
	method excedidoDePeso(){
		return self.pesoTotal()>pesoMaximo;
	}
	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter({c=>c.nivel()>nivel});
	}
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({c=>c.nivel()>cosa.nivel()});
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return !self.excedidoDePeso() && self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	method tieneAlgoQuePesaEntre(min,max){
		return cosas.any({c=>c.peso().between(min,max)});
	}
	method cosaMasPesada(){
		return cosas.max({c=>c.peso()});
	}
	method pesos(){
		return cosas.map({c=>c.peso()});
	}
	method totalBultos(){
		return cosas.sum({s=>s.bulto()});
		
		//pensado por si la suma de las 3 cosas dichas suman un solo bulto
		/*var total= 0;		
		if(cosas.contains(knightRider)&&cosas.contains(arena)&&cosas.contains(residuosRadioactivos)){
			total+=1
		}
		if(cosas.contains(bumblebee)&&cosas.contains(embalajeSeguridad)){
			total+=2
		}
		if(cosas.filter({c=>c==paqueteLadrillos}).cantidad().between(1,100)){
			total+=1
		}else if(cosas.filter({c=>c==paqueteLadrillos}).cantidad().between(101,300)){
			total+=1
		}else {
			total+=3
		}
		if(cosas.filter({c=>c==bateriaAntiarea}).estaConMisiles()){
			total+=2
		}else{
			total+=1
		}
		if(cosas.filter({c=>c==contenedor})){
			total = total+1+cosas.filter({c=>c==contenedor}).size();
		}
		return total*/
	}
}
