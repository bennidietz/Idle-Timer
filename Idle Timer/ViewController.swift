//
//  ViewController.swift
//  Idle Timer
//
//  Created by Benjamin Dietz on 10.02.21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainTreeImageView: UIImageView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var actionButton: UIButton!
    var timer: Timer?
    
    var currentTree = 1
    var timePassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateTrees() {
        currentTree += 1
        if let image = UIImage(named: "Tree\(currentTree)") {
            widthConstraint.constant += widthConstraint.constant * 0.5
            mainTreeImageView.image = image
        } else if let image = UIImage(named: "Tree1") {
            widthConstraint.constant = 100
            mainTreeImageView.image = image
            currentTree = 1
        }
    }
    
    @objc func updateTime() {
        timePassed += 1
        if timePassed % 2 == 0 {
            updateTrees()
        }
    }

    @IBAction func actionButtonHandler(_ sender: UIButton) {
        switch actionButton.titleLabel?.text {
        case "START":
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            actionButton.setTitle("STOP", for: .normal) // control state
        case "STOP":
            actionButton.setTitle("START", for: .normal)
            timer?.invalidate()
        default:
            break
        }
    }
    
}

