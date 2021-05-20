//
//  CityService.swift
//  map
//
//  Created by Adam Mabrouki on 20/05/2021.
//

import Foundation
class CityService {
    
    // MARK: - Propreties
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = HTTPClient()){
        self.httpClient = httpClient
    }
    
    // MARK: - Netwok call
    
    func getCityInfo( callback: @escaping (Result<CityInfo, NetworkError>) -> Void) {
        guard let url = URL(string: "http://lmstudio.free.fr/lyon.json") else {return}
        httpClient.request(baseUrl: url, parameters: nil)   { (result: Result<CityInfo, NetworkError>) in
            switch result {
            case .success(let data):
                callback(.success(data))
            case .failure(let error):
                callback(.failure(error))
            }
            
        }
    }
}

