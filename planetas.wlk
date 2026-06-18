class Planeta {
    const habitantes = #{}
    const construcciones = []

    method esHabitante(unaPersona) = habitantes.contains(unaPersona)

    method agregarHabitante(unaPersona) {
        habitantes.add(unaPersona)
    }

    method agregarHabitantes(unasPersonas) {
        habitantes.addAll(unasPersonas)
    }

    method agregarConstruccion(unaConstruccion) {
        construcciones.add(unaConstruccion)
    }

    method agregarConstrucciones(unasConstrucciones) {
        construcciones.addAll(unasConstrucciones)
    }

    method delegacionDiplomatica() {
        return self.habitantesDestacados() + #{(self.habitanteConMasRecursos())}
    } 

    method habitantesDestacados() {
        return habitantes.filter({h => h.esDestacada()})
    }

    method habitanteConMasRecursos() {
        return habitantes.max({h => h.recursos()})
    }

    method esValioso() = self.valorDeTodasLasConstrucciones() > 100

    method valorDeTodasLasConstrucciones() = construcciones.sum({c => c.valor()})
}