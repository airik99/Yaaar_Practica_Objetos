import misiones.*

class CiudadCostera {
	var cantidadDeHabitantes
	
	method esVulnerableA(unBarco) {
		return self.laCantidadDeTripulantesEsAlMenos(unBarco, 0.4) or unBarco.estanTodosPasadosDeGrogXD()
	}
	
	method laCantidadDeTripulantesEsAlMenos(unBarco, unPorcentaje) {
		return unBarco.cantidadDeTripulantes() >= cantidadDeHabitantes * unPorcentaje
	}
	
	method esSaqueablePor(unPirata) {
		return unPirata.elNivelDeEbriedadEsAlMenos(50)
	}
	
	method aumentarUnHabitante() {
		cantidadDeHabitantes += 1
	}
}