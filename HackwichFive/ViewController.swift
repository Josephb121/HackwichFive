//
//  ViewController.swift
//  HackwichFive
//
//  Created by CM Student on 3/7/19.
//  Copyright © 2019 Joseph Blancaflor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var targetLabel: UILabel!

   @IBOutlet weak var slider: UISlider!
    var currentValue: Int = 0
    var targetValue: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
    }

    @IBAction func sliderHasMoved(_ sender: Any) {
        print("The value of the slider is:\(slider.value)")
        currentValue = lroundf(slider.value)
    }
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateTargetLabel()
        
        
    }
    
    
    @IBAction func myGuessButtonPressed(_ sender: Any) {
        let message = "The value is \(currentValue)" + "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title:"Hello World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    func updateTargetLabel(){
        targetLabel.text = String(targetValue)
        
    }
    
}

