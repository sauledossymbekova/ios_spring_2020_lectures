//
//  ViewController.swift
//  MultipleMVC
//
//  Created by erumaru on 2/29/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .random
        navigationItem.title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeSelf))
    }
    
    @objc func closeSelf() {
        self.dismiss(animated: true)
    }

    @IBAction func push(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "someid")
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func present(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "someid")
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        
        self.present(navVC, animated: true) {
            
        }
        
        // no reuse
        // double present
        // completion
    }
}

extension UIColor {
    static var random: UIColor {
        return .init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
}
