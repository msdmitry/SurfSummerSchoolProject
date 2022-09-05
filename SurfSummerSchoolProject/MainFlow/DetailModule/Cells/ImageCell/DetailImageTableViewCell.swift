//
//  DetailImageTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/8/22.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {
    
    //MARK: - Views
    
    @IBOutlet weak var cartImageView: UIImageView!
    
    //MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.selectionStyle = .none
            self.cartImageView.contentMode = .scaleAspectFill
            self.cartImageView.layer.cornerRadius = 12
        }
    }
    
    //MARK: - Properties
    
    var imageUrlInString: String = "" {
        didSet {
            guard let url = URL(string: imageUrlInString) else {
                return
            }
            cartImageView?.loadImage(from: url)
        }
    }
    
}
