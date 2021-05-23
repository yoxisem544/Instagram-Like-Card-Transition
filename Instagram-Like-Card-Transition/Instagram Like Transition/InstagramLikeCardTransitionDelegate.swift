//
//  InstagramLikeCardTransitionDelegate.swift
//  Instagram-Like-Card-Transition
//
//  Created by David on 2021/5/22.
//

import UIKit

final class InstagramLikeCardTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        InstagramLikeCardAnimationController(type: .presentation)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        InstagramLikeCardAnimationController(type: .dismissal)
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        InstagramLikeCardPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
