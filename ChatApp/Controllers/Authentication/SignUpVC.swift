//
//  SignUpVC.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

//  MARK: - SignUp View Controller
class SignUpVC: UIViewController {
  
  //  MARK: - Class Properties
  private var viewModel = SignUpVM()
  
  private var profileImage: UIImage?
  
  private let addPhotoButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .white
    button.setImage(#imageLiteral(resourceName: "PlusButton"), for: .normal)
    button.imageView?.contentMode = .scaleToFill
    button.clipsToBounds = true
    button.addTarget(
      self,
      action: #selector(handlePhotoSelection),
      for: .touchUpInside
    )
    return button
  }()
  
  private let emailTextField = TextFieldInputView
    .textField(placeholder: "Email...")
  
  private let fullnameTextField = TextFieldInputView
    .textField(placeholder: "Full name...")
  
  private let passwordTextField = TextFieldInputView
    .secureTextField(placeholder: "Password...")
  
  private lazy var emailContainerView = ContainerInputView
    .containerView(imageName: "envelope", textField: emailTextField)
  
  private lazy var fullnameContainerView = ContainerInputView
    .containerView(imageName: "person", textField: fullnameTextField)
  
  private lazy var passwordContainerView = ContainerInputView
    .containerView(imageName: "lock", textField: passwordTextField)
  
  private let signUpButton = AuthenticationButton
    .create(title: "Sign In", selector: #selector(handleSignup))
  
  private let registeredAccountButton = AuthenticationButton
    .attributedButton(
      atributedText: "Already have an account? ",
      atributedTitle: "Log in",
      selector: #selector(handleRegisteredButton))
  
  //  MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureNotificationObservers()
  }
  
  //  MARK: - Selectors
  @objc func handlePhotoSelection() {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    present(imagePickerController, animated: true, completion: nil)
  }
  
  @objc func handleRegisteredButton() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func textDidChange(sender: UITextField) {
    if sender == emailTextField {
      viewModel.email = sender.text
    } else if sender == passwordTextField {
      viewModel.password = sender.text
    } else if sender == fullnameTextField {
      viewModel.fullname = sender.text
    }
    isFormValid()
  }
  
  @objc func handleSignup() {
    //    guard let email = emailTextField.text else { return }
    //    guard let password = passwordTextField.text else { return }
    //    guard let fullname = fullnameTextField.text else { return }
    //    guard let image = profileImage else { return }
    
    showLoading(true, withText: "Creating a New Account")
    
    //    let credentials = AuthenticationModel(email: email,
    //                                          password: password,
    //                                          fullname: fullname,
    //                                          profileImage: image)
    //
    //    AuthService.userSignup(credentials: credentials) { [weak self] (success) in
    //      guard let `self` = self else { return }
    //      //var message: String = ""
    //      if (success) {
    //        self.showLoading(false)
    //        self.dismiss(animated: true, completion: nil)
    //      } else {
    //        //message = "Signing up failed, please try again..."
    //        self.showLoading(false)
    //      }
    //    }
  }
  
  @objc func keyboardWillShow() {
    if view.frame.origin.y == 0 {
      self.view.frame.origin.y -= 88
    }
  }
  
  @objc func keyboardWillHide() {
    if view.frame.origin.y != 0 {
      self.view.frame.origin.y = 0
    }
  }
  
  //  MARK: - Handlers
  func configureUI() {
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
    
    configureGradientLayer()
    
    view.addSubview(addPhotoButton)
    addPhotoButton.centerToXAxis(inView: view)
    addPhotoButton.pinToAnchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    addPhotoButton.setDimenstions(height: 200, width: 200)
    
    let stackView = UIStackView(arrangedSubviews: [fullnameContainerView,
                                                   emailContainerView,
                                                   passwordContainerView,
                                                   signUpButton])
    stackView.axis = .vertical
    stackView.spacing = 16
    
    view.addSubview(stackView)
    stackView.pinToAnchor(top: addPhotoButton.bottomAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingTop: 32,
                          paddingLeft: 32,
                          paddingRight: 32)
    
    view.addSubview(registeredAccountButton)
    
    registeredAccountButton.pinToAnchor(left: view.leftAnchor,
                                        bottom: view.bottomAnchor,
                                        right: view.rightAnchor,
                                        paddingLeft: 32,
                                        paddingBottom: 32,
                                        paddingRight: 32)
  }
  
  func configureNotificationObservers() {
    emailTextField.addTarget(
      self,
      action: #selector(textDidChange),
      for: .editingChanged
    )
    
    passwordTextField.addTarget(
      self,
      action: #selector(textDidChange),
      for: .editingChanged
    )
    
    fullnameTextField.addTarget(
      self,
      action: #selector(textDidChange),
      for: .editingChanged
    )
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillShow),
      name: UIResponder.keyboardWillShowNotification, object: nil
    )
    
    NotificationCenter.default.addObserver(
      self, selector: #selector(keyboardWillHide),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }
}

//  MARK: - Image Picker Controller Delegate
extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
  ) {
    
    let image = info[.originalImage] as? UIImage
    profileImage = image
    
    addPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
    addPhotoButton.layer.borderColor = UIColor.white.cgColor
    addPhotoButton.layer.borderWidth = 3.0
    addPhotoButton.layer.cornerRadius = 200/2
    
    dismiss(animated: true, completion: nil)
  }
}

//  MARK: - Authentication Protocol
extension SignUpVC: AuthenticationControllerProtocol {
  func isFormValid() {
    if viewModel.formIsValid {
      signUpButton.isEnabled = true
      signUpButton.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
      signUpButton.setTitleColor(.white, for: .normal)
    } else {
      signUpButton.isEnabled = false
      signUpButton.backgroundColor = .clear
      signUpButton.setTitleColor(.clear, for: .normal)
    }
  }
}
