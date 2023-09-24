
class ProfesionalAsociado {
	var universidad
	const asociacion = asociacionDeProfesionalesDelLitoral
	
	method asociacion() = asociacion
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobros(dinero){
		asociacion.totalRecaudado(dinero)
	}
}


class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ}
	
	method provinciasDondePuedeTrabajar() {
		return #{universidad.provincia()}
	} 
	
	method honorariosPorHora(){
		return universidad.honorarioRecomendable()
	}
	
	method cobros(dinero){
		universidad.totalRecibidoPorDonaciones(dinero/2)
	}
}


class ProfesionalLibre {
	var universidad
	var property honorariosPorHora
	const provincias = #{}
	var  totalRecaudado = 0
	
	method totalRecaudado() = totalRecaudado
	
	method provinciasDondePuedeTrabajar() = provincias
	
	method agregarProvincia(prov){
		provincias.add(prov)
	}
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }

    method cobros(dinero){
		totalRecaudado =+ dinero
	}	
	method pasarDinero(persLibre,cant){
		if (totalRecaudado < cant){
			self.error("No tiene la cantidad suficiente")
		}
		totalRecaudado -= cant
		persLibre.cobro(cant)
	}
}

class Universidad{
	var property provincia
	var property honorarioRecomendable
	var totalRecibidoPorDonaciones = 0
	
	method totalRecibidoPorDonaciones() = totalRecibidoPorDonaciones
	
	method totalRecibidoPorDonaciones(cant){
		totalRecibidoPorDonaciones += cant
	}
}

object asociacionDeProfesionalesDelLitoral{
	var  totalRecaudado = 0
	
	method totalRecaudado() = totalRecaudado
	
	method totalRecaudado(cant){
		totalRecaudado += cant
	}
}