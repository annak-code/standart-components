//
//  Task2ViewController.swift
//  ShopModule8
//
//

import UIKit

class Task2ViewController: UIViewController {
    
    var dataArray = [(name: String, price: Int, promoprice: Int)]()

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        dataArray = Data.shared.getPicturesArr()
        
        let screenWidth = CGFloat(self.view.frame.size.width)
        let viewWidth = screenWidth * 0.91 / 2
        let viewHeigh = viewWidth * 2
        
        let imageHeigh = viewWidth * 1.5
        let spacing = screenWidth * 0.03
        let priceHeight = viewWidth * 0.1
        let nameHeight = viewWidth * 0.2
        let discountHeight = viewWidth * 0.2
        let spacingInView = viewWidth * 0.05
        
        var viewCoordinateX: CGFloat = spacing
        var viewCoordinateY: CGFloat = spacing
        
        for i in 0..<dataArray.count {
            // четные в первой колонке, нечетные - во второй
            if i % 2 != 0 {
                viewCoordinateX += viewWidth + spacing
            } else {
                viewCoordinateY += viewHeigh + spacing
                viewCoordinateX = spacing
            }
            //чтоб первые позиции не съехали
            if i == 0 {
                viewCoordinateY = spacing
            }
            
            // для каждой группы отдельная вьюшка
            let view = UIView()
            view.frame = CGRect(x: viewCoordinateX, y: viewCoordinateY, width: viewWidth, height: viewHeigh)
            scrollView.addSubview(view)
            print(view)
            
            let imageview = UIImageView()
            imageview.frame = CGRect(x: 0, y: 0, width: viewWidth, height: imageHeigh)
            imageview.image = UIImage(named: "\(dataArray[i].name)")
            view.addSubview(imageview)
            
            let promopriceLabel = UILabel()
            promopriceLabel.frame = CGRect(x: 0, y: imageHeigh + spacingInView + priceHeight, width: viewWidth - discountHeight, height: priceHeight)
            promopriceLabel.text = "\(dataArray[i].promoprice) RUB"
            if dataArray[i].promoprice >=  dataArray[i].price {
                promopriceLabel.textColor = UIColor.black
            } else {
                promopriceLabel.textColor = UIColor.red
            }
            view.addSubview(promopriceLabel)
            
            let nameLabel = UILabel()
            nameLabel.frame = CGRect(x: 0, y: imageHeigh + priceHeight*2 + spacingInView, width: viewWidth, height: nameHeight)
            let nameText = dataArray[i].name
            if let index = nameText.range(of: ".")?.lowerBound {
                nameLabel.text = String(nameText[..<index])
            }
            nameLabel.textColor = UIColor.gray
            view.addSubview(nameLabel)
            
            //если акц цена не ниже текущей, то доп лейблы не создаются
            if dataArray[i].promoprice <  dataArray[i].price {
                let priceLabel = UILabel()
                priceLabel.frame = CGRect(x: 0, y: imageHeigh + spacingInView, width: viewWidth - discountHeight, height: priceHeight)
                priceLabel.text = "\(dataArray[i].price) RUB"
                // чтоб перечеркнуть текст
                let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(priceLabel.text!)")
                    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
                priceLabel.attributedText = attributeString
                priceLabel.font = UIFont(name: priceLabel.font.fontName, size: 15)
                view.addSubview(priceLabel)
                
                let discountLabel = UILabel()
                discountLabel.frame = CGRect(x: viewWidth - discountHeight, y: imageHeigh + spacingInView, width: discountHeight, height: discountHeight)
                discountLabel.text = "-\(Int(100 - dataArray[i].promoprice * 100 / (dataArray[i].price)))%"
                discountLabel.backgroundColor = UIColor.red
                discountLabel.textColor = UIColor.white
                discountLabel.font = UIFont(name: discountLabel.font.fontName, size: 15)
                discountLabel.layer.masksToBounds = true
                discountLabel.layer.cornerRadius = 5
                discountLabel.textAlignment = .center
                view.addSubview(discountLabel)
                }
            print(imageview)
            }
        }
    // нужно запомнить, пока не очень понятно
    override func viewWillLayoutSubviews(){
    super.viewWillLayoutSubviews()
        let contentRect: CGRect = scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }
}
