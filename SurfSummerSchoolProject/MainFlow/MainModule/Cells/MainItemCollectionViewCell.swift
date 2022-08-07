//
//  MainItemCollectionViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/7/22.
//

import UIKit

class MainItemCollectionViewCell: UICollectionViewCell {

    // MARK: - Constants
    private enum Constants {
        static let fillHeartImage = UIImage(named: "hearth-full")
        static let heartImage = UIImage(named: "hearth-empty")
    }

    // MARK: - Views
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!

    // MARK: - Events
    var didFavoritesTapped: (() -> Void)?

    // MARK: - Calculated
    var buttonImage: UIImage? {
        return isFavorite ? Constants.fillHeartImage : Constants.heartImage
    }

    // MARK: - Properties
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    var isFavorite: Bool = false {
        didSet {
            favoriteButton.setImage(buttonImage, for: .normal)
        }
    }

    // MARK: - Actions
    @IBAction private func favotiteAction(_ sender: UIButton) {
        didFavoritesTapped?()
        isFavorite.toggle()
    }

    // MARK: - UICollectionViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

// MARK: - Private Methods
private extension MainItemCollectionViewCell {

    func configureAppearance() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 12)

        imageView.layer.cornerRadius = 12

        favoriteButton.tintColor = .white
        isFavorite = false
    }

}