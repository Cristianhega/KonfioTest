//
//  GlobalStrings.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 31/10/23.
//

import Foundation
import UIKit

struct Constants {
        
    static var baseUrl = "https://jsonblob.com/api/1151549092634943488"
    static var searchPets = "Buscar mascotas"
    static var dogsWeLove = "Dogs We Love"
    static var almost = "Almost "
    static var years = " years"
    static var year = " year"
    static var detailCell = "detailCell"
    static var darkGray = "#333333"
    static var mediumGray = "#666666"
    static var lightGray = "#F8F8F8"
    static var konfioPurple = "#8300D7"
    static var empty = ""
    static var get = "GET"
    static var dogs = "Dogs"
}

extension CGFloat {
    static var zero: CGFloat { return 0 }
    static var one: CGFloat { return 1 }
    static var two: CGFloat { return 2 }
    static var five: CGFloat { return 5 }
    static var ten: CGFloat { return 10 }
    static var fifteen: CGFloat { return 15 }
    static var seventeen: CGFloat { return 17 }
    static var twenty: CGFloat { return 20 }
    static var fifty: CGFloat { return 50 }
    static var oneHundred: CGFloat { return 100 }
    static var oneHundredTwenty: CGFloat { return 120 }
    static var oneHundredThirty: CGFloat { return 130 }
    static var twoHundred: CGFloat { return 200 }
    static var twoHundredTwenty: CGFloat { return 220 }
    static var twoHundredHalf: CGFloat { return 250 }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex.replacingOccurrences(of: "#", with: ""))
        var color: UInt64 = 0

        if scanner.scanHexInt64(&color) {
            self.init(red: CGFloat((color & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((color & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(color & 0x0000FF) / 255.0,
                      alpha: 1.0)
        } else {
            self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}
