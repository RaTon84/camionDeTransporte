object knightRider {	
	method peso()=500;
	method nivel()=10;
	method bulto()=1;
	method cargar()={};
}

object bumblebee {
	const nivel=15;
	var property estaTransformadoEnAuto = true;
	method peso()=800;
	method nivel()=if(estaTransformadoEnAuto)15 else 30;
	method bulto()=2;
	method cargar()=self.estaTransformadoEnAuto(false);
}

object paqueteLadrillos{
	const pesoLadrillo=2;
	var property cantidad=0;
	method peso()=pesoLadrillo*cantidad;
	method nivel()=2;
	method bulto()=
	return if(cantidad<=100) 1
		else if(cantidad.between(101,300)) 2
		else 3;
	method cargar(){cantidad+=12};		
}


object arena {
	var property peso=20;
	method nivel()=1;
	method bulto()=1;
	method cargar(){peso+=20};
}

object bateriaAntiarea {
	var property estaConMisiles=false;
	method peso()=if(estaConMisiles)300 else 200;
	method nivel()=if(estaConMisiles)100 else 0;
	method bulto()=if(estaConMisiles)2 else 1;
	method cargar(){estaConMisiles=true};
}

object contenedor {
	const peso=100;
	var cosas=[];
	method agregarCosa(cosa)=cosas.add(cosa);
	method cosas()= cosas;
	method peso()=peso+cosas.sum({c=>c.peso()});
	method nivel()=if(cosas.isEmpty()) 0 else cosas.max({c=>c.nivel()});
	method bulto()=1+cosas.sum({s=>s.bulto()});
	method cargar(){cosas.map({c=>c.cargar()})};
}

object residuosRadioactivos {
	var property peso=500;
	method nivel()=200;
	method bulto()=1;
	method cargar(){peso+=15};
}

object embalajeSeguridad {
	var cosaSegura;
	method envolverCosa(cosa){
		cosaSegura=cosa;
	}
	method peso()=cosaSegura.peso();
	method nivel()=cosaSegura.nivel()/2;
	method bulto()=2;
	method cargar(){};
}