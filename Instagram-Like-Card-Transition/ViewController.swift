//
//  ViewController.swift
//  Instagram-Like-Card-Transition
//
//  Created by David on 2021/5/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func presentationButtonClicked(_ sender: Any) {
        let instagramCard = InstagramCardViewController()
        present(instagramCard, animated: true, completion: nil)
    }

}

