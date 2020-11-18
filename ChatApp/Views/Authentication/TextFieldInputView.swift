//
//  TextFieldInputView.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

//  MARK: - Text Field Input View
class TextFieldInputView: UITextField {
  init(placeholder: String) {
    super.init(frame: .zero)
    borderStyle = .none
    font = UIFont.systemFont(ofSize: 16)
    keyboardAppearance = .dark
    attributedPlaceholder = NSAttributedString(
      string: placeholder,
      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
    )
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  static func secureTextField(placeholder: String) -> TextFieldInputView {
    let text = TextFieldInputView(placeholder: placeholder)
    text.isSecureTextEntry = true
    return text
  }
  
  static func textField(placeholder: String) -> TextFieldInputView {
    let text = TextFieldInputView(placeholder: placeholder)
    text.isSecureTextEntry = false
    return text
  }
}
