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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.pieChartView.animate(yAxisDuration: 1.4, easingOption: ChartEasingOption.EaseOutBack)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setPieChartData() {
        
        let mult = UInt32(100)
        let count = Int(5)
        
        let parties = [
            "Wife", "Team Manager", "Daughter", "MC 418 Clue", "Son", "Puppy",
            "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
            "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
            "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
            "Party Y", "Party Z"
        ]
        
        var yVals1 = [ChartDataEntry]()
        
        // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
        for i in 0 ..< count
        {
            let chartDataEntry = BarChartDataEntry(value: Double((arc4random_uniform(mult) + mult/5)), xIndex: i)
            yVals1.append(chartDataEntry)
        }
        
        //let xVals = NSMutableArray()
        var xVals = [String?]()
        
        for i in 0 ..< count
        {
            //xVals.addObject(parties[i % parties.count])
            xVals.append(parties[i % parties.count])
            //[xVals addObject:parties[i % parties.count]];
        }
        
        print (xVals)

        let dataSet = PieChartDataSet(yVals: yVals1, label: "")
        dataSet.sliceSpace = 2.0
        
        // add a lot of colors

        
        dataSet.colors = ChartColorTemplates.vordiplom()
        dataSet.drawValuesEnabled = true
        dataSet.sliceSpace = 5.0
        
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.4

        
        //let data = PieChartData(xVals: xVals, dataSet: dataSet)
        let data = PieChartData(xVals: xVals, dataSet: dataSet)
        

        let pFormatter = NSNumberFormatter()
        pFormatter.numberStyle = NSNumberFormatterStyle.PercentStyle
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = "%"
        data.setValueFormatter(pFormatter)
        data.setValueTextColor(UIColor.blackColor())
        
        
        
        pieChartView.data = data
        
        
    }

    private func setupPieChartView() {
        self.pieChartView.usePercentValuesEnabled = true
        self.pieChartView.drawSlicesUnderHoleEnabled = false
        self.pieChartView.holeRadiusPercent = 0.58;
        self.pieChartView.transparentCircleRadiusPercent = 0.61
        self.pieChartView.descriptionText = ""
        self.pieChartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        
        self.pieChartView.drawCenterTextEnabled = true
        
        //self.pieChartView.centerAttributedText = "차트의 설2명"
        self.pieChartView.drawHoleEnabled = true
        self.pieChartView.rotationAngle = 0
        self.pieChartView.rotationEnabled = true
        self.pieChartView.highlightPerTapEnabled = true
        
        print("setting")
        self.setPieChartData()
        
        
        
    }
    
}