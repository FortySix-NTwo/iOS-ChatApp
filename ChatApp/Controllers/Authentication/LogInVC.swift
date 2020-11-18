//
//  LogInVC.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

//  MARK: - LogIn View Controller

class LogInVC: UIViewController {
  //  MARK: - Props
  private var viewModel = LogInVM()
  
  private let iconIamge: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "bubble.right")
    imageView.tintColor = .white
    return imageView
  }()
  
  private let emailTextField = TextFieldInputView
    .textField(placeholder: "Email...")
  private let passwordTextField = TextFieldInputView
    .secureTextField(placeholder: "Password...")
  private lazy var emailContainerView = ContainerInputView
    .containerView(imageName: "envelope", textField: emailTextField)
  private lazy var passwordContainerView = ContainerInputView
    .containerView(imageName: "lock", textField: passwordTextField)
  private let loginButton = AuthenticationButton
    .create(title: "Log In", selector: #selector(handleLogin))
  private let unregisteredAccountButton = AuthenticationButton.attributedButton(
    atributedText: "Don't have an account? ",
    atributedTitle: "Sign up",
    selector: #selector(handleUnregisteredButton)
  )
    
  
  //  MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureNotificationObservers()
  }
  
  //  MARK: - Selectors
  @objc func handleUnregisteredButton() {
    let controller = SignUpVC()
    navigationController?.pushViewController(controller, animated: true)
  }

  @objc func textDidChange(sender: UITextField) {
    if sender == emailTextField {
      viewModel.email = sender.text
    } else {
      viewModel.password = sender.text
    }
    isFormValid()
  }
  
  @objc func handleLogin() {
//    guard let email = emailTextField.text else { return }
//    guard let password = passwordTextField.text else { return }
//
    showLoading(true, withText: "Loggin In")
    
//    AuthService.userLogin(withEmail: email, password: password) {[weak self] (success) in
//      guard let `self` = self else { return }
//      //var message: String = ""
//      if (success) {
//          message = "User was sucessfully logged in."
//         self.showLoading(false)
//         self.dismiss(animated: true, completion: nil)
//      } else {
//        self.showLoading(false)
//          message = "There was an error."
//        return
//      }
//    }
  }
  
  // MARK: - Handlers
  func configureUI() {
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
    
    configureGradientLayer()
    
    view.addSubview(iconIamge)
    iconIamge.centerToXAxis(inView: view)
    iconIamge.pinToAnchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    iconIamge.setDimenstions(height: 140, width: 140)
    
    let stackView = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   loginButton])
    
    stackView.axis = .vertical
    stackView.spacing = 16
    
    view.addSubview(stackView)
    
    stackView.pinToAnchor(top: iconIamge.bottomAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingTop: 32,
                          paddingLeft: 32,
                          paddingRight: 32)
    
    view.addSubview(unregisteredAccountButton)
    
    unregisteredAccountButton.pinToAnchor(left: view.leftAnchor,
                                          bottom: view.bottomAnchor,
                                          right: view.rightAnchor,
                                          paddingLeft: 32,
                                          paddingBottom: 32,
                                          paddingRight: 32)
  }
  
  
  func configureNotificationObservers() {
    emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
  }
}

//  MARK: - AuthenticationControllerProtocol
extension LogInVC: AuthenticationControllerProtocol {
  func isFormValid() {
    if viewModel.formIsValid {
      loginButton.isEnabled = true
      loginButton.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
      loginButton.setTitleColor(.white, for: .normal)
    } else {
      loginButton.isEnabled = false
      loginButton.backgroundColor = .clear
      loginButton.setTitleColor(.clear, for: .normal)
    }
  }
}
