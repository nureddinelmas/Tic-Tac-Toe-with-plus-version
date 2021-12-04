//
//  TableOfNumber.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-04.
//

import Foundation
import UIKit

class Board {
    var boardList : [Int] = [0,0,0,0,0,0,0,0,0]
}

class Images {
    var xImage : UIImage?
    var oImage : UIImage?
    var defImage : UIImage?
    
    init(xImage : UIImage,oImage : UIImage,defImage : UIImage ){
        self.xImage = xImage
        self.oImage = oImage
        self.defImage = defImage
    }
    
}

