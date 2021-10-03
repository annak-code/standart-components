//
//  Task3ViewController.swift
//  ShopModule8
//
//

import UIKit

class Task3ViewController: UIViewController {
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["one", "two", "three"])
        return sc
    }()
    let segmentView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = UIScreen.main.bounds
        segmentedControl.frame = CGRect(x: frame.minX + 10,
                                        y: frame.minY + 50,
                                        width: frame.width - 20,
                                        height: frame.height*0.1)
        segmentedControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        self.view.addSubview(segmentedControl)
        selectedValue(sender: segmentedControl)
        
        self.segmentView.frame = CGRect(x: segmentedControl.frame.minX,
                                        y: segmentedControl.frame.maxY + 10,
                                        width: segmentedControl.frame.width,
                                        height: (tabBarController!.tabBar.frame.minY) - segmentedControl.frame.maxY)
        self.view.addSubview(segmentView)
        
    }
    
    @objc func selectedValue(sender: UISegmentedControl) {
          switch sender.selectedSegmentIndex {
          case 0:
              self.view.backgroundColor = .gray
            
            for view in self.segmentView.subviews {
                view.removeFromSuperview()
            }
            
            self.segmentView.backgroundColor = .green
            let textField1 = UITextField()
            let textField2 = UITextField()
            textField1.frame = CGRect(x: 5, y: 5, width: segmentView.frame.width - 10, height: 20)
            textField1.text = "text1"
            textField2.frame = CGRect(x: 5, y: 100, width: segmentView.frame.width - 10, height: 20)
            textField2.text = "text2"
            self.segmentView.addSubview(textField1)
            self.segmentView.addSubview(textField2)
          case 1:
              self.view.backgroundColor = .systemPink
            
            for view in self.segmentView.subviews {
                view.removeFromSuperview()
            }
            
            self.segmentView.backgroundColor = .blue
            let button1 = UIButton()
            let button2 = UIButton()
            button1.frame = CGRect(x: 5, y: 5, width: segmentView.frame.width - 10, height: 20)
            button2.frame = CGRect(x: 5, y: 100, width: segmentView.frame.width - 10, height: 20)
            button1.backgroundColor = .systemPink
            button2.backgroundColor = .systemPink
            button1.setTitle("button1", for: .normal)
            button2.setTitle("button2", for: .normal)
            self.segmentView.addSubview(button1)
            self.segmentView.addSubview(button2)
          case 2:
              self.view.backgroundColor = .systemIndigo
            
            for view in self.segmentView.subviews {
                view.removeFromSuperview()
            }
            
            self.segmentView.backgroundColor = .purple
            let imageView1 = UIImageView()
            let imageView2 = UIImageView()
            imageView1.frame = CGRect(x: 10, y: 10,
                                      width: self.segmentView.frame.width / 2 - 15,
                                      height: (self.segmentView.frame.width / 2 - 10) * 1.5)
            //почему высоту нельзя задать imageView1.frame.width * 1.5
            imageView2.frame = CGRect(x: imageView1.frame.maxX + 10, y: 10,
                                      width: self.segmentView.frame.width / 2 - 15,
                                      height: (self.segmentView.frame.width / 2 - 10) * 1.5)
            imageView1.image = UIImage(named: "Bikini.jpg")
            imageView2.image = UIImage(named: "T-Shirt Dress.jpg")
            self.segmentView.addSubview(imageView1)
            self.segmentView.addSubview(imageView2)
            
            
          default:
            self.view.backgroundColor = .none
          }
    }
}
