//
//  CitiesListService.swift
//  WeatherApp
//
//  Created by Ivan on 26.01.2021.
//

import Foundation
import Moya
import SwiftyJSON

protocol CitiesListServiceProtocol {
    func getListCities(completion: @escaping (Result<[CitiesViewData.CityWeatherModel], Error>) -> Void)
    init(provider: MoyaProvider<WeatherAPI>)
}

class CitiesListService: CitiesListServiceProtocol {
    var moyaProvider: MoyaProvider<WeatherAPI>
    
    required init(provider: MoyaProvider<WeatherAPI>) {
        self.moyaProvider = provider
    }
    
    func getListCities(completion: @escaping (Result<[CitiesViewData.CityWeatherModel], Error>) -> Void) {
        moyaProvider.request(.listCities(bbox: NetworkConstants.bbox,
                                         appId: NetworkConstants.appId)) { (result) in
            switch result {
            case .success(let response):
                let json = try! JSON(data: response.data)["list"]
                let models = json.map { CitiesViewData.CityWeatherModel(json: $0.1)}
                completion(.success(models))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
