class Rutina {
  method intensidad()
  method descanso(tiempo)
  method caloriasQuemadas(tiempo) =
    100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
}

class Running inherits Rutina {
  var property intensidad

  override method descanso(tiempo) = if (tiempo > 20) 5 else 2
}

class Maraton inherits Running {
  override method caloriasQuemadas(tiempo) = super(tiempo) * 2
}

class Remo inherits Rutina {
  override method intensidad() = 1.3
  override method descanso(tiempo) = tiempo / 5
}

class RemoDeCompeticion inherits Remo {
  override method intensidad() = 1.7
  override method descanso(tiempo) = (super(tiempo) - 3).max(2)
}

class Persona{
 
  var property peso
  method tiempoRutina()

  method caloriasPorKilo()
  //method pesoPerdido(rutina) = rutina.caloriasQuemadas(self.tiempoRutina())/ self.caloriasPorKilo() 

method puedeHacer(rutina) 

method validarHacerRutina(rutina){
 
}
method hacerRutina(rutina) {
    if (!self.puedeHacer(rutina)) {
      self.error  ("La persona no puede hacer esta rutina")
    }else{peso -= self.pesoPerdido(rutina)
  }
}

// punto 3

  method caloriasQueQuemaria(rutina) =
    rutina.caloriasQuemadas(self.tiempoRutina())

  method pesoPerdido(rutina) =
    self.caloriasQueQuemaria(rutina) / self.caloriasPorKilo()
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// punto 2

 class PersonaSedentaria inherits Persona {
  const property tiempoRutina

  override method caloriasPorKilo() = 7000
  override method puedeHacer(rutina) = peso > 50
}

class PersonaAtleta inherits Persona {
  override method tiempoRutina() = 90
  override method caloriasPorKilo() = 8000

  override method puedeHacer(rutina) =
    rutina.caloriasQuemadas(self.tiempoRutina()) > 10000

  override method pesoPerdido(rutina) = super(rutina) - 1
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Predio {
  const property rutinas

  method caloriasQueQuemaria(persona) =
    rutinas.sum({ rutina => persona.caloriasQueQuemaria(rutina) })

  method esTranqui(persona) =
    rutinas.any({ rutina => persona.caloriasQueQuemaria(rutina) < 500 })

  method rutinaMasExigente(persona) =
    rutinas.max({ rutina => persona.caloriasQueQuemaria(rutina) })
}

class Club {
  const property predios

  method mejorPredio(persona) =
    predios.max({ predio => predio.caloriasQueQuemaria(persona) })

  method prediosTranquis(persona) =
    predios.filter({ predio => predio.esTranqui(persona) }).asSet()

  method rutinasMasExigentes(persona) =
    predios.map({ predio => predio.rutinaMasExigente(persona) }).asSet()
}









 

