//
//  DataValidationTestCase.swift
//  NYCSchoolInformationTests
//
//  Created by Kushboo Patel on 1/27/24.
//

import XCTest
@testable import NYCSchoolInformation

final class DataValidationTestCase: XCTestCase {
    
    var networkCall: Networking!
    
    override func setUp() {
        super.setUp()
        // Initialize your networking object or mock here
        networkCall = Networkcall()
    }
    
    func testSchoolDecoding() {
        let json = """
        {
            "result": [
                {
                    "school_name": "Sample School",
                    "overview_paragraph": "Sample Overview",
                    "location": "Sample Location",
                    "phone_number": "123-456-7890",
                    "fax_number": "123-456-7891",
                    "school_email": "sample@email.com",
                    "website": "http://www.sample.com"
                }
            ]
        }
        """
        
        guard let jsonData = json.data(using: .utf8) else {
            XCTFail("Failed to convert JSON string to data")
            return
        }
        
        do {
            let schoolResponse = try JSONDecoder().decode(SchoolResponse.self, from: jsonData)
            XCTAssertEqual(schoolResponse.result.count, 1, "Expected one school in the response")
            
            let sampleSchool = School(
                school_name: " School",
                overview_paragraph: " Overview",
                location: " Location",
                phone_number: "123-456-7890",
                fax_number: "123-456-7891",
                school_email: "abc@email.com",
                website: "http://www.abc.com"
            )
            
            XCTAssertEqual(schoolResponse.result.first, sampleSchool, "Decoded school does not match the expected school")
        } catch {
            XCTFail("Failed to decode JSON: \(error)")
        }
    }
}
