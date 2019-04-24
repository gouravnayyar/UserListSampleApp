//
//  Remote+JSONDecoder.swift
//  UserListSampleApp
//
//  Created by Gourav Nayyar on 24/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import Foundation


extension JSONDecoder {


    func decode<T: Decodable>(_ type: T.Type, fromURL url: String, completion: @escaping(T) -> Void) {

        guard let url  = URL(string:url) else {
            fatalError("URl should be correct")
        }

        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                let response = try decoder.decode(type, from: data)

                DispatchQueue.main.async { // return the data on the main thread
                    completion(response)
                }

            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}