class Mision {
	
	method puedeSerCompletada(unBarco) {
		return unBarco.tieneSuficienteTripulacion()
	}
}

class BusquedaDelTesoro inherits Mision {
	
	method esUtil(unPirata) {
		return unPirata.tieneAlgunItem(["brujula", "mapa", "botella de grogXD"]) and !unPirata.elOroEsMayorA(5)
	}
	
	override method puedeSerCompletada(unBarco) {
		return super(unBarco) and unBarco.algunTripulanteDebeTener("Llave de cofre")
	}
}

class ConvertirseEnLeyenda inherits Mision {
	const itemObligatorio
	
	method esUtil(unPirata) {
		return unPirata.losItemsSonAlMenos(10) and unPirata.tiene(itemObligatorio)
	}

}

object saqueo inherits Mision {
	var victima
	var cantidadDeMonedas
	
	method esUtil(unPirata) {
		return !unPirata.elOroEsMayorA(cantidadDeMonedas) and unPirata.seAnimaASaquearA(victima)
	}
	
	override method puedeSerCompletada(unBarco) {
		return super(unBarco) and victima.esVulnerableA(unBarco)
	}	
	
}