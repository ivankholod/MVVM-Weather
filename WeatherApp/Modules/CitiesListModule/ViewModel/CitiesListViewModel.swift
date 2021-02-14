//
//  CitiesListViewModel.swift
//  WeatherApp
//
//  Created by Ivan on 26.01.2021.
//

import Foundation
import Moya
import SwiftyJSON

protocol CitiesListViewModelProtocol {
    var updateCitiesViewData: ((CitiesViewData) -> ())? { get set }
    var models: [CitiesViewData.CityWeatherModel] { get }
    func loadView()
    func didSelect(index: Int)
}

final class CitiesListViewModel: CitiesListViewModelProtocol {
    var service: CitiesListServiceProtocol
    var router: RouterProtocol
    
    public var updateCitiesViewData: ((CitiesViewData) -> ())?
    var models: [CitiesViewData.CityWeatherModel] = []
    
    init(service: CitiesListServiceProtocol, router: RouterProtocol) {
        self.service = service
        self.router = router
    }
    
    func loadView() {
        updateCitiesViewData?(.loading(true))
        service.getListCities { [weak self] (result) in
            switch result {
            case .success(let models):
                self?.models = models
                DispatchQueue.main.async {
                    self?.updateCitiesViewData?(.success)
                }
            case .failure(let error):
                self?.updateCitiesViewData?(.failure(error.localizedDescription))
            }
            self?.updateCitiesViewData?(.loading(false))
        }
    }
    
    func didSelect(index: Int) {
        let selectedModel = models[index]
        router.showDetail(model: selectedModel)
    }
}
