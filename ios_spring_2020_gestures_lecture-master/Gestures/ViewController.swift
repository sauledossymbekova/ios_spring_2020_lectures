//
//  ViewController.swift
//  Gestures
//
//  Created by erumaru on 2/22/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        someView.addGestureRecognizer(tapGestureRecognizer)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(recognizer:)))
        someView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func didTap() {
        someView.backgroundColor = .random
    }
    
    var baseOrigin: CGPoint!
    @objc func didPan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            baseOrigin = someView.frame.origin
        case .changed:
            let d = recognizer.translation(in: someView)
            someView.frame.origin.x = baseOrigin.x + d.x
            someView.frame.origin.y = baseOrigin.y + d.y
        default: break
        }
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
