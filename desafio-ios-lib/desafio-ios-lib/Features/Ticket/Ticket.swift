//
//  Ticket.swift
//  desafio-ios-lib
//
//  Created by Rodrigo Gonçalves de Queiroz on 22/10/22.
//

import UIKit

typealias CompletionRequestTicket = (_ ticket: String?, _ isSuccess: Bool) -> Void

public class Ticket {
    
    static public var shared = Ticket()
    
    private var service = TicketService()
    private var deviceInfo = DeviceInfo()
    
    public func requestTicket(completion: @escaping (_ ticket: String?, _ isSuccess: Bool) -> Void) {
        
        let request = TicketRequest(
            systemUptime: deviceInfo.systemUptime(),
            latitude: deviceInfo.getLocation().0,
            longitude: deviceInfo.getLocation().1,
            deviceMode: deviceInfo.getInfoPlatform()
        )

        do {
            
            let jsonData = try JSONEncoder().encode(request)
            
            service.getTicket(deviceInfo: jsonData) { result in
               
                completion(result.ticket, result.isSuccess)
               
            }
            
        } catch {
            
        }
        
    }
    
}
