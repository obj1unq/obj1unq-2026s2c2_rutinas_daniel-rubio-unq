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
  method pesoPerdido(rutina) = rutina.caloriasQuemadas(self.tiempoRutina())/ self.caloriasPorKilo() 

method puedeHacer(rutina) 

 

method validarHacerRutina(rutina){
  
}
method hacerRutina(rutina) {
    if (!self.puedeHacer(rutina)) = self.error  "La persona no puede hacer esta rutina"
    peso -= self.pesoPerdido(rutina)
  }


}

 
class PersonaSedentaria inherits Persona {
  
  var property tiempoRutina =  0

override method caloriasPorKilo() = 7000 
override method puedeHacer() = peso > 50  
}

















 

