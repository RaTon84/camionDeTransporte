import cosas.*

object camion {
	var cosas=[];
	const tara=1000;
	const pesoMaximo=2500;
	/*para manejar qué tiene. */
	method cargar(cosa){
		cosas.add(cosa);
		cosas.last().cargar()
	}
	method descargar(cosa){
		cosas.remove(cosa);
	}	
	/*si el peso de cada uno de los objetos cargados es un número par. */
	method todoPesoPar(){
		return cosas.all({c=>c.even()});
	}	
	/*indica si hay alguno de los objetos cargados que tiene exactamente el peso indicado. */
	method hayAlgunoQuePesa(peso){
		return cosas.any({c=>c.peso()==peso});
	}	
	/*devuelve el primer objeto cargado que encuentre, cuyo nivel de peligrosidad coincida exactamente con el valor indicado. */
	method elDeNivel(nivel){
		return cosas.filter({c=>c.nivel()==nivel}).first();
	}
	/*es la suma del peso del camión vacío (tara) y su carga. La tara del camión es de 1000 kilos. */
	method pesoTotal(){
		return cosas.sum({c=>c.peso()})+tara;
	}
	/* indica si el peso total es superior al peso máximo, que es de 2500 kilos. */
	method excedidoDePeso(){
		return self.pesoTotal()>pesoMaximo;
	}
	/*devuelve una colección con los objetos cargados que superan el nivel de peligrosidad indicado. */
	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter({c=>c.nivel()>nivel});
	}
	/*devuelve una colección con los objetos cargados que son más peligrosos que la cosa indicada. */
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({c=>c.nivel()>cosa.nivel()});
	}
	/*Puede circular si no está excedido de peso, y además, ninguno de los objetos cargados supera el nivel máximo de peligrosidad indicado.*/
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return !self.excedidoDePeso() && self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	/*indica si el peso de alguna de las cosas que tiene el camión está en ese intervalo; */
	method tieneAlgoQuePesaEntre(min,max){
		return cosas.any({c=>c.between(min,max)});
	}
	/*la cosa más pesada que tenga el camión. Ojo que lo que se pide es la cosa y no su peso. */
	method cosaMasPesada(){
		return cosas.max({c=>c.peso()});
	}
	/*devuelve una lista con los pesos de cada cosa que tiene el camión. */
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
