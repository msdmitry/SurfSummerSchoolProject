//
//  CityTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/19/22.
//

import UIKit

class CityPhoneEmailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headingNameLabel: UILabel!
    @IBOutlet weak var subheadingNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        headingNameLabel.font = .systemFont(ofSize: 12, weight: .light)
        headingNameLabel.textColor = UIColor(red: 0.702, green: 0.702, blue: 0.702, alpha: 1)
        subheadingNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    }
    
    // MARK: - Properties
    
    var headingName: String? {
        didSet {
            headingNameLabel.text = headingName
        }
    }
    
    var subheadingName: String? {
        didSet {
            subheadingNameLabel.text = subheadingName
        }
    }
    
}
