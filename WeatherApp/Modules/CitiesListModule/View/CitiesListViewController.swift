//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ivan on 23.01.2021.
//

import UIKit

class CitiesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
    public var viewModel: CitiesListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    
        viewModel.updateCitiesViewData = { [weak self] viewData in
            switch viewData {
            case .loading(let isLoading):
                self?.activityIndicator.isHidden = !isLoading
                self?.tableView.isHidden = isLoading
            case .success:
                self?.tableView.reloadData()
            case .failure(let error):
                self?.activityIndicator.isHidden = true
                self?.tableView.isHidden = true
                print(error)
            }
        }
        
        viewModel.loadView()
    }
    
    func registerCells() {
        self.tableView.register(UINib(nibName: String(describing: CityWeatherTableViewCell.self),
                                      bundle: nil),
                                forCellReuseIdentifier: String(describing: CityWeatherTableViewCell.self))
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension CitiesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CityWeatherTableViewCell.self), for: indexPath) as! CityWeatherTableViewCell
        let model = viewModel.models[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelect(index: indexPath.row)
    }
}
