//
//  InstagramLikeCardPresentationController.swift
//  Instagram-Like-Card-Transition
//
//  Created by David on 2021/5/23.
//

import UIKit

final class InstagramLikeCardPresentationController: UIPresentationController {
    let dimmingView = UIView()

    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }

        containerView.addSubview(dimmingView)
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dimmingView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            dimmingView.topAnchor.constraint(equalTo: containerView.topAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])

        dimmingView.alpha = 0
        dimmingView.backgroundColor = .black.withAlphaComponent(0.5)

        presentedViewController.transitionCoordinator?.animate(
            alongsideTransition: { context in
                self.dimmingView.alpha = 1
            },
            completion: nil
        )
    }

    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(
            alongsideTransition: { context in
                self.dimmingView.alpha = 0
            },
            completion: nil
        )
    }
}
