//
//  TodayWeatherCell.swift
//  OnlyWeather
//
//  Created by Olga Lidman on 08/06/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class TodayWeatherCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var nowLabel: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var skyImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var skyDescriptionLabel: UILabel!
    @IBOutlet weak var windDirectionImageView: UIImageView!
        
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let now = "Now".localized()
        nowLabel.attributedText = NSAttributedString(string: now, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        self.subView.configureShadow()
    }
    
    //MARK: - Construct
    func construct(with model: TodayWeatherRowModel) -> TodayWeatherCell {
        if model.timeInt > model.sunriseInt, model.timeInt < model.sunsetInt {
            self.skyImageView.image = SkyImageHelper.setSkyImageDay(skyDescription: model.description)
            self.subView.backgroundColor = #colorLiteral(red: 0.4134832621, green: 0.6359115243, blue: 0.7319585085, alpha: 1)
        } else {
            self.skyImageView.image = SkyImageHelper.setSkyImageNight(skyDescription: model.description)
            self.subView.backgroundColor = #colorLiteral(red: 0.264832288, green: 0.4864405394, blue: 0.582516849, alpha: 1)
        }

        self.tempLabel.text = "\(model.temp) °"
        self.pressureLabel.text = "\(model.pressure) " + "mm".localized()
        self.humidityLabel.text = "\(model.humidity) %"
        self.windSpeedLabel.text = "\(model.windSpeed) " + "m/s".localized()
        self.windDirectionImageView.image = SkyImageHelper.setWindDirectionImage(degree: model.windDirection)
        self.skyDescriptionLabel.text = model.description.localized()
        self.sunriseLabel.text = model.sunrise
        self.sunsetLabel.text = model.sunset
        return self
    }
}