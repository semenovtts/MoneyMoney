//
//  ViewController.swift
//  MoneyMoney
//
//  Created by Evgeny Semenov on 05/02/2020.
//  Copyright © 2020 Evgeny Semenov. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let dict = 
		
		let url = URL (string: "https://api.exchangeratesapi.io/history?start_at=2018-01-01&end_at=2018-09-01&symbols=USD,GBP")!
		let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
			guard let data = data else { return }
			print(String(data: data, encoding: .utf8)!)
		}
		
		
		task.resume()
		
		
		var lineChartEntry = [ChartDataEntry]()
		
		let value1 = ChartDataEntry(x: 1, y: 1)
		let value2 = ChartDataEntry(x: 2, y: 2)
		let value3 = ChartDataEntry(x: 3, y: 3)
		
		lineChartEntry.append(value1)
		lineChartEntry.append(value2)
		lineChartEntry.append(value3)
		
		let line1 = LineChartDataSet(entries: lineChartEntry, label: "Number")
		line1.colors = [NSUIColor.blue]
		
	
		let viewChart = LineChartView(frame: self.view.frame)
		let data = LineChartData()
		data.addDataSet(line1)
		viewChart.data = data
		self.view.addSubview(viewChart)
		
		
		
		
		
		
		
		
	
	}


}

