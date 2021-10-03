//
//  Task1ViewController.swift
//  ShopModule8
//
//

import UIKit

class Task1ViewController: UIViewController {
    
    var image = UIImage(named: "Bikini.jpg")
    var pictures = [String]()
    var index = 0
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func previous(_ sender: UIButton) {
        nextButton.isEnabled = true
        if index > 0 {
            index -= 1
            image = UIImage(named: "\(pictures[index])")
        }
        if index == 0 {
            previousButton.isEnabled = false
        }
        imageView.image = image
    }
    @IBAction func next(_ sender: UIButton) {
        previousButton.isEnabled = true
        if index < pictures.count - 1 {
            index += 1
            image = UIImage(named: "\(pictures[index])")
        }
        if index == pictures.count - 1 {
            nextButton.isEnabled = false
        }
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pictures = Data.shared.getPicturesArr().map({$0.0})
        image = UIImage(named: "\(pictures[index])")
        imageView.image = image
        
        if index == 0 {
            previousButton.isEnabled = false
        }
        if index == pictures.count - 1 {
            nextButton.isEnabled = false
        }
        nextButton.setTitleColor(UIColor.gray, for: UIControl.State.disabled)
        previousButton.setTitleColor(UIColor.gray, for: UIControl.State.disabled)
    }
}

