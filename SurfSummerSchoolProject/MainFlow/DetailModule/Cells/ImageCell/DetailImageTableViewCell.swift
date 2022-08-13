//
//  DetailImageTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/8/22.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {
    
    //MARK: - Views
    
    @IBOutlet private weak var cartImageView: UIImageView!
    
    //MARK: - Properties
    
    var imageUrlInString: String = "" {
            didSet {
                guard let url = URL(string: imageUrlInString) else {
                    return
                }
                imageView?.loadImage(from: url)
            }
        }
    
    //MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        cartImageView.layer.cornerRadius = 12
        cartImageView.contentMode = .scaleAspectFill
    }
    
}
