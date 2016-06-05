//
//  Statistics3ViewController.swift
//  OTT
//
//  Created by 박재유 on 2016. 6. 4..
//  Copyright © 2016년 Troy Stribling. All rights reserved.
//
import UIKit
import Charts
import CoreMotion

class Statistics3ViewController: UIViewController, ChartViewDelegate {
    

    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPieChartView()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setPieChartData() {
        
        let mult = UInt32(100)
        let count = Int(4)
        
        let parties = [
            "Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
            "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
            "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
            "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
            "Party Y", "Party Z"
        ]
        
        var yVals1 = [ChartDataEntry]()
        
        // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
        for i in 0 ..< count
        {
            let chartDataEntry = ChartDataEntry(value: Double((arc4random_uniform(mult) + mult/5)), xIndex: i)
            yVals1.append(chartDataEntry)
        }
        
        var xVals = [String?]()
        
        for i in 0 ..< count
        {
            xVals.append(parties[i % parties.count])
            //[xVals addObject:parties[i % parties.count]]
        }
        
        let dataSet = PieChartDataSet(yVals: yVals1, label: "Election Results")
        dataSet.sliceSpace = 3.0
        
        // add a lot of colors
        
        //var testColors = [UIColor]()
        //testColors.append(UIColor.blueColor())
        let data = PieChartData(xVals: xVals, dataSet: dataSet)
        
        pieChartView.data = data
        
        //dataSet.colors = testColors
        dataSet.colors = ChartColorTemplates.colorful()
        dataSet.drawValuesEnabled = true
        
        dataSet.sliceSpace = 4.0
    }

    private func setupPieChartView() {
        self.pieChartView.usePercentValuesEnabled = true
        self.pieChartView.drawSlicesUnderHoleEnabled = false
        self.pieChartView.holeRadiusPercent = 0.58;
        self.pieChartView.transparentCircleRadiusPercent = 0.61
        self.pieChartView.descriptionText = "차트의 설명"
        self.pieChartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        
        self.pieChartView.drawCenterTextEnabled = true
        
        //self.pieChartView.centerAttributedText = "asdf"!
        self.pieChartView.drawHoleEnabled = true
        self.pieChartView.rotationAngle = 0
        self.pieChartView.rotationEnabled = true
        self.pieChartView.highlightPerTapEnabled = true
        
        print("setting")
        self.setPieChartData()
        
    }
    
}