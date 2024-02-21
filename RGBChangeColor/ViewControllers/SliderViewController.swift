//
//  ViewController.swift
//  RGBChangeColor
//
//  Created by Aleksey Konchyts on 2.02.24.
//

import UIKit

final class SliderViewController: UIViewController {

    @IBOutlet var colorFieldView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    var currentColor: UIColor = UIColor.green
    
    weak var delegate: SliderViewControllerDelegate? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorFieldView.layer.cornerRadius = 10
        colorFieldView.backgroundColor = currentColor
        
        colorFieldView.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
    }

    private func setColor() {
        colorFieldView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
        currentColor = colorFieldView.backgroundColor!
    }
    
    @IBAction func DoneButtonAction(_ sender: Any) {
        delegate?.transferColor(color: colorFieldView.backgroundColor!)
        dismiss(animated: true)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}

