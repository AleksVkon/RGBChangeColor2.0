//
//  ColorViewController.swift
//  RGBChangeColor
//
//  Created by Aleksey Konchyts on 20.02.24.
//

import UIKit

protocol SliderViewControllerDelegate: AnyObject {
    func transferColor(color: UIColor)
}

final class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sliderVC = segue.destination as? SliderViewController
        sliderVC?.currentColor = view.backgroundColor!
        sliderVC?.delegate = self
    }
}

// MARK: - SliderViewControllerDelegate

extension ColorViewController: SliderViewControllerDelegate {
    func transferColor(color: UIColor) {
            view.backgroundColor = color
    }
}
