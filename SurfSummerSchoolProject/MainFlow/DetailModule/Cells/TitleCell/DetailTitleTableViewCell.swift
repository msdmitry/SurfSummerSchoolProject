//
//  DetailTitleTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/8/22.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell {
    
    //MARK: - Views
    
    @IBOutlet private weak var cartTitleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    //MARK: - Properties
    
    var title: String = "" {
        didSet {
            cartTitleLabel.text = title
        }
    }
    
    var date: String = "" {
        didSet {
            dateLabel.text = date
        }
    }
    
    //MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
    
    private func configureAppearance() {
        selectionStyle = .none
        cartTitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = UIColor(named: "textLabelsColor")
    }
    
}
