//
//  Controller.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit
import JGProgressHUD

extension UIViewController {
  
  static let hud = JGProgressHUD(style: .dark)
  
  func configureGradientLayer() {
    let gradient = CAGradientLayer()
    
    gradient.colors = [
      UIColor.systemTeal.cgColor,
      UIColor.systemIndigo.cgColor
    ]
    
    gradient.locations = [0, 1]
    view.layer.addSublayer(gradient)
    gradient.frame = view.frame
  }
  
  func configureNavigationBar(withTitle title: String, prefersLargeTitles: Bool) {
    let appeareance = UINavigationBarAppearance()
    appeareance.configureWithOpaqueBackground()
    appeareance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    appeareance.backgroundColor = .systemTeal
    navigationController?.navigationBar.standardAppearance = appeareance
    navigationController?.navigationBar.compactAppearance = appeareance
    navigationController?.navigationBar.scrollEdgeAppearance = appeareance
    navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
    navigationItem.title = title
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
  }
  
  func showLoading(
    _ show: Bool,
    withText text: String? = "Loading"
  ) {
    view.endEditing(true)
    UIViewController.hud.textLabel.text = text
    if show {
      UIViewController.hud.show(in: view)
    } else {
      UIViewController.hud.dismiss()
    }
  }
  
  func showAlert(
    title: String?,
    message: String?,
    buttonTitles: [String]? = nil,
    highlightedButtonIndex: Int? = nil,
    completion: ((Int) -> Void)? = nil) -> UIAlertController {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )
    
    var allButtons = buttonTitles ?? [String]()
    if allButtons.count == 0 {
      allButtons.append("OK")
    }
    
    for index in 0..<allButtons.count {
      let buttonTitle = allButtons[index]
      let action = UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
        completion?(index)
      })
      
      alertController.addAction(action)
      if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
        alertController.preferredAction = action
      }
    }
    present(alertController, animated: true, completion: nil)
    return alertController
  }

}

