//
//  ViewController.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

extension UIView {
  
  ///
  ///
  ///
  
  func pinToAnchor(
    top: NSLayoutYAxisAnchor? = nil,
    left: NSLayoutXAxisAnchor? = nil,
    bottom: NSLayoutYAxisAnchor? = nil,
    right: NSLayoutXAxisAnchor? = nil,
    paddingTop: CGFloat = 0,
    paddingLeft: CGFloat = 0,
    paddingBottom: CGFloat = 0,
    paddingRight: CGFloat = 0,
    width: CGFloat? = nil,
    height: CGFloat? = nil
  ) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    
    if let left = left {
      leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }
    
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }
    
    if let width = width {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    if let height = height {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
  
  /* MARK: - centerToXAxis
   * center view to X axis
  */
  func centerToXAxis(inView view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  /* MARK: - centerToYAxis
   * center view to Y axis
  */
  func centerToYAxis(
    inView view: UIView,
    leftAnchor: NSLayoutXAxisAnchor? = nil,
    paddingLeft: CGFloat = 0,
    constant: CGFloat = 0
  ) {
    translatesAutoresizingMaskIntoConstraints = false
    centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    
    if let left = leftAnchor {
      pinToAnchor(left: left, paddingLeft: paddingLeft)
    }
  }
  
  /* MARK: - setHeight Function
   * center view to Y axis
  */
  func setHeight(height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    heightAnchor.constraint(equalToConstant: height).isActive = true
  }
  
  /* MARK: - setWidth Function
   * center view to Y axis
  */
  func setWidth(width: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    widthAnchor.constraint(equalToConstant: width).isActive = true
  }
  
  /* MARK: - setDimenstions
   * center view to Y axis
  */
  func setDimenstions(height: CGFloat, width: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    setHeight(height: height)
    setWidth(width: width)
  }
}

