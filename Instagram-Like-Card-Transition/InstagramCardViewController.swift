//
//  InstagramCardViewController.swift
//  Instagram-Like-Card-Transition
//
//  Created by David on 2021/5/23.
//

import UIKit

class InstagramCardViewController: UIViewController {

    private let topScrollIndicatorBar = UIView()
    private let titleLabel = UILabel()
    private let seperatorLine = UIView()
    private let dismissButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 20

        view.addSubview(topScrollIndicatorBar)
        topScrollIndicatorBar.translatesAutoresizingMaskIntoConstraints = false
        topScrollIndicatorBar.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        topScrollIndicatorBar.layer.cornerRadius = 2.5

        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Save to"
        titleLabel.textAlignment = .center

        view.addSubview(seperatorLine)
        seperatorLine.translatesAutoresizingMaskIntoConstraints = false
        seperatorLine.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)

        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonClicked), for: .touchUpInside)

        NSLayoutConstraint.activate([
            topScrollIndicatorBar.widthAnchor.constraint(equalToConstant: 48),
            topScrollIndicatorBar.heightAnchor.constraint(equalToConstant: 5),
            topScrollIndicatorBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topScrollIndicatorBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),

            titleLabel.topAnchor.constraint(equalTo: topScrollIndicatorBar.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            seperatorLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            seperatorLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            seperatorLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            seperatorLine.heightAnchor.constraint(equalToConstant: 0.5),

            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.topAnchor.constraint(equalTo: seperatorLine.bottomAnchor, constant: 40)
        ])
    }

    private func setupUI() {

    }

    @objc private func dismissButtonClicked() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
