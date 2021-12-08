//
//  PlayActions5.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-07.
//


import Foundation
import UIKit

class PlayActionsFive: Functions {

    
    var image = Images()
    var gamePlan : GamePlan?
    var play1Activ = true
    var tableList : [Int] = []
    
    var posibility = [[0,1,2,3,4],[5,6,7,8,9],[10,11,12,13,14],[15,16,17,18,19],[20,21,22,23,24],[0,5,10,15,20],[1,6,11,16,21],[2,7,12,17,22],[3,8,13,18,23],[4,9,14,19,24],[0,6,12,18,24],[4,8,12,16,20]]
    

    
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
            if tableList[i[0]] != 0 && tableList[i[0]] == tableList[i[1]] && tableList[i[1]] == tableList[i[2]] && tableList[i[2]] == tableList[i[3]] && tableList[i[3]] == tableList[i[4]]{
                if tableList[i[0]] == 1 {
                    return 1
                }else{
                    return 2
                }
            }
        }
        return 0
    }

    
    func fillTable(size : Int) {
        tableList.removeAll()
        for _ in 0...(size*size-1) {
            tableList.append(0)
        }
    }
}

