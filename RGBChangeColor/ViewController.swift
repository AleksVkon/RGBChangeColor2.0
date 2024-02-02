//
//  ViewController.swift
//  RGBChangeColor
//
//  Created by Aleksey Konchyts on 2.02.24.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var colorField: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorField.layer.cornerRadius = 10
    }

    @IBAction func redSliderAction() {
        redColorLabel.text = String(format: "%.2f", redColorSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        greenColorLabel.text = String(format: "%.2f", greenColorSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        blueColorLabel.text = String(format: "%.2f", blueColorSlider.value)
    }
    
    override func viewWillLayoutSubviews() {
        colorField.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1.0)
    }
}

