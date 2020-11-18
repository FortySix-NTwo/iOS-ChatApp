//
//  ConversationsVC.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

//  MARK: - Conversations View Controller
class ConversationsVC: UIViewController {

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let isLoggedIn = USER_KV.bool(forKey: "Logged_In")
    
    if !isLoggedIn {
      let viewController = LogInVC()
      let navigationController = UINavigationController(rootViewController: viewController)
      navigationController.modalPresentationStyle = .fullScreen
      present(navigationController, animated: false)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  

}

