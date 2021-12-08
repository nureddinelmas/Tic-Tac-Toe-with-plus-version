//
//  PlayIntroViewController.swift
//  Tic-Tac-Toe with plus version
//
//  Created by Nureddin Elmas on 2021-12-08.
//

import UIKit

class PlayIntroViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    
    
    
    let introToPlay = "introToPlay"
    @IBOutlet weak var firstPlayerText: UITextField!
    
    @IBOutlet weak var pickerViewRow: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondPlayerText: UITextField!
    var selectedSize = 0
    private let size = ["3 x 3","5 x 5","7 x 7"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return size.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch size[row] {
        case "3 x 3" : selectedSize = 3
            imageView.image = UIImage(named: "3x3")
        case "5 x 5" : selectedSize = 5
            imageView.image = UIImage(named: "5x5")
        case "7 x 7" : selectedSize = 7
            imageView.image = UIImage(named: "7x7")
        default: selectedSize = 3
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return size[row]
    }
    
    @IBAction func playNowButton(_ sender: UIButton) {
        if firstPlayerText.text != "" || secondPlayerText.text != "" {
            performSegue(withIdentifier: introToPlay, sender: nil)

        }else{
            makeAlert(title: "Error", message: "Fill in all blank")
        }
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let firstPlayer = firstPlayerText.text, let secondPlayer = secondPlayerText.text else { return }
        if segue.identifier == introToPlay {
            let destinationVC = segue.destination as! ViewController
            destinationVC.gamePlan.playSize = 4
            destinationVC.player1.name = firstPlayer
            destinationVC.player2.name = secondPlayer
        }
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okbutton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okbutton)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
