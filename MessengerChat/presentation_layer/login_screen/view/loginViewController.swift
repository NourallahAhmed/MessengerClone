//
//  LoginViewController.swift
//  MessengerChat
//
//  Created by NourAllah Ahmed on 04/02/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView : UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        
        return scrollView
    }()
    
    private let imageView  : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "messenger")
        imageView.contentMode  = .scaleAspectFit
        return imageView
    }()
    
    private let emailField : UITextField = {
       
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.keyboardType = .emailAddress
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.placeholder = StringManager.email
    
        
        return field
    }()
    
    private var passwordField : UITextField = {
       let field = UITextField()
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.autocapitalizationType = .none
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.placeholder = StringManager.password
        field.isSecureTextEntry = true
        
        return field
        
    }()
    
    private var loginButton : UIButton = {
        let button = UIButton()
        button.setTitle(StringManager.login, for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        return button
    }()
    
    private let emailError : UILabel = {
        
        let label = UILabel()
        
        label.text = StringManager.emailError
        
        label.textColor = .red
        
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    
    private let passwordError : UILabel = {
        
        let label = UILabel()
        
        label.text = StringManager.passwordError
        
        label.textColor = .red
        
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    
    
    private let passwordRule: UILabel = {
        
        let label = UILabel()
        
        label.text = StringManager.passwordRules
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textColor = .gray
        
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let showPasswordButton : UIButton = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        return button
    }()
    
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = StringManager.login

        setTargets()
        
        self.emailError.isHidden = true
        self.passwordError.isHidden = true
        
        emailField.delegate = self
        passwordField.delegate = self
        
        
        passwordField.rightView = showPasswordButton
        passwordField.rightViewMode = .always
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(emailError)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(passwordError)
        scrollView.addSubview(passwordRule)
        scrollView.addSubview(passwordError)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(showPasswordButton)



    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        let size = scrollView.width / 3
        imageView.frame = CGRect(x: ( scrollView.width - size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        
        emailField.frame = CGRect(x: 30,
                                  y: imageView.bottom + 30,
                                  width: scrollView.width - 60,
                                  height: 50)
        
        emailError.frame = CGRect(x: 30,
                                  y: emailField.bottom + 10,
                                  width: scrollView.width - 60,
                                  height: 10)
        
        passwordField.frame = CGRect(x: 30,
                                  y: emailError.bottom + 5,
                                  width: scrollView.width - 60,
                                  height: 50)
        
        passwordRule.frame = CGRect(x: 30,
                                  y: passwordField.bottom + 10,
                                  width: scrollView.width - 60,
                                  height: 15)
        
        passwordError.frame = CGRect(x: 30,
                                  y: passwordRule.bottom + 10,
                                  width: scrollView.width - 60,
                                  height: 10)
        
        loginButton.frame = CGRect(x: 30,
                                  y: passwordError.bottom + 20,
                                  width: scrollView.width - 60,
                                  height: 50)
    }
    
    
   
    
}
//MARK: UITextFieldDelegate
extension LoginViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == emailField){
            passwordField.becomeFirstResponder()
        }
        else{
            if(passwordField == textField){
                loginTapped()
            }
        }
        return true
    }
    
}




//MARK: ClassFunctions
extension LoginViewController {
    
    @objc func didTapRegister(){
        
        let vc = RegisterViewController()
        vc.title = StringManager.register
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func setTargets(){
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: StringManager.register , style: .done, target: self, action: #selector(didTapRegister))
        
        emailField.addTarget(self, action: #selector(emailFieldDidChange), for: .allEditingEvents)
        passwordField.addTarget(self, action: #selector(passwordFieldDidChange), for: .allEditingEvents)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)

        showPasswordButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
    }
    
    @objc func  emailFieldDidChange() {
     
        if (!(emailField.text?.isEmpty ?? "".isEmpty) ){
            if (emailField.text!.isEmailFormatted == false ) {
              emailError.isHidden = false
                
            }else{
                emailError.isHidden = true
            }
            
        }
//        isLoginEnabled()
    }
    
    @objc func  passwordFieldDidChange() {
     
        if (!(passwordField.text?.isEmpty ?? "".isEmpty) ){
            if (passwordField.text!.isPasswordVaild == false ) {
                passwordError.isHidden = false
                
            }else{
                passwordError.isHidden = true
            }
            
        }
//        isLoginEnabled()
    }
    
    
    @objc func loginTapped(){

        guard let email = emailField.text , let password = passwordField.text ,
              !email.isEmpty , !password.isEmpty else {
            showAlert()
            return
        }
        
      print("tapped")
    }

    
    func showAlert(){
        let alert = UIAlertController(title: StringManager.oops, message: StringManager.registerError , preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: StringManager.okAlertAction, style: .cancel))
        present(alert , animated:  false)
    }
            
   @objc func showPassword(){
      if ( passwordField.isSecureTextEntry ){
          showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
          passwordField.isSecureTextEntry = false
      }else{
          showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
          passwordField.isSecureTextEntry = true
      }
       
       
    }
}
