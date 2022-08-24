//
//  Endpoints.swift
//  DSignerClients
//
//  Created by Devel on 15/06/22.
//

import Foundation

enum Endpoints : String {
  case INITIALIZATION = "api/BelApp/InitSession"
  case GET_FILES = "api/BelApp/GetFiles"
  case GET_FILE = "api/BelApp/GetFile"
  case REJECT_FILE = "api/Belapp/RejectFile"
  case SIGN_FILE = "api/BelApp/SignFile"
  case SEND_FILE_EMAIL = "api/BelApp/SendFileEmail"
  case VALIDATE_USER = "api/BelApp/ValidateUser"
  case UPDATE_SIGN = "api/BelApp/UpdateSign"
}
