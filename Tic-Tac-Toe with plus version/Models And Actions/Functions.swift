//
//  Functions.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-07.
//

import Foundation
import UIKit

protocol Functions {
    func enterValue(index : Int, imageFromModel : UIImageView)
    func compare() -> Int
    func fillTable()
}


