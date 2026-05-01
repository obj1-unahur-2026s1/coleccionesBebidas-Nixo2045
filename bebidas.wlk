object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoDeFrutas {

  const nutrientes = [1, 3, 5]

  method rendimientoQueOtorga(dosisConsumida) = dosisConsumida + nutrientes.sum()
  
  method agregarNutrientes(unNutriente) {
    nutrientes.add(unNutriente) 
  }
}

object aguaSaborizada {
  method rendimientoQueOtorga(dosisConsumida) = 1 + licuadoDeFrutas.rendimientoQueOtorga(dosisConsumida) * 0.25
  //0.75  0.25
}

object coctel {
  
  const bebidas = [aguaSaborizada, licuadoDeFrutas]

  method rendimientoDeBebidas(dosisConsumida) = bebidas.map({b => b.rendimientoQueOtorga(dosisConsumida)})
  method rendimientoQueOtorga(dosisConsumida) {
    
    const rendimientos = self.rendimientoDeBebidas(dosisConsumida)

    return rendimientos.fold(1, {acumulador, n => acumulador * n })
  }
}