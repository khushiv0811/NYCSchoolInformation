//
//  NetworkCall.swift
//  NYCSchoolInformation
//
//  Created by Kushboo Patel on 1/27/24.
//

import Foundation
import Combine

protocol Networking {
    func getSchoolList(completionHandler: @escaping(_ result: [School], _ success: Bool) -> Void)
}

struct Networkcall: Networking {
    func getSchools() -> some Publisher<SchoolResponse, Error> {
        let url = URL(string: schoolListUrl)!
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: SchoolResponse.self, decoder: jsonDecoder)
    }
    func getSchoolList(completionHandler: @escaping(_ result: [School], _ success: Bool) -> Void) {
        guard let url = URL(string: schoolListUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([School].self, from: data)
                DispatchQueue.main.async {
                    
                    completionHandler(decodedData, true)
                }
            } catch {
                completionHandler([], false)
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}


