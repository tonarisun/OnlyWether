//
//  WeatherFabric.swift
//  OnlyWeather
//
//  Created by Olga Lidman on 19.06.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class WeatherFabric: BaseFabric {
    
    //MARK: - Register Cells
    override func registerCells() {
        self.tableView?.ow_register(TodayWeatherCell.self)
        self.tableView?.ow_register(DayWeatherCell.self)
        self.tableView?.ow_register(NEWHoursWeatherTableCell.self)
    }
    
    //MARK: - Cells
    override func cell(for rowModel: RowModel, at indexPath: IndexPath) -> UITableViewCell {
        
        guard let tableView = self.tableView else { return UITableViewCell() }
        
        if let todayModel = rowModel as? TodayWeatherRowModel,
            let cell = tableView.ow_dequeueReusablweCell(TodayWeatherCell.self, indexPath: indexPath) {
            return cell.construct(with: todayModel)
        }
        
        if let dayModel = rowModel as? DayWeatherRowModel,
            let cell = tableView.ow_dequeueReusablweCell(DayWeatherCell.self, indexPath: indexPath) {
            return cell.construct(with: dayModel)
        }
        
        if let newModel = rowModel as? NEWHoursWeatherTableRowModel,
            let cell = tableView.ow_dequeueReusablweCell(NEWHoursWeatherTableCell.self, indexPath: indexPath) {
            return cell.construct(with: newModel)
        }
        
        return UITableViewCell()
    }
}

