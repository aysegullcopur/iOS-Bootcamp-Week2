//
//  ViewController.swift
//  DelegationPattern
//
//  Created by Aysegul COPUR on 30.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Added placeholder to username and password by using storyboard
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //Create connection between view controller and login view controller
    @IBAction func logInButtonPressed(_sender: UIButton) {
        if let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            
            viewController.username = usernameTextField.text
            viewController.delegate = self
            
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension ViewController: LoginViewControllerDelegate{

    // If delegate function is triggered, feedback is returned to view controller.
    func logoutButtonTapped() {
        let controller = UIAlertController(title: "Logout", message: "Logout successfully.", preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "Login Again", style: .cancel, handler: nil))
        present(controller, animated: true, completion: nil)
    }
}
