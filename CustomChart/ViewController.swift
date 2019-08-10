//
//  ViewController.swift
//  CustomChart
//
//  Created by Всеволод Андрющенко on 09/08/2019.
//  Copyright © 2019 Всеволод Андрющенко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let backgroundView = UIView()
    let gradientLayer = CAGradientLayer()
    var dateChart: [Int] = []

    var arrayDate = CustomChartDate()
    
    @IBOutlet weak var chartView: ChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateChartButton(_ sender: Any) {
        getDateChart()
        chartView.setColumn(columnMass: dateChart)
    }
    // MARK: - создание данных для граффиков
    private func getDateChart(){
        arrayDate.deletAllElement()
        DispatchQueue.concurrentPerform(iterations: 25) { (index) in
            let element = Int.random(in: 3..<100)
            arrayDate.appendNewElement(element)
        }
        dateChart = arrayDate.valueArray
    }
    
}

