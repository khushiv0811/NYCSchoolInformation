//
//  MockNetworkCall.swift
//  NYCSchoolInformation
//
//  Created by Kushboo Patel on 1/27/24.
//

import Foundation
struct mockNetworkCallFail: Networking {
    func getSchoolList(completionHandler: @escaping(_ result: [School], _ success: Bool) -> Void) {
        guard let url = URL(string: schoolListUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            completionHandler([], false)
            
        }.resume()
    }
}
struct mockNetworkCallSuccess: Networking {
    func getSchoolList(completionHandler: @escaping(_ result: [School], _ success: Bool) -> Void) {
        guard let url = URL(string: schoolListUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            completionHandler([], true)
            
        }.resume()
    }
    
    
}
