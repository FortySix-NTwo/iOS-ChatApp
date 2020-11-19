//
//  AuthenticationButton.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

class AuthenticationButton {
  static func titleButton(
    title: String,
    selector: Selector,
    target: Any
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.setHeight(height: 50)
    button.layer.cornerRadius = 5
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    button.isEnabled = false
    button.addTarget(target, action: selector, for: .touchUpInside)
    return button
  }
  
  static func attributedButton(
    atributedText: String,
    atributedTitle: String,
    selector: Selector,
    target: Any
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
    button.addTarget(target, action: selector, for: .touchUpInside)
    return button
  }
  
  static func imageButton(
    image: UIImage,
    selector: Selector,
    target: Any
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.tintColor = .white
    button.setImage(image, for: .normal)
    button.imageView?.contentMode = .scaleToFill
    button.clipsToBounds = true
    button.addTarget(
      target,
      action: selector,
      for: .touchUpInside
    )
    return button
  }
  
}
