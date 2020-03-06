//
//  ViewController.swift
//  HelloWorld
//
//  Created by mcda on 2020-02-29.
//  Copyright © 2020 mcda_arun. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    // MARK: - Properties
    
    var isCrossActive = true
    var gameState = [0,0,0,0,0,0,0,0,0]
    var theWins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6],[0,3,6]]
    var gameIsActive = true
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var PlayAgainButton: UIButton!
    @IBAction func PlayAgain(_ sender: UIButton) {
         gameState = [0,0,0,0,0,0,0,0,0]
        isCrossActive = true
        gameIsActive = true
        PlayAgainButton.isHidden = true
        Label.isHidden = true
        
        for i in 1...9{
            let buttton = view.viewWithTag(i) as! UIButton
            buttton.setImage(nil, for: .normal)
        }
        
    }
    
    // MARK: - IBActions
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        
        if(gameState[sender.tag - 1] == 0 && gameIsActive == true) {
            
            if isCrossActive {
                sender.setImage(UIImage(named: "cross"), for: .normal)
                isCrossActive = false
                gameState[sender.tag - 1] = 1
            }
            else {
                sender.setImage(UIImage(named: "circle"), for: .normal)
                isCrossActive = true
                gameState[sender.tag - 1] = 2
            }
        }
        for combination in theWins{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                if gameState[combination[0]] == 1{
                    print("cross has won")
                    Label.text = "Cross has won"
                    for i in combination{
                        let buttton = view.viewWithTag(i+1) as! UIButton
                        buttton.setImage(UIImage(named: "redCross"), for: .normal)
                    }
                    
                }
                if gameState[combination[0]] == 2 {
                    print("nought has won")
                    Label.text = "Nought has won"
                    for i in combination{
                        let buttton = view.viewWithTag(i+1) as! UIButton
                        buttton.setImage(UIImage(named: "redCircle"), for: .normal)
                    }
                }
                PlayAgainButton.isHidden = false
                Label.isHidden = false
            }
        }
        gameIsActive = false
        for i in gameState{
            if i == 0{
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false{
            Label.text = "Text is Draw"
            PlayAgainButton.isHidden = false
            Label.isHidden = false
        }
    }
}

