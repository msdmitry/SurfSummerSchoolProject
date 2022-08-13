//
//  DetailTextTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/8/22.
//

import UIKit

class DetailTextTableViewCell: UITableViewCell {
    
    //MARK: - Views
    
    @IBOutlet weak var contentLabel: UILabel!
    
    //MARK: - Properties
    
    var text: String? {
        didSet {
            contentLabel.text = text
        }
    }
    
    //MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
    }
    
    func configureAppearence() {
        selectionStyle = .none
        contentLabel.font = .systemFont(ofSize: 12)
        contentLabel.textColor = .black
        contentLabel.numberOfLines = 0
    }
    
}
