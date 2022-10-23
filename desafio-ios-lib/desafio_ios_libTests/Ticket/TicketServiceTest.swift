//
//  TicketServiceTest.swift
//  desafio_ios_libTests
//
//  Created by Rodrigo Gonçalves de Queiroz on 23/10/22.
//

import XCTest
@testable import desafio_ios_lib

final class TicketServiceTest: XCTestCase {

    private var ticketServiceSpy: TicketServiceSpy!
    private var sut: TicketService!
    
    override func setUp() {
        super.setUp()
        
        ticketServiceSpy = TicketServiceSpy()
        sut = TicketServiceSpy()
    }
    
    override func tearDown() {
        super.tearDown()
        
        ticketServiceSpy = nil
    }
    
    func testGetTicket() {
        setUp()
        
        XCTAssertEqual(ticketServiceSpy.getTicketCallCount, 1)
    }
}
