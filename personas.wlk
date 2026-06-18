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
}