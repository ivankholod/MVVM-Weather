//
//  DetailWeatherInfoViewController.swift
//  WeatherApp
//
//  Created by Ivan on 27.01.2021.
//

import UIKit

class DetailWeatherInfoViewController: UIViewController {
    public var viewModel: DetailWeatherInfoViewModelProtocol!
  
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var feelsLikeValueLabel: UILabel!
    @IBOutlet weak var pressureValueLabel: UILabel!
    @IBOutlet weak var temperatureValueLabel: UILabel!
    @IBOutlet weak var temperatureMinValueLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    @IBOutlet weak var temperatureMaxValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.configureDetailInfoViewData = { [weak self] viewData in
            switch viewData {
            case .configureView(let data):
                self?.cityNameLabel.text = data.name
                self?.feelsLikeValueLabel.text = data.feelsLike
                self?.pressureValueLabel.text = data.pressure
                self?.temperatureValueLabel.text = data.temp
                self?.temperatureMinValueLabel.text = data.tempMin
                self?.temperatureMaxValueLabel.text = data.tempMax
                self?.humidityValueLabel.text = data.humidity
            }
        }
        
        viewModel.loadView()
    }
}
