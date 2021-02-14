//
//  Router.swift
//  WeatherApp
//
//  Created by Ivan on 27.01.2021.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(model: CitiesViewData.CityWeatherModel)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else {
                return
            }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetail(model: CitiesViewData.CityWeatherModel) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(model: model, router: self) else {
                return
            }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
