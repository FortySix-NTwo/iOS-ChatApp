//
//  SignUpVM.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

struct SignUpVM: AuthenticationProtocol {
  var email: String?
  var password: String?
  var fullname: String?

  var formIsValid: Bool {
    return email?.isEmpty == false
      && password?.isEmpty == false
      && fullname?.isEmpty == false
  }
}
