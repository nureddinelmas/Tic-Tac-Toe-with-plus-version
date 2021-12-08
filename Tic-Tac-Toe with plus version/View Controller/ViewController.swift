//
//  ViewController.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-04.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    private let reuseIdentifier = "reuseIdentifier"
    var player1 = Player()
    var player2 = Player()

    var gameSituation = true
    var player1Activ = true
    var playActionThree = PlayActionsThree()
    var playActionFive = PlayActionsFive()
    var playActionSeven = PlayActionsSeven()
    var image = Images()
    var gamePlan = GamePlan(playSize: 5, rate: 4, positionsCell: [])

    var valueFromModel = 0
    @IBOutlet weak var playCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamePlan.playSize = 3
        playActionThree.fillTable(size: gamePlan.playSize)
        playActionFive.fillTable(size: gamePlan.playSize)
        playActionSeven.fillTable(size: gamePlan.playSize)

        
        if player1.name == "" {
            player1.name = "First Player"
        }
        if player2.name == "" {
            player2.name = "Second Player"
        }
        
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
        return CGSize(width: (Int(collectionView.bounds.width) - 5) / gamePlan.playSize, height: (Int(collectionView.bounds.size.height) - 5) / gamePlan.playSize)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PlayCollectionViewCell
        
        cell.imageViewCell.image = image.defImage
        
        return cell
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = playCollectionView.cellForItem(at: indexPath) as! PlayCollectionViewCell
        
        if cell.imageViewCell.image == image.defImage {
            
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
            if valueFromModel == 1 {
                gameSituation = false
                makeAlert(message: "\(player1.name) Won!!")
                cell.imageViewCell.image = image.defImage
            }
            if valueFromModel == 2 {
                gameSituation = false
                makeAlert(message: "\(player2.name) Won!!")
                cell.imageViewCell.image = image.defImage

            }
         
            gamePlan.positionsCell.append(indexPath.row)
            
            if gamePlan.positionsCell.count == Int(gamePlan.playSize)*Int(gamePlan.playSize){
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

