//
//  GalleryApiClient.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiExecutable: class {
    func execute<parseClass:Codable>(path:String, method:GalleryApiClient.HTTPMethod , parameters:[String:Any], completionHandler: @escaping (parseClass?, GalleryApiClientError?) -> Void )
}

class GalleryApiClient: ApiExecutable {
    
    private(set) var userName: String
    private(set) var password: String
    private(set) var baseUrl: String
    
    init(baseUrl: String, userName: String, password: String) {
        self.userName = userName
        self.password = password
        self.baseUrl = baseUrl
    }
    
    public enum Endpoints: String {
        case getImages = "resources/image"
    }
    
    public enum HTTPMethod: String {
        case get = "GET" // Currently Api have only get requests
    }
    
    fileprivate func url(for endPoint: Endpoints) -> String {
        return "\(baseUrl)\(endPoint.rawValue)"
    }
    
    fileprivate func url(for path: String) -> String {
        return "\(baseUrl)\(path)"
    }
    
    public func execute<parseClass:Codable>(path:String, method:GalleryApiClient.HTTPMethod , parameters:[String:Any] = [:], completionHandler: @escaping (parseClass?, GalleryApiClientError?) -> Void ) {
        
        var generalParameters = [String:Any]()
        
        generalParameters.merge(with: parameters)
        
        
        Alamofire.request(url(for: path), method: Alamofire.HTTPMethod.init(rawValue: method.rawValue)!, parameters: generalParameters, headers: nil).authenticate(user: userName, password: password).responseData { (response) in
            
            switch response.result {
            case .success(let data):
                do {
                    let object = try JSONDecoder().decode(parseClass.self, from: data)
                    completionHandler(object, nil)
                }
                catch {
                    completionHandler(nil, GalleryApiClientError.technicalDifficulties)
                }
            case .failure(let error):
                completionHandler(nil, GalleryApiClientError.serverError(message: error.localizedDescription, code: error.code))
            }
            
        }
    }
}


// Addding a singleton
extension GalleryApiClient {
    static var shared = GalleryApiClient(baseUrl: "https://api.cloudinary.com/v1_1/elwan/",
                                         userName: "869564993598122",
                                         password: "BJCH8gsmqLtnYYarWLR-sptxFFU")
}
