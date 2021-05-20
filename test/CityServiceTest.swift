//
//  WeatherServiceTest.swift
//  map
//
//  Created by Adam Mabrouki on 20/05/2021.
//

import XCTest
@testable import map

final class CityServiceTest: XCTestCase {
    
    // MARK: - Properties
    /// error case
    func testRequestMethod_WhenErrorIsGiven_ThenShouldReturnAnError() {
        let httpEngine = HTTPEngine(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        let httpClient = HTTPClient(httpEngine: httpEngine)
        // Given
        let cityService = CityService(httpClient: httpClient)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        cityService.getCityInfo { result  in
            guard case .failure(let error) = result else {return}
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    /// succes case
    func testRequestMethod_WhenResponseIsGiven_ThenShouldReturnData() {
        let httpEngine = HTTPEngine(session: URLSessionFake(data: FakeResponseData.correctData, response: FakeResponseData.responseOK, error: nil))
        let httpClient = HTTPClient(httpEngine: httpEngine)
        // Given
        let cityService = CityService(httpClient: httpClient)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        cityService.getCityInfo { result  in
            guard case .success(let data) = result else {return}
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testRequestMethod_WhenErrorIsGiven_ThenShouldReturnAResponseErrors() {
        let httpEngine = HTTPEngine(session: URLSessionFake(data: FakeResponseData.correctData, response:FakeResponseData.responseKO, error:nil))
        let httpClient = HTTPClient(httpEngine: httpEngine)
        // Given
        let cityService = CityService(httpClient: httpClient)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        cityService.getCityInfo { result  in
            guard case .failure(let error) = result else {return}
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testRequestMethod_WhenErrorIsGiven_ThenShouldReturnADataErrors() {
        let httpEngine = HTTPEngine(session: URLSessionFake(data: FakeResponseData.incorrectData, response:FakeResponseData.responseOK, error:nil))
        let httpClient = HTTPClient(httpEngine: httpEngine)
        // Given
        let cityService = CityService(httpClient: httpClient)
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        cityService.getCityInfo{ result  in
            guard case .failure(let error) = result else {return}
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
