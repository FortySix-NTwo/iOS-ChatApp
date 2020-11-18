//
//  Authentication.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import Foundation

protocol AuthenticationControllerProtocol {
  func isFormValid()
}

protocol AuthenticationProtocol {
  var formIsValid: Bool { get }
}
