//
//  ViewController.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-04.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    var player1 = Player()
    var player2 = Player()
    var playActionThree = PlayActionsThree()
    var playActionFive = PlayActionsFive()
    var playActionSeven = PlayActionsSeven()
    var image = Images()
    var gamePlan = GamePlan()
    
    // Variables
    private let reuseIdentifier = "reuseIdentifier"
    var gameSituation = true
    var player1Activ = true
    var firstScore = 0
    var secondScore = 0
    var valueFromModel = 0
    var selectedTurn = true
    
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var secondPlayerText: UILabel!
    @IBOutlet weak var playCollectionView: UICollectionView!
    @IBOutlet weak var firstPlayerText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playActionThree.fillTable(size: gamePlan.playSize)
        playActionFive.fillTable(size: gamePlan.playSize)
        playActionSeven.fillTable(size: gamePlan.playSize)
        
        firstPlayerText.text = "\(player1.name.uppercased()) : \(firstScore)"
        secondPlayerText.text = "\(player2.name.uppercased()) : \(secondScore)"
        
        let flowlayout = UICollectionViewFlowLayout()

        flowlayout.scrollDirection = .vertical
        flowlayout.minimumLineSpacing = 1
        flowlayout.minimumInteritemSpacing = 1
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowlayout.itemSize = CGSize(width: (view.frame.size.width/gamePlan.rate), height: (view.frame.size.width/gamePlan.rate))

        playCollectionView.collectionViewLayout = flowlayout
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gamePlan.playSize * gamePlan.playSize
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Int(collectionView.bounds.width)-5) / gamePlan.playSize, height: (Int(collectionView.bounds.size.height)-5) / gamePlan.playSize)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PlayCollectionViewCell
        
        cell.imageViewCell.image = image.defImage
        
        return cell
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = playCollectionView.cellForItem(at: indexPath) as! PlayCollectionViewCell
        
        

        
        if cell.imageViewCell.image == image.defImage {
            
            if selectedTurn {
                self.showLabel.text = "\(player1.name) is playing now"
                selectedTurn = false
            }else{
                self.showLabel.text = "\(player2.name) is playing now"
                selectedTurn = true
            }
            
            switch gamePlan.playSize{
            case 3: self.playActionThree.enterValue(index: indexPath.row, imageFromModel: cell.imageViewCell)
                valueFromModel = self.playActionThree.compare()
            case 5: self.playActionFive.enterValue(index: indexPath.row, imageFromModel: cell.imageViewCell)
                valueFromModel = self.playActionFive.compare()
            case 7: self.playActionSeven.enterValue(index: indexPath.row, imageFromModel: cell.imageViewCell)
                valueFromModel = self.playActionSeven.compare()
            default: self.playActionThree.enterValue(index: indexPath.row, imageFromModel: cell.imageViewCell)
                valueFromModel = self.playActionThree.compare()
            }
            print(valueFromModel)
            if valueFromModel == 1 {
                firstScore += 1
                gameSituation = false
                firstPlayerText.text = "\(player1.name.uppercased()) : \(firstScore)"
                makeAlert(message: "\(self.player1.name.uppercased()) Won!!")
                
            }
            if valueFromModel == 2 {
                secondScore += 1
                gameSituation = false
                secondPlayerText.text = "\(player2.name.uppercased()) : \(secondScore)"
                makeAlert(message: "\(player2.name.uppercased()) Won!!")

            }
         
            gamePlan.positionsCell.append(indexPath.row)
            // burayi duzelt
            print("gamePlan.positionsCell.count -> \(gamePlan.positionsCell.count)")
            print("Int(gamePlan.playSize)*Int(gamePlan.playSize) -> \(Int(gamePlan.playSize)*Int(gamePlan.playSize))")
            if gamePlan.positionsCell.count == (Int(gamePlan.playSize)*Int(gamePlan.playSize)){
                if !player1.playerWin && !player2.playerWin {
                    makeAlert(message: "It is a Draw")
                }
            }
          
        }
    }
    
    
    func makeAlert (message: String) {
        
        let alert = UIAlertController(title: "😃 Game Over 😃", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { result in
            self.gamePlan.positionsCell = []
            self.playCollectionView.reloadData()
            self.player1.reloadPlayer()
            self.player2.reloadPlayer()
            self.valueFromModel = 0
            self.playActionFive.fillTable(size: self.gamePlan.playSize)
            self.playActionThree.fillTable(size: self.gamePlan.playSize)
            self.playActionSeven.fillTable(size: self.gamePlan.playSize)
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}

