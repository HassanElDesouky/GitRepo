//
//  RepositoriesController.swift
//  GitRepo
//
//  Created by Hassan El Desouky on 7/26/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class RepositoriesController: UIViewController {
  
  // MARK: - Properites
  let clientID = "07433363de7de028229f"
  let clientSecret = "add7ac2abdc6e81fa7ee19c824907a55f0877bb9"
  let redirectURL = "https://github.com/serhii-londar/GithubIssues"
  let cellId = "cellId"
  let searchController = UISearchController(searchResultsController: nil)
  var accessToken: String?
  var loginVC: GithubLoginVC! = nil
  var repositories: [RepositoryResponse] = [RepositoryResponse]()

  // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Life Cycel
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupSearchBar()
    setupAccessToken()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if accessToken == nil {
      self.perform(#selector(handleLogin), with: nil, afterDelay: 1)
    } else {
      loadRepositories()
    }
  }
  
  // MARK: - Methods
  // MARK: Private Methods
  @IBAction func handleLogout(_ sender: Any) {
    // Remove keychain objects.
    KeychainWrapper.standard.removeAllKeys()
    // Go to login page.
    let mainController = storyboard?.instantiateViewController(withIdentifier: "MainController") as! MainController
    let appDelegate = UIApplication.shared.delegate
    appDelegate?.window??.rootViewController = UINavigationController(rootViewController: mainController)
  }
  
  @objc private func handleLogin() {
    self.loginVC =  GithubLoginVC(clientID: clientID, clientSecret: clientSecret, redirectURL: redirectURL)
    self.loginVC.login(withScopes: [.repo], allowSignup: true, completion: { accessToken in
      self.accessToken = accessToken
      // Save access token to Keychain.
      let saveAccessToken: Bool = KeychainWrapper.standard.set(accessToken, forKey: "accessToken")
      self.loadRepositories()
    }, error: { error in
      print(error.localizedDescription)
    })
  }
  
  private func loadRepositories(username: String) {
    guard let accessToken = accessToken else { return }
    //Load someone else's public repos
    RepositoriesAPI(authentication: TokenAuthentication(token: accessToken)).repositories(user: username) { (response, err) in
      if let response = response {
        self.repositories = response
        DispatchQueue.main.async {
          self.tableView.reloadData()
          self.setupNavigationItem()
        }
      } else {
        print(err ?? "")
      }
    }
  }
  
  private func loadRepositories() {
    guard let accessToken = accessToken else { return }
    // Load the authentecated user (all) repos
    RepositoriesAPI(authentication: TokenAuthentication(token: accessToken)).repositories { (response, error) in
      if let response = response {
        self.repositories = response
        DispatchQueue.main.async {
          self.tableView.reloadData()
          self.setupNavigationItem()
        }
      } else {
        print(error ?? "")
      }
    }
  }
  
  // MARK: Fileprivate Methods
  fileprivate func setupTableView() {
    let nib = UINib(nibName: "RepositoryCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: cellId)
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  fileprivate func setupNavigationItem() {
    navigationItem.title = "\(repositories[0].owner?.login ?? "") Repositories"
  }
  
  fileprivate func setupSearchBar() {
    navigationItem.searchController = searchController
    searchController.searchBar.delegate = self
    searchController.searchBar.placeholder = "Enter a GitHub username"
    navigationItem.hidesSearchBarWhenScrolling = true
  }
  
  fileprivate func setupAccessToken() {
    accessToken = KeychainWrapper.standard.string(forKey: "accessToken")
  }
}


// MARK: - TableView Delegate and DataSource
extension RepositoriesController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repositories.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RepositoryCell
    let repo = repositories[indexPath.row]
    cell.configureCell(repo)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let urlString = repositories[indexPath.row].htmlUrl {
      let url = URL(string: urlString)!
      if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
      }
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
}

// MARK: - UISearchBar Delegate
extension RepositoriesController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    loadRepositories(username: searchBar.text!)
    searchController.dismiss(animated: true, completion: nil)
  }
}
