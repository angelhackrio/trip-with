//
//  APIClient.swift
//  AngelHackRio
//
//  Created by Jean Paul Marinho on 25/06/16.
//  Copyright © 2016 Jean Paul Marinho. All rights reserved.
//

import Foundation

class APIClient {

    static let sharedInstance = APIClient()

    func login(completionHandler: (success: Bool) -> ()) {
        let url = "https://api-prj02.conectcar.com/api/Cep"
        let parameters = ["cep":"03679090","idAdesao":0]
        let request = clientURLRequest(path: url, params: parameters)
        post(request: request) { (success, data) in
            if success {
                print(data)
                completionHandler(success: true)
            }
        }
    }
    
    func guides() {
        let url = "https://api.cartolafc.globo.com/mercado/status"
        let request = clientURLRequest(path: url)
        get(request: request) { (success, data) in
            if success {
                print(data)
            }
        }
    }
}



//Composition methods
extension APIClient {
    private func post(request: NSMutableURLRequest, completion: (success: Bool, data: NSData) -> ()) {
        dataTask(request: request, method: "POST", completion: completion)
    }
    
    private func put(request: NSMutableURLRequest, completion: (success: Bool, data: NSData) -> ()) {
        dataTask(request: request, method: "PUT", completion: completion)
    }
    
    private func get(request: NSMutableURLRequest, completion: (success: Bool, data: NSData) -> ()) {
        dataTask(request: request, method: "GET", completion: completion)
    }
    
    private func dataTask(request: NSMutableURLRequest, method: String, completion: (success: Bool, data: NSData) -> ()) {
        request.httpMethod = method
        let session = URLSession(configuration: URLSessionConfiguration.default())
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                if let response = response as? HTTPURLResponse where 200...299 ~= response.statusCode {
                    completion(success: true, data: data)
                } else {
                    completion(success: false, data: data)
                }
            }
            }.resume()
    }
    
    private func clientURLRequest(path: String, params: Dictionary<String, AnyObject>? = nil) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: URL(string: path)! as URL)
        if let params = params {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            var jsonData: Data?
            do {
                jsonData = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
            }
            catch {
            }
            request.httpBody = jsonData!
        }
        
        return request
    }
}
