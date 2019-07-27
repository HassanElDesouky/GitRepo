//
//  UISearchBar+Extension.swift
//  GitRepo
//
//  Created by Hassan El Desouky on 7/27/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

extension UISearchBar{
  var textField : UITextField{
    return self.value(forKey: "_searchField") as! UITextField
  }
}
