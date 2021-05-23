//
//  InstagramLikeCardAnimationController.swift
//  Instagram-Like-Card-Transition
//
//  Created by David on 2021/5/23.
//

import UIKit

final class InstagramLikeCardAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    enum TransitionType {
        case presentation, dismissal
    }

    private let transitionType: TransitionType

    init(type: TransitionType) {
        self.transitionType = type
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView

        guard
            let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to)
        else { return }

        // Initial state
        switch transitionType {
        case .presentation:
            containerView.addSubview(toVC.view)
            toVC.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                toVC.view.heightAnchor.constraint(equalToConstant: 280),
                toVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                toVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                toVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])

            toVC.view.layoutSubviews()
            let moveDown = CGAffineTransform(translationX: 0, y: toVC.view.bounds.height)
            toVC.view.transform = moveDown

        case .dismissal:
            break
        }

        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: .curveEaseOut,
            animations: {
                switch self.transitionType {
                case .presentation:
                    toVC.view.transform = .identity
                case .dismissal:
                    fromVC.view.transform = CGAffineTransform(translationX: 0, y: fromVC.view.bounds.height)
                }
            },
            completion: { done in
                let isCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!isCancelled)
            }
        )
    }
}
