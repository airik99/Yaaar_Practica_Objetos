import barcos.*

class Pirata {
	var property items = []
	var property ebriedad
	var property oro
	const property quienLoInvito
	
	method esUtilPara(unaMision) {
		return unaMision.esUtil(self)
	}
	
	method puedeIngresarALaTripulacionDe(unBarco) {
		return unBarco.puedeFormarParte(self)
	}
	
	method tiene(unItem) {
		return items.contains(unItem)
	}
	
	method tieneAlgunItem(unosItems) {
		return items.any { item => unosItems.contains(item) }
	}
	
	method elOroEsMayorA(unaCantidad) {
		return oro > unaCantidad
	}
	
	method losItemsSonAlMenos(unaCantidad) {
		return items.size() >= unaCantidad
	}
	
	method estaPasadoDeGrogXD() {
		return self.elNivelDeEbriedadEsAlMenos(90)
	}
	
	method elNivelDeEbriedadEsAlMenos(unaCantidad) {
		return ebriedad >= unaCantidad
	}
	
	method seTomaUnTragoDeGrogXD() {
		self.aumentarEbriedadEn(5)
		self.gastarOro(1)
	}
	
	method aumentarEbriedadEn(unaCantidad) {
		ebriedad += 5
	}
	
	method gastarOro(unaCantidad) {
		oro -= unaCantidad
	}
	
	method seAnimaASaquearA(unaVictima) {
		return unaVictima.esSaqueablePor(self)
	}
	
	method fueInvitadoPor(unTripulante) {
		return unTripulante == quienLoInvito
	}
}

class EspiaDeLaCorona inherits Pirata {
	override method estaPasadoDeGrogXD() {
		return false
	}
	
	override method seAnimaASaquearA(unaVictima) {
		return super(unaVictima) and self.tiene("Permiso de la corona")
	}
	
}

const barbanegra = new Pirata (items = ["brujula", "cuchillo", "cuchillo", "diente de oro", "botella de grogXD", "botella de grogXD", "botella de grogXD"], ebriedad = 10, oro = 100, quienLoInvito = null)
