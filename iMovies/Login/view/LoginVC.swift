//
//  LoginVC.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 12/03/24.
//

import UIKit
import RxSwift
import RxCocoa


class LoginVC: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    
    //MARK: - Properties
    static let nibName: String = "LoginVC"
    let disposeBag = DisposeBag()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.text = "diego.dev@gmail.com"
        passwordTxtField.text = "warMachineRock!@"
        
        
        self.loginBtn.rx.tap.withLatestFrom(Observable.combineLatest(emailTxtField.rx.text.orEmpty,
                                                                     passwordTxtField.rx.text.orEmpty))
            .subscribe(onNext: {
                self.validateCredentials(user: $0, password: $1)
            }).disposed(by: disposeBag)
    }
    
    //MARK: - Navigation
    
    //MARK: - IBActions
    
    //MARK: - Functions
    
    func validateCredentials(user:String, password:String){
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        let emailValid: Bool = emailTest.evaluate(with: user)
        let passValid: Bool = (password != "" && password.count >= 6)
        
        if (emailValid && passValid) {
            goToMainVC()
        } else {
            showErrorAlert()
        }

    }
    
    func goToMainVC(){
        let homeVC = HomeVC(nibName: "HomeVC", bundle: nil)
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true, completion: nil)
    }
    
    func showErrorAlert() {
            let alertController = UIAlertController(title: "Invalid Credentials",
                                                    message: "Check your username or password", preferredStyle: .alert)
        
            let okAction = UIAlertAction(title: "Accept", style: .default) { _ in
                print("Usuario presionó OK")
            }
            alertController.addAction(okAction)
            
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
                print("Usuario presionó Cancelar")
            }
            //alertController.addAction(cancelAction)
        
            present(alertController, animated: true, completion: nil)
        }
    
}

//MARK: - Delegates
