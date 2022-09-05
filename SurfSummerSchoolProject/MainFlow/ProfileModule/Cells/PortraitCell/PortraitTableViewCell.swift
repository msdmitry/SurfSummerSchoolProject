//
//  PortraitTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/19/22.
//

import UIKit

class PortraitTableViewCell: UITableViewCell {
    
    //MARK: - Views
    
    @IBOutlet weak var userPortraitImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userSurNameLabel: UILabel!
    @IBOutlet weak var userStatusLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearence()
        configureUserNameLabel()
        configureUserSurNameLabel()
        confugureUserStatusLabel()
    }
    
    func configureAppearence() {
        selectionStyle = .none
        DispatchQueue.main.async {
            self.userPortraitImage.contentMode = .scaleAspectFill
            self.userPortraitImage.layer.cornerRadius = 12
        }
    }
    
    func configureUserNameLabel() {
        userNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    func configureUserSurNameLabel() {
        userSurNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    func confugureUserStatusLabel() {
        userStatusLabel.font = .systemFont(ofSize: 12, weight: .light)
        userStatusLabel.numberOfLines = 0
        userStatusLabel.textColor = UIColor(red: 0.702, green: 0.702, blue: 0.702, alpha: 1)
    }
    
    // MARK: - Properties
    
    var avatar: UIImage? {
        didSet {
            userPortraitImage.image = avatar
        }
    }
    var firstName: String? {
        didSet {
            userNameLabel.text = firstName
        }
    }
    
    var lastName: String? {
        didSet {
            userSurNameLabel.text = lastName
        }
    }
    
    var about: String? {
        didSet {
            userStatusLabel.text = about
        }
    }
    
    
}
