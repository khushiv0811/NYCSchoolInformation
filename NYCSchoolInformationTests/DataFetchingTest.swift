//
//  DataFetchingTest.swift
//  NYCSchoolInformationTests
//
//  Created by Kushboo Patel on 1/27/24.
//

import XCTest
@testable import NYCSchoolInformation

final class DataFetchingTest: XCTestCase {
    func testDataFetchFail() {
        let expectation = self.expectation(description: "API Called sucessfully")
        mockNetworkCallFail().getSchoolList { result, success in
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testDataFetchPass() {
        let expectation = self.expectation(description: "API Called sucessfully")
        mockNetworkCallSuccess().getSchoolList { result, success in
            XCTAssertTrue(success)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testGetSchoolListIntegration() {
        let expectation = self.expectation(description: "Fetching school list from the real service")
        
        Networkcall().getSchoolList { schools, success in
            XCTAssertTrue(success, "Fetching school list should be successful")
            XCTAssertFalse(schools.isEmpty, "Fetched school list should not be empty")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
