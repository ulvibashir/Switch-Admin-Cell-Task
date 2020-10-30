//
//  API.swift
//  adminAPp
//
//  Created by Ulvi Bashirov on 10/7/20.
//

import Foundation


struct API {
    static var session =  URLSession.shared
    static var url = URL(string: "https://swapi.dev/api/starships")!
    
    static func getDataFromApi(completion: @escaping (StarShip)->()) {
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            if error != nil {
                print(error ?? "empty error")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(StarShip.self, from: data! )
                completion(json)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
}

