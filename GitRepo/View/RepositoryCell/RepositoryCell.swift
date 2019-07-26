//
//  RepositoryCell.swift
//  GitRepo
//
//  Created by Hassan El Desouky on 7/26/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
  
  // MARK: - Properites
  let imageCache = NSCache<NSString, UIImage>()
  
  // MARK: - Outlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var languageLabel: UILabel!
  @IBOutlet weak var forksCountLabel: UILabel!
  @IBOutlet weak var createdAtLabel: UILabel!
  @IBOutlet weak var userImageView: UIImageView!
  
  // MARK: - Life Cycle
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  // MARK: - Methods
  func configureCell (_ repo: RepositoryResponse) {
    selectionStyle = .none

    titleLabel.text = repo.name
    descriptionLabel.text = repo.descriptionField
    forksCountLabel.text = "\(repo.forksCount ?? 0)"
    languageLabel.text =  repo.language ?? "-"
    createdAtLabel.text = Date.getFormattedDate(string: repo.createdAt!, formatter: "MMM dd,yyyy")
    loadUserImage(from: URL(string: (repo.owner?.avatarUrl)!)!)
  }
  
  // MARK: - Proivate Methods
  private func loadUserImage(from url:URL) {
    if let cachedImage = imageCache.object(forKey: url.absoluteString as String as NSString) {
      self.userImageView.image = cachedImage
    } else {
      getData(from: url) { (data, response, error) in
        guard let data = data, error == nil else {
          return
        }
        DispatchQueue.main.async {
          if let image = UIImage(data: data) {
            self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
            self.userImageView.image = image
          }
        }
      }
    }
    
  }
  
  private func getData(from url:URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
  }
}
