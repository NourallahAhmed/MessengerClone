//
//  RegisterViewController.swift
//  MessengerChat
//
//  Created by NourAllah Ahmed on 04/02/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
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
    
    
    private let firstNameField : UITextField = {
       
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.keyboardType = .alphabet
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.placeholder = StringManager.firstName
    
        
        return field
    }()
    
    private let lastNameField : UITextField = {
       
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.keyboardType = .alphabet
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.placeholder = StringManager.lastName
    
        
        return field
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
        field.textContentType = .none
        return field
        
    }()
    
    private var confirmPasswordField : UITextField = {
       let field = UITextField()
        field.autocorrectionType = .no
        field.textContentType = .none
        field.returnKeyType = .continue
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.placeholder = StringManager.confirmPassword
        field.isSecureTextEntry = true
        
        return field
        
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
    
    
    private var registerButton : UIButton = {
        let button = UIButton()
        button.setTitle(StringManager.register, for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        return button
    }()
    
    private let showPasswordButton : UIButton = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        return button
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
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        title = StringManager.register
        
        self.emailError.isHidden = true
        self.passwordError.isHidden = true
        
        setDelegates()
        setSubViews()
        setTargets()
    }
    
    //MARK: viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        let size = scrollView.width / 3
        imageView.frame = CGRect(x: ( scrollView.width - size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        
        firstNameField.frame = CGRect(x: 30,
                                  y: imageView.bottom + 30,
                                  width: scrollView.width - 60,
                                  height: 50)
        
        lastNameField.frame = CGRect(x: 30,
                                  y: firstNameField.bottom + 30,
                                  width: scrollView.width - 60,
                                  height: 50)
        
        
        emailField.frame = CGRect(x: 30,
                                  y: lastNameField.bottom + 30,
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
        
        confirmPasswordField.frame = CGRect(x: 30,
                                  y: passwordRule.bottom + 10,
                                  width: scrollView.width - 60,
                                  height: 50)
        
        passwordError.frame = CGRect(x: 30,
                                  y: confirmPasswordField.bottom + 10,
                                  width: scrollView.width - 60,
                                  height: 10)
        
        registerButton.frame = CGRect(x: 30,
                                  y: passwordError.bottom + 20,
                                  width: scrollView.width - 60,
                                  height: 50)
    }
    
    
   

}

//MARK: UITextFieldDelegate
extension RegisterViewController : UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == firstNameField){
            lastNameField.becomeFirstResponder()
        }
        else{
            
            if(textField == lastNameField){
                emailField.becomeFirstResponder()
            }else{
                if(textField == emailField){
                    passwordField.becomeFirstResponder()
                }else{
                    if(textField == passwordField){
                        confirmPasswordField.becomeFirstResponder()
                    }else{
                        if(textField == confirmPasswordField){
                            registerTapped()
                        }
                    }
                }
            }
           
        }
        return true
    }
    
    
}
//MARK: class Functions
extension RegisterViewController {
    
    
    
    func setDelegates(){
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        confirmPasswordField.delegate = self
    }
    func setSubViews(){
        
        
        passwordField.rightView = showPasswordButton
        passwordField.rightViewMode = .always
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(imageView)
        self.scrollView.addSubview(firstNameField)
        self.scrollView.addSubview(lastNameField)
        self.scrollView.addSubview(emailField)
        self.scrollView.addSubview(emailError)
        self.scrollView.addSubview(passwordField)
        self.scrollView.addSubview(passwordRule)
        self.scrollView.addSubview(passwordRule)
        self.scrollView.addSubview(showPasswordButton)

        self.scrollView.addSubview(confirmPasswordField)
        self.scrollView.addSubview(passwordError)
        self.scrollView.addSubview(registerButton)
    }
    
    func setTargets(){
        
       
        
        emailField.addTarget(self, action: #selector(emailFieldDidChange), for: .allEditingEvents)
        passwordField.addTarget(self, action: #selector(passwordFieldDidChange), for: .allEditingEvents)
        confirmPasswordField.addTarget(self, action: #selector(confirmPassword), for: .allEditingEvents)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        showPasswordButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        
    }
    
    @objc func confirmPassword(){
        if (!(passwordField.text?.isEmpty ?? "".isEmpty) && !(confirmPasswordField.text?.isEmpty ?? "".isEmpty) ){
            if(passwordField.text?.isPasswordVaild == false){
                passwordError.text = StringManager.passwordError
                passwordError.isHidden = false
            }else{
                if (passwordField.text != confirmPasswordField.text) {
                    passwordError.text = StringManager.passwordsNotMatches
                    passwordError.isHidden = false
                }else{
                    passwordError.isHidden = true
                }
                
            }
            
        }
    }
    //MARK: registerTapped
    @objc func registerTapped(){
        let matches = confirmPasswordField.text == passwordField.text ? true : false
        guard let email = emailField.text ,
              let password = passwordField.text ,
              let firstName = firstNameField.text ,
              let lastName = lastNameField.text ,
              !email.isEmpty ,
              !password.isEmpty ,
              !firstName.isEmpty ,
              !lastName.isEmpty ,
              !password.isPasswordVaild,
              !matches
        
        else {
            showAlert()
            return
        }
        
      print("tapped")
    }
    //MARK: emailFieldDidChange
    @objc func  emailFieldDidChange() {
     
        if (!(emailField.text?.isEmpty ?? "".isEmpty) ){
            if (emailField.text!.isEmailFormatted == false ) {
              emailError.isHidden = false
                
            }else{
                emailError.isHidden = true
            }
            
        }
    }
    
    @objc func  passwordFieldDidChange() {
     
        if (!(passwordField.text?.isEmpty ?? "".isEmpty) ){
            if (passwordField.text!.isPasswordVaild == false ) {
                passwordError.isHidden = false
                
            }else{
                passwordError.isHidden = true
            }
            
        }
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
