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

    let transition = InstagramLikeCardTransitionDelegate()

    @IBAction func presentationButtonClicked(_ sender: Any) {
        let instagramCard = InstagramCardViewController()
        instagramCard.modalPresentationStyle = .custom
        instagramCard.transitioningDelegate = transition
        present(instagramCard, animated: true, completion: nil)
    }

}

