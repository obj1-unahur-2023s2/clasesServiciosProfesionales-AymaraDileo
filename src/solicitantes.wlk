import profesionales.*

class Persona{
	var property provincia
	
	method puedeSerAtendidoPorProfesional(profesional){
		return profesional.provinciasDondePuedeTrabajar().any({p=>p == profesional})
	}
}

class Institucion{
	 const universidades = []
	 method puedeSerAtendidoPorProfesional(profesional){
		return universidades.any({u=> u == profesional.universidad()})
	}
}

class Club{
	const provincias = #{}
	method puedeSerAtendidoPorProfesional(profesional){
		return not profesional.provinciasDondePuedeTrabajar().intersection(provincias).isEmpty()
	}
	
}