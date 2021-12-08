//
//  PlayActions.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-05.
//

import Foundation
import UIKit

class PlayActionsThree: Functions {

    
    var image = Images()
    var gamePlan = GamePlan()
    var play1Activ = true
    var tableList : [Int] = []


    var posibility = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    
    
    var tableCount : Int {
        return tableList.count
    }

    func enterValue(index : Int, imageFromModel : UIImageView) {
                   
                 if play1Activ {
                     tableList[index] = 1
                     play1Activ = false
                     imageFromModel.image = image.oImage
                 }else {
                     tableList[index] = 2
                     play1Activ = true
                     imageFromModel.image = image.xImage
                 }
        
      }
    
    func compare() -> Int{
        for i in posibility {
            if tableList[i[0]] != 0 && tableList[i[0]] == tableList[i[1]] && tableList[i[1]] == tableList[i[2]] {
                if tableList[i[0]] == 1 {
                    return 1
                }else{
                    return 2
                }
            }
        }
        return 0
    }

//    func reloadPlay(){
//        fillTable()
//    }
    
    func fillTable(size: Int) {
        tableList.removeAll()
        for _ in 0...(size*size-1) {
            tableList.append(0)
        }
    }
}
