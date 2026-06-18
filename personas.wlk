import construcciones.*

class Persona {
    var edad
    var recursos = 20

    method recursos() = recursos
    method esDestacada() = edad.between(18, 65) or recursos > 30

    method ganarRecursos(cantidad) {
        recursos += cantidad
    }

    method gastarRecursos(cantidad) {
        recursos -= cantidad
    }

    method cumplirAños(cantidad) {
        edad += cantidad
    }

    method trabajar(unPlaneta, unTiempo) { }
}

class Productor inherits Persona {
    const tecnicas = ["cultivo"]

    override method recursos() = super() * tecnicas.size()
    override method esDestacada() = super() or tecnicas.size()

    method realizarTecnica(unaTecnica, unTiempo) {
        if (tecnicas.contains(unaTecnica)) {
            recursos += 3 * unTiempo
        }

        else {
            recursos -= 1
        }
    }

    method aprenderTecnica(unaTecnica) {
        tecnicas.add(unaTecnica)
    }

    override method trabajar(unPlaneta, unTiempo) {
        if (unPlaneta.esHabitante(self)) {
            self.realizarTecnica(tecnicas.last(), unTiempo)
        }
    }
}

class Constructor inherits Persona {
    var cantConstrucciones = 0
    const region

    override method recursos() = super() + cantConstrucciones * 10
    override method esDestacada() = cantConstrucciones > 5

    override method trabajar(unPlaneta, unTiempo) {
        unPlaneta.agregarConstruccion(region.estructuraQueConstruye(unTiempo, self))
        recursos -= 5
        cantConstrucciones += 1
    }
}

object montania {
    method estructuraQueConstruye(unTiempo, unConstructor) {
        return new Muralla(longitud = unTiempo)
    }
}

object costa {
    method estructuraQueConstruye(unTiempo, unConstructor) {
        return new Museo(superficie = unTiempo, nivelImportancia = 1)
    }
}

object llanura {
    method estructuraQueConstruye(unTiempo, unConstructor) {
        if (unConstructor.esDestacada()) {
            return new Museo(superficie = unTiempo, nivelImportancia = 4)
        }

        else {
            return new Muralla(longitud = unTiempo / 2)
        }
    }
}

object ciudad {
    method estructuraQueConstruye(unTiempo, unConstructor) {
        if (unConstructor.edad() < 30) {
            return new Muralla(longitud = unTiempo * 2)
        }

        else {
            return new Museo(superficie = unTiempo / 2, nivelImportancia = 3)
        }
    }
}