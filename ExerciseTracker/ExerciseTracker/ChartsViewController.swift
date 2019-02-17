//
//  ChartsViewController.swift
//  ExerciseTracker
//
//  Created by Kai Munechika on 2/14/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import Charts

class ChartsViewController: UIViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var yVals: [Double] = [2, 5, 7, 8, 10, 9, 11, 13]
    var xVals: [Double] = (1...8).map { Double($0) }
    
    let chartColor = UIColor(red:0.33, green:0.43, blue:1.00, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup xVals and yVals here
        
        setupChart()
    }
    
    func setupChart() {
        // data point setup 
        var lineChartEntry = [ChartDataEntry]()
        
        for i in 0..<yVals.count { 
            let dataPoint = ChartDataEntry(x: xVals[i], y: yVals[i])
            lineChartEntry.append(dataPoint)
        }
        
        let chartDataSet = LineChartDataSet(values: lineChartEntry, label: "test label")
        let chartData = LineChartData()
        chartData.addDataSet(chartDataSet)
        chartData.setDrawValues(true)   // display values above points
        
        // color config
        chartDataSet.colors = [chartColor]
        chartDataSet.setCircleColor(chartColor)
        chartDataSet.circleHoleColor = chartColor
        chartDataSet.circleRadius = 4.0
        
        // gradient fill
        let gradientColors = [chartColor.cgColor, UIColor.clear.cgColor] as CFArray
        let colorLocations: [CGFloat] = [1.0, 0.0] // positioning of gradient
        guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) else { print("gradient error"); return }
        chartDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        chartDataSet.drawFilledEnabled = true
        
        // Axes setup
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.valueFormatter = nil // todo
        lineChartView.chartDescription?.enabled = false
        lineChartView.legend.enabled = false
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.drawLabelsEnabled = true
        
        // animation
        lineChartView.animate(yAxisDuration: 0.6, easingOption: .easeInSine)
        
        lineChartView.data = chartData

    }
}
