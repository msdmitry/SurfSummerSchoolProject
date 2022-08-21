//
//  LoginViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/21/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginButton(_ sender: UIButton) {
        navigationController?.pushViewController(ErrorViewController(), animated: true)
        print("Hello")
    }
    

}
