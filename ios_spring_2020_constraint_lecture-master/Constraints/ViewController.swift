//
//  ViewController.swift
//  Constraints
//
//  Created by erumaru on 2/15/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let someString = "sdfsd#@DW"
        print(someString.url)
        
        let view = UIView()
        view.backgroundColor = .mainColor
    }
}

extension String {
    var url: URL? {
        return URL(string: self)
    }
}

extension UIColor {
    static var mainColor: UIColor {
        return .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    }
}
