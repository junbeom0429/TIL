//
//  ViewController.swift
//  kakao
//
//  Created by JB on 2021/04/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}

class tap5: UIViewController {
    
    @IBOutlet weak var payView: UIView!
    
    @IBOutlet weak var itemBorder: UIView!
    
    
    @IBOutlet weak var adView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        payView.layer.cornerRadius = 15
        payView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        itemBorder.layer.borderWidth = 1
        itemBorder.layer.borderColor = UIColor.darkGray.cgColor
        itemBorder.layer.cornerRadius = 15
        itemBorder.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        adView.layer.cornerRadius = 10
        
        
    }
}
