//
//  Player.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-05.
//

import Foundation
import UIKit

struct Player {
    var name : String = ""
    var aktiv : Bool = false
    var playerWin : Bool = false
    var numberOfWin : Int = 0
    
    
    mutating func reloadPlayer(){
        playerWin = false
    }
}





