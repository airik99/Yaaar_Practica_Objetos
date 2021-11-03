import misiones.*

class Barco {
	const tripulantes = []
	var mision
	const capacidad
	
	method tieneSuficienteTripulacion() {
		return self.cantidadDeTripulantes() >= capacidad * 0.9
	}
	
	method cantidadDeTripulantes() {
		return tripulantes.size()
	}
	
	method algunTripulanteDebeTener(unItem) {
		return tripulantes.any { tripulante => tripulante.tiene(unItem) }
	}
	
	method esVulnerableA(otroBarco) {
		return self.cantidadDeTripulantes() > otroBarco.cantidadDeTripulantes() / 2
	}
	
	method estanTodosPasadosDeGrogXD() {
		return tripulantes.all { tripulante => tripulante.estaPasadoDeGrogXD() }
	}
	
	method esSaqueablePor(unPirata) {
		return unPirata.estaPasadoDeGrogXD()
	}
	
	method puedeFormarParte(unPirata) {
		return self.tieneLugarParaAlgunoMas() and unPirata.esUtilPara(mision)
	}
	
	method tieneLugarParaAlgunoMas() {
		return capacidad - self.cantidadDeTripulantes() >= 1
	}
	
	method incorporarPirata(unPirata) {
		if(self.puedeFormarParte(unPirata)) {
			tripulantes.add(unPirata)
		} else {
			throw new Exception (message = "El pirata no puede formar parte de la tripulacion")
		}
	}
	
	method cambiarMisionPor(nuevaMision) {
		mision = nuevaMision
		self.echarTripulantesQueNoSirven()
	}
	
	method echarTripulantesQueNoSirven() {
		tripulantes.removeAllSuchThat { tripulante => not(tripulante.esUtilPara(mision))}
	}
	
	method pirataMasEbrio() {
		return tripulantes.max { tripulante => tripulante.ebriedad() }
	} 
	
	method anclarEn(unaCiudadCostera) {
		tripulantes.forEach { tripulante => tripulante.seTomaUnTragoDeGrogXD() } 
		self.quedaPerdidoEn(unaCiudadCostera, self.pirataMasEbrio())
	}
	
	method quedaPerdidoEn(unaCiudadCostera, unPirata) {
		tripulantes.remove(unPirata)
		unaCiudadCostera.aumentarUnHabitante()
	}
	
	method esTemible() {
		return mision.puedeSerCompletada(self)
	}
	
	method losQueEstanPasadosDeGrogXD() {
		return tripulantes.filter { tripulante => tripulante.estaPasadoDeGrogXD() }
	}
	
	method cuantosEstanPasadosDeGrogXD() {
		return self.losQueEstanPasadosDeGrogXD().size()
	}
	
	method cuantosTiposDeItemsHayEnLaTripulacion() {
		return self.losQueEstanPasadosDeGrogXD().map { tripulante => tripulante.items() }.withoutDuplicates().size()
	}
	
	method elPasadoDeGrogXDConMasDinero() {
		return self.losQueEstanPasadosDeGrogXD().max { tripulante => tripulante.oro() }
	}

	method elQueInvitoAMasGente() {
		return tripulantes.max { tripulante => self.cantidadDeGenteQueInvito(tripulante) }
	}
	
	method cantidadDeGenteQueInvito(unTripulante) {
		return tripulantes.count { tripulante => tripulante.fueInvitadoPor(unTripulante) }
	}

}
