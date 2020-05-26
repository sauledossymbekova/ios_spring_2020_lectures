//
//  ViewController.swift
//  Animation
//
//  Created by erumaru on 2/29/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIView.animate(withDuration: 5) {
            self.customView.frame.origin = CGPoint(x: 0, y: 0)
            self.customView.backgroundColor = .red
        }
    }
}

