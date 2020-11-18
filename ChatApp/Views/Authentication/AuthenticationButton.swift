//
//  AuthenticationButton.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

class AuthenticationButton {
  static func create(
    title: String,
    selector: Selector
  ) -> UIButton {
    
    let button = UIButton(type: .system)
    button.setHeight(height: 50)
    button.layer.cornerRadius = 5
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.isEnabled = false
    button.addTarget(self, action: selector, for: .touchUpInside)
    return button
  }
  
  static func attributedButton(
    atributedText: String,
    atributedTitle: String,
    selector: Selector
  ) -> UIButton {
    
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(
      string: atributedText,
      attributes: [
        .font: UIFont.boldSystemFont(ofSize: 16),
        .foregroundColor: UIColor.white
      ])
    
    attributedTitle.append(
      NSAttributedString(
        string: atributedTitle,
        attributes: [
          .font: UIFont.boldSystemFont(ofSize: 16),
          .foregroundColor: UIColor.white
        ])
    )
    
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.addTarget(self, action: selector, for: .touchUpInside)
    
    return button
  }
  
}
