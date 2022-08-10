//
//  FavoriteImageTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/10/22.
//

import UIKit

class FavoriteImageTableViewCell: UITableViewCell {
    
    //MARK: - Constants
    
    private enum Constants {
        static let fillHeartImage = UIImage(named: "hearth-full")
        static let heartImage = UIImage(named: "hearth-empty")
    }
     
    //MARK: - Views
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteCartImageView: UIImageView!
    
    
    // MARK: - Events
    
    var didFavoritesTapped: (() -> Void)?
    
    // MARK: - Calculated
    var buttonImage: UIImage? {
        return isFavorite ? Constants.fillHeartImage : Constants.heartImage
    }
    
    //MARK: - Properties
    
    var image: UIImage? {
        didSet {
            favoriteCartImageView?.image = image
        }
    }
    var isFavorite: Bool = false {
        didSet {
            favoriteButton.setImage(buttonImage, for: .normal)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        didFavoritesTapped?()
        isFavorite.toggle()
    }
    
    //MARK: - UITableFavoriteViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
    
}
    
    //MARK: - Private Methods
    
private extension FavoriteImageTableViewCell {
        
        func configureAppearance() {
            favoriteCartImageView.image = UIImage(named: "korgi")
            favoriteCartImageView.contentMode = .scaleAspectFill
            favoriteCartImageView.layer.cornerRadius = 12
            favoriteButton.tintColor = .white
            isFavorite = false
        }
    }
    

