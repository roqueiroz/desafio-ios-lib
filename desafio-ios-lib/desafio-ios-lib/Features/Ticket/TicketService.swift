//
//  TicketService.swift
//  desafio-ios-lib
//
//  Created by Rodrigo Gonçalves de Queiroz on 22/10/22.
//

import Foundation

private let urlStr = "https://run.mocky.io/v3/ca30b574-72b5-40ed-b83c-63e547378ebe"



protocol TicketServiceResponse: AnyObject {
    typealias completionCallBack <T: Decodable> = (_ result: TicketResponse) -> Void
}

protocol TicketServiceDelegate: TicketServiceResponse {
    func getTicket(deviceInfo: Data, completion: @escaping completionCallBack<TicketResponse>)
}

internal class TicketService: TicketServiceDelegate {
    
    let apiRequest = ApiRequestMaker()
    
    func getTicket(deviceInfo: Data, completion: @escaping completionCallBack<TicketResponse>) {
        
        guard let url = URL(string: urlStr) else {
            return completion(TicketResponse(isSuccess: false))
        }
        
        try? ApiRequestMaker.shared.request(from: url, method: .POST, data: deviceInfo, type: TicketResponse.self) { result, failure in
            
            if failure == nil {
                
                guard let _result = result,
                      let _ticket = _result.ticket else {
                    completion(TicketResponse(isSuccess: false))
                    return
                }
                
                let ticket = TicketResponse(_ticket, isSuccess: true)
                
                completion(ticket)
                
            } else{
                completion(TicketResponse(isSuccess: false))
            }
            
            
        }

    }
    
}

