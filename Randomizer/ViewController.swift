//
//  ViewController.swift
//  Randomizer
//
//  Created by Ankit Aggarwal on 09/04/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

enum Direction: String {
    case Left
    case Right
}

protocol RandomDirection {
    func randomDirection() -> Direction
}

extension RandomDirection {
    func randomDirection() -> Direction {
        return rand() % 2 == 0 ? .Left : .Right
    }
}

class ViewController: UIViewController, RandomDirection {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapped))
        view.addGestureRecognizer(tap)
    }

    func tapped() {
        imageView.image = UIImage(named: randomDirection().rawValue)!
        
        UIView.animateWithDuration(0.5, animations: { 
            self.imageView.alpha = 1
        }) { _ in
            UIView.animateWithDuration(0.5) {
                self.imageView.alpha = 0
            }
        }
    }

}

