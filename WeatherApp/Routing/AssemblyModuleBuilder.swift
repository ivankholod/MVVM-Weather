//
//  AssemblyModuleBuilder.swift
//  WeatherApp
//
//  Created by Ivan on 27.01.2021.
//

import Foundation
import UIKit
import Moya

protocol AssemblyBuilderProtocol {
    func createMainModule(router: Router) -> UIViewController
    func createDetailModule(model: CitiesViewData.CityWeatherModel, router: Router) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: Router) -> UIViewController {
        let service = CitiesListService(provider: MoyaProvider<WeatherAPI>())
        let viewModel = CitiesListViewModel(service: service, router: router)
        let viewController = CitiesListViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createDetailModule(model: CitiesViewData.CityWeatherModel, router: Router) -> UIViewController {
        let viewController = DetailWeatherInfoViewController()
        let viewModel = DetailWeatherInfoViewModel(model: model)
        viewController.viewModel = viewModel
        return viewController
    }
}
