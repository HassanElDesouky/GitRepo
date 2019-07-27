//
//  MainController.swift
//  GitRepo
//
//  Created by Hassan El Desouky on 7/27/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func handleLogin(_ sender: Any) {
    let reposController = storyboard?.instantiateViewController(withIdentifier: "RepositoriesController") as! RepositoriesController
    navigationController?.pushViewController(reposController, animated: true)
  }
}
