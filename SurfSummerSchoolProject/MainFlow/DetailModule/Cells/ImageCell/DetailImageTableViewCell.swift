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
    
    var model: DetailItemModel?
    
    //потом надо будет менять при загрузке изображений
    var image: UIImage? {
        didSet {
            cartImageView.image = image
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
