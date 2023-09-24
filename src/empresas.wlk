import profesionales.*
import solicitantes.*

class Empresa{
	
	const profesional = #{}
    var honorarioReferencia
    
    method agregarProfesional(unProfesional){
    	profesional.add(unProfesional)
    }
    
    method quitarProfesional(unProfesional){
    	profesional.remove(unProfesional)
    }
    
	method cantProfesionalesQueEstudiaronEnUniv(unaUniv){
		return profesional.count({p => p.universidad() == unaUniv})
	}
	
	method profesionalesCaros(){
		return profesional.filter({p => p.honorariosPorHora()> honorarioReferencia})
	}
	
	method universidadesFormadoras(){
		return profesional.map({p => p.universidad()}).asSet()
	}
	
	method profesionalMasBarato(){
		if (profesional.isEmpty()){     
			self.error("no existe el minimo")
		}
		return profesional.min({p => p.honorariosPorHora()})
	}

	method esDeGenteAcotada(){
		return profesional.all({p =>p.provinciasDondePuedeTrabajar().size()<=3})
	}
	
	method puedeSatisfacerASolicitante(solicitante){
		return profesional.any({p => solicitante.puedeSerAtendidoPorProfesional(p)})
	}
}
