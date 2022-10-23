//
//  TicketResponse.swift
//  desafio-ios-lib
//
//  Created by Rodrigo Gonçalves de Queiroz on 22/10/22.
//

import Foundation

internal struct TicketResponse: Decodable {
    
    var ticket: String?
    var isSuccess: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case ticket
    }
    
    init(_ ticket: String? = nil, isSuccess: Bool) {
        self.ticket = ticket
        self.isSuccess = isSuccess
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.ticket = try container.decodeIfPresent(String.self, forKey: .ticket) ?? nil
        
        if self.ticket == nil {
            self.isSuccess = false
        } else {
            self.isSuccess = true
        }
        
    }
    
    
}
