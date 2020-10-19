//
//  ViewController.swift
//  GuessNumber
//
//  Created by Mike Gu on 2020/5/11.
//  Copyright © 2020 Mr12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var maxNumber = 100
    var minNumber = 1
    var answer = Int.random(in: 1...100)
    var isOver = false
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func makeAGuess(_ sender: Any) {
        if isOver == false{
            print(answer)
            let inputText = inputTextField.text!
            inputTextField.text = ""
            let inputNumber  = Int(inputText)
            
            
            if inputNumber == nil{
                messageLabel.text = "請輸入正確數字 \(minNumber)~\(maxNumber)"
            }else{
                if inputNumber! > maxNumber{
                    messageLabel.text = "太超過啦~請輸入 \(minNumber)~\(maxNumber)"
                }else if inputNumber! < minNumber{
                    messageLabel.text = "太小了啦~請輸入 \(minNumber)~\(maxNumber)"
                }else{
                    if inputNumber == answer{
                        messageLabel.text = "太強啦 (按下Guess再玩一次) "
                        isOver = true
                    }else{
                        if inputNumber! > answer{
                            maxNumber = inputNumber!
                        }else{
                            minNumber = inputNumber!
                        }
                        messageLabel.text = "再試試~請輸入 \(minNumber)~\(maxNumber)"
                    }
                }
            }
        }else{
            minNumber = 1
            maxNumber = 100
            answer = Int.random(in: 1...100)
            messageLabel.text = "~猜數字~ \(minNumber)~\(maxNumber)"
            isOver = false
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
   
        
        
    }


}

