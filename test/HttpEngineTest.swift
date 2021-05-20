//
//  HttpEngineTest.swift
//  mapTests
//
//  Created by Adam Mabrouki on 20/05/2021.
//
import XCTest
@testable import map

final class ClassHttpEngineTests: XCTestCase {
    
    
     // MARK: - Properties
    func testRequestMethod_WhenErrorIsGiven_ThenShouldReturnAnError() {
        // Given
        let httpEngine = HTTPEngine(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        httpEngine.request(baseUrl: URL(string:"https://www.google.com")!, parameters: nil) { (data, _, error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    
    func testRequestMethod_WhenCorrectResponseIsGiven_ThenShouldReturnData() {
        // Given
        let httpEngine = HTTPEngine(session: URLSessionFake(data: FakeResponseData.correctData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        httpEngine.request(baseUrl: URL(string:"https://www.google.com")!, parameters: nil) { (data, _, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    }

