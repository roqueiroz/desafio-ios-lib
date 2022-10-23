//
//  TicketRequest.swift
//  desafio-ios-lib
//
//  Created by Rodrigo Gonçalves de Queiroz on 22/10/22.
//

import Foundation

internal struct TicketRequest: Codable {
    var systemUptime: String
    var latitude: String
    var longitude: String
    var deviceMode: String
}
