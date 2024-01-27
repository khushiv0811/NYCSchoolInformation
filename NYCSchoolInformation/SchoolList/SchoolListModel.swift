//
//  SchoolListModel.swift
//  NYCSchoolInformation
//
//  Created by Kushboo Patel on 1/27/24.
//

import Foundation
let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()
struct School: Decodable,Equatable, Hashable {
    let school_name: String
    let overview_paragraph: String?
    let location: String?
    let phone_number: String?
    let fax_number: String?
    let school_email: String?
    let website: String?
}

struct SchoolResponse: Decodable {
    let result : [School]
}
