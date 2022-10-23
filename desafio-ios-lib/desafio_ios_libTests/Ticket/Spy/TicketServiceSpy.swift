//
//  TicketServiceSpy.swift
//  desafio_ios_libTests
//
//  Created by Rodrigo Gonçalves de Queiroz on 23/10/22.
//

@testable import desafio_ios_lib

final class TicketServiceSpy: TicketService {
    
    private(set) var getTicketCallCount = 0
    
    func getTicket() {
        getTicketCallCount += 1
    }
}
