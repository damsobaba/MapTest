//
//  URLSessionFake.swift
//  mapTests
//
//  Created by Adam Mabrouki on 20/05/2021.
//

import Foundation


class URLSessionFake: URLSession {
    
    // MARK: - parameters
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    // MARK: - Propreties
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSessionDataTaskFake(data: data, urlResponse: response, responseError: error, completionHandler: completionHandler)
        return task
    }
}


class URLSessionDataTaskFake: URLSessionDataTask {
    // MARK: - parameters
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    var data: Data?
    var urlResponse: URLResponse?
    var responseError: Error?
    init(data: Data?, urlResponse: URLResponse?, responseError: Error?, completionHandler: ((Data?, URLResponse?, Error?) -> Void)?) {
        self.data = data
        self.urlResponse = urlResponse
        self.responseError = responseError
        self.completionHandler = completionHandler
    }
    // MARK: - Properties
    override func resume() {
        completionHandler?(data, urlResponse, responseError)
    }
    override func cancel() {}
}
