//
//  ViewController.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-04.
//

import UIKit

let reuseIdentifier = "reuseIdentifier"
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var gameSituation = true
    var player1Activ = true
    var board = Board()
    var playAction = PlayActions()
    var image = Images(xImage: UIImage(named: "x")!, oImage: UIImage(named: "o")!, defImage: UIImage(named: "kvadrat")!)
    

    @IBOutlet weak var playCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  playAction.tableCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PlayCollectionViewCell
        
        cell.imageViewCell.image = image.defImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = playCollectionView.cellForItem(at: indexPath) as! PlayCollectionViewCell
        if cell.imageViewCell.image == image.defImage {
            
            playAction.enterValue(index: indexPath.row, imageFromModel: cell.imageViewCell)
            
           let valueFromModel = playAction.compare()
            
            if valueFromModel == 1 {
                gameSituation = false
                print("1 kazandi")
                makeAlert(title: "Bravo", message: "Player 1 kazandi")
                cell.imageViewCell.image = image.defImage
            }
            if valueFromModel == 2 {
                gameSituation = false
                print("2 kazandi")
                makeAlert(title: "Bravo", message: "Player 2 kazandi")
                cell.imageViewCell.image = image.defImage
            }
            
        }
      
        
    }
    
    
    func makeAlert (title : String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { result in
            self.playAction.reloadPlay()
            self.playCollectionView.reloadData()
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }



}

