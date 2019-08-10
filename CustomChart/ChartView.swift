//
//  Chart.swift
//  CustomChart
//
//  Created by Всеволод Андрющенко on 10/08/2019.
//  Copyright © 2019 Всеволод Андрющенко. All rights reserved.
//

import UIKit

class ChartView: UIView{
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView(){
        backgroundColor = .white
        layer.cornerRadius = 15
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 7
        layer.shadowOpacity = 5
        
        let origin = self.bounds.origin
        let size = CGSize(width: self.bounds.width, height: 200)
        gradientLayer.frame = CGRect(origin: origin, size: size)
        gradientLayer.cornerRadius = 15
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.colors = [UIColor.green.cgColor, UIColor.clear.cgColor]
        gradientLayer.opacity = 0.2
        layer.addSublayer(gradientLayer)
    }
    
    // MARK : - создание кастомных столбцов
    public func setColumn(columnMass: [Int]){
        
        clearColumn()
        
        let heigth = self.frame.height
        let width = self.frame.width
        let columnCount = columnMass.count
        // Адаптивная ширина
        let widthColumn = (width - 20)/CGFloat(columnCount) - 3.0
        
        var startPointX = CGFloat(10.0)
        //Адаптивная стартовая точка по высоте
        let startPointY = CGFloat(heigth - 20)
        
        let maxHeigthColumn = heigth - 40
        guard let maxNumInMass = columnMass.max() else {return}
        for date in columnMass {
            let columnView = UIView()
            let coefHeigthColumn = Double(date)/Double(maxNumInMass)
            let heigthColumn = coefHeigthColumn * Double(maxHeigthColumn)
            columnView.frame = CGRect(x: startPointX, y: startPointY, width: widthColumn, height: CGFloat(-heigthColumn))
            columnView.backgroundColor = UIColor.red
            columnView.layer.cornerRadius = 3
            
            addSubview(columnView)
            
            startPointX += widthColumn + 3.0
        }
    }
    
    public func clearColumn(){
        for view in subviews{
            view.removeFromSuperview()
        }
    }
    
}
