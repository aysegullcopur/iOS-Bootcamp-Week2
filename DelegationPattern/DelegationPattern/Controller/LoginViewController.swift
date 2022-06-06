//
//  LoginViewController.swift
//  DelegationPattern
//
//  Created by Aysegul COPUR on 31.05.2022.
//

import UIKit

//This protocol delegate LoginViewController to transfer logout information.
protocol LoginViewControllerDelegate: AnyObject {
    func logoutButtonTapped()
}

class LoginViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        welcomeLabel.text = "Welcome back, \(username ?? "Unknown")"
    }

    @IBAction func logoutButtonTapped(_ sender : UIButton) {
        navigationController?.popViewController(animated: false)
        delegate?.logoutButtonTapped()
    }

}
