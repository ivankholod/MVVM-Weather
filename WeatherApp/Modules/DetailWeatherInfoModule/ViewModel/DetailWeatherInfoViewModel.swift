//
//  DetailWeatherInfoViewModel.swift
//  WeatherApp
//
//  Created by Ivan on 27.01.2021.
//

import Foundation

protocol DetailWeatherInfoViewModelProtocol {
    var configureDetailInfoViewData: ((DetailWeatherInfoViewData) -> ())? { get set }
    var model: CitiesViewData.CityWeatherModel { get }
    func loadView()
}

final class DetailWeatherInfoViewModel: DetailWeatherInfoViewModelProtocol {
    
    var model: CitiesViewData.CityWeatherModel
    var configureDetailInfoViewData: ((DetailWeatherInfoViewData) -> ())?
    
    init(model: CitiesViewData.CityWeatherModel) {
        self.model = model
    }
    
    func loadView() {
        self.configureDetailInfoViewData?(.configureView(self.model))
    }
}
