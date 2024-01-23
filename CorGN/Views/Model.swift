//
//  Model.swift
//  CorGN
//
//  Created by Luciano Nicolini on 20/01/2024.
//

import Foundation

struct HomeModel: Identifiable, Hashable {
    var id: UUID = .init()
    var name: String
    var image: String
    var link: String
    var caption: String
}

var ModelList: [HomeModel] = [
    HomeModel(name: "Cerac Travel", image: "1", link: "", caption: "Se informa a los Señores Asociados que el pasado 05 de Enero del corriente, el Consejo Directivo firmo un Convenio con la Empresa de Turismo Cerac Travel, en dónde se ofrecen diversas promociones de viajes Nacionales e Internacionales, con descuentos del 5% sobre los precios publicados para los Asociados del COR"),
    HomeModel(name: "AVISO IMPORTANTE", image: "2", link: "", caption: "Se pone en conocimiento de los señores asociados que en el mes de ENE2024 el Centro permanece en receso administrativo. Manteniendose los canales de comunicacion por email a: secretaria@corgn.com, tesoreria@corgn.com"),
    HomeModel(name: "name", image: "3", link: "", caption: ""),
    HomeModel(name: "name", image: "4", link: "", caption: ""),
]
