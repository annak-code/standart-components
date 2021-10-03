//
//  DataClass.swift
//  ShopModule8
//
//

import Foundation

class Data {
    
    static let shared = Data()
    
    private var picturesArr = [(name: String, price: Int, promoprice: Int)]()
    
    private func setPicturesArr() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        var price = 1000
        var promoprice = 1800
        
        for item in items {
            if price <= promoprice {
                promoprice = price
                print("for \(item) price is <= promoprice. please check values")
            }
            if item.hasSuffix(".jpg") {
                Data.shared.picturesArr.append((item, price, promoprice))
                price += 100
                promoprice += 20
            }
        }
    }
    func getPicturesArr() -> [(name: String, price: Int, promoprice: Int)] {
        if Data.shared.picturesArr.isEmpty {
            Data.shared.setPicturesArr()
        }
        return Data.shared.picturesArr
    }
    
    private init(){}
}
