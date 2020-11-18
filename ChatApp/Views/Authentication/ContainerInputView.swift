//
//  ContainerInputView.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

//  MARK: - Container Input View
class ContainerInputView: UIView {
  
  private init(image: UIImage?, textField: UITextField) {
    super.init(frame: .zero)
    
    let imageView = UIImageView()
    imageView.image = image
    imageView.tintColor = .white
    imageView.alpha = 0.87
    
    addSubview(imageView)
    imageView.centerToYAxis(inView: self)
    imageView.pinToAnchor(left: leftAnchor, paddingLeft: 8)
    imageView.setDimenstions(height: 20, width: 20)
    
    backgroundColor = .clear
    setHeight(height: 50)
    layer.cornerRadius = 5
    
    addSubview(textField)
    textField.textColor = .white
    
    textField.centerToYAxis(inView: self)
    
    textField.pinToAnchor(
      left: imageView.rightAnchor,
      bottom: bottomAnchor,
      right: rightAnchor,
      paddingLeft: 8,
      paddingBottom: 8
    )
    
    let dividerView = UIView()
    
    dividerView.backgroundColor = .white
    
    addSubview(dividerView)
    dividerView.pinToAnchor(
      left: imageView.rightAnchor,
      bottom: bottomAnchor,
      right: rightAnchor,
      paddingLeft: 8,
      height: 0.75
    )
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  static func containerView(
    imageName: String,
    textField: TextFieldInputView
  ) -> ContainerInputView {
    return ContainerInputView(
      image: UIImage(systemName: imageName),
      textField: textField
    )
  }
  
}


