//
//  SceneDelegate.swift
//  IntroScreen
//
//  Created by Arpit iOS Dev. on 09/05/24.
//


import UIKit

class OnboardingCollectionCell: UICollectionViewCell {
    
    static let identifier = "onboardingCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func setupCell(_ item: OnboardingModel) {
        imageView.image = item.image
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
}
