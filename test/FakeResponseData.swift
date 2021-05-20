//
//  FakeResponseData.swift
//  mapTests
//
//  Created by Adam Mabrouki on 20/05/2021.
//
import Foundation
class FakeResponseData {
    
    // MARK: - Data
    
    static var correctData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "CityInfo", withExtension: ".json")!
        return try! Data(contentsOf: url)
    }
       
    static let incorrectData = "erreur".data(using: .utf8)!

    
    // MARK: - Response
    
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://developer.apple.com")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://developer.apple.com")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!


    // MARK: - Error
    
    class HttpEngineError: Error {}
    static let error = HttpEngineError()
}
