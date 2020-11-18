//
//  LogInVM.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import UIKit

struct LogInVM: AuthenticationProtocol {
  var email: String?
  var password: String?
  
  var formIsValid: Bool {
    return email?.isEmpty == false
      && password?.isEmpty == false
  }
}
