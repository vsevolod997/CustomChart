//
//  DateFile.swift
//  CustomChart
//
//  Created by Всеволод Андрющенко on 09/08/2019.
//  Copyright © 2019 Всеволод Андрющенко. All rights reserved.
//

import Foundation

class CustomChartDate{
    private var date: [Int] = []
    // MARK : - создание очереди
    private let queue = DispatchQueue(label: "CustomQueue", qos: .userInitiated, attributes: .concurrent)
    //MARK : - добавление элемента
    public func appendNewElement(_ element: Int){
        queue.async(flags: .barrier) {
            self.date.append(element)
        }
    }
    //MARK : - удаление всех элементов
    public func deletAllElement(){
        queue.async(flags: .barrier) {
            self.date = []
        }
    }
    // MARK : - все элементы в массиве
    public var valueArray: [Int]{
        var result: [Int] = []
        queue.sync {
            result = date
        }
        return result
    }
}
