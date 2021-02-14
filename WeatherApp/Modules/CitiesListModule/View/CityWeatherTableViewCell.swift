//
//  CityWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Ivan on 27.01.2021.
//

import UIKit

class CityWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(model: CitiesViewData.CityWeatherModel) {
        self.cityNameLabel.text = model.name
    }
    
}
