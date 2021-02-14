//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Ivan on 23.01.2021.
//

import Foundation
import Moya

enum WeatherAPI {
    case listCities(bbox: [Int], appId: String)
}

extension WeatherAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/")!
    }
    
    var path: String {
        switch self {
        case .listCities:
            return "box/city"
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .listCities(let bbox, let appId):
            let bboxStrings = bbox.map { "\($0)" }.joined(separator: ",")
            let parameters: [String: Any] = ["bbox": bboxStrings,
                                             "appid": appId]
            
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.queryString)
        }
    }
}
