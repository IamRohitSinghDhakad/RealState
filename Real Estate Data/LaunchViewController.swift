//
//  LaunchViewController.swift
//  Real Estate Data
//
//  Created by Rohit Singh Dhakad on 20/02/22.
//

import UIKit

class LaunchViewController: UIViewController {

    var counter = 2
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    

    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds to the end of the world")
            counter -= 1
        }else{
            self.timer?.invalidate()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}
