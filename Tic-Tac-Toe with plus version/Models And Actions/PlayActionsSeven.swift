//
//  PlayActionsSeven.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-08.
//

import Foundation
import Foundation
import UIKit

class PlayActionsSeven: Functions {
    var image = Images()
    var gamePlan = GamePlan()
    var play1Activ = true
    

    var tableList : [Int] = []


    var posibility = [[0,1,2,3,4,5,6],[7,8,9,10,11,12,13],[14,15,16,17,18,19,20],[21,22,23,24,25,26,27],[28,29,30,31,32,33,34],[35,36,37,38,39,40,41],[42,43,44,45,46,47,48],[0,7,14,21,28,35,42],[1,8,15,22,29,36,43],[2,9,16,23,30,37,44],[3,10,17,24,31,38,45],[4,11,18,25,32,39,46],[6,13,20,27,34,41,48],[0,8,16,24,32,40,48],[6,12,18,24,30,36,42]]
    

    
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
            if tableList[i[0]] != 0 && tableList[i[0]] == tableList[i[1]] && tableList[i[1]] == tableList[i[2]] && tableList[i[2]] == tableList[i[3]] && tableList[i[3]] == tableList[i[4]] && tableList[i[4]] == tableList[i[5]] && tableList[i[5]] == tableList[i[6]]{
                if tableList[i[0]] == 1 {
                    return 1
                }else{
                    return 2
                }
            }
        }
        return 0
    }

    func reloadPlay(){
     
//        fillTable()
        gamePlan.positionsCell = []
    }
    
    func fillTable(size: Int){
        tableList.removeAll()
        for _ in 0...(size*size-1) {
            tableList.append(0)
        }
    }
}
