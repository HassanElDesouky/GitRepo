
//
//  CacheModel.swift
//  GitRepo
//
//  Created by Hassan El Desouky on 7/27/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

class CacheManager {
  
  private static var sharedCacheManager: CacheManager = {
    let cacheManager = CacheManager()
    
    return cacheManager
  }()
  
  class func shared() -> CacheManager {
    return sharedCacheManager
  }
  
  func saveToJsonFile(repositories: Any) {
    guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
    let fileUrl = documentDirectoryUrl.appendingPathComponent("loaded_repositories.json")
    do {
      let data = try JSONSerialization.data(withJSONObject: repositories, options: [])
      try data.write(to: fileUrl, options: [])
    } catch {
      print(error)
    }
  }
  
  func retriveFromJson() -> [RepositoryResponse] {
    guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return [] }
    let fileUrl = documentDirectoryUrl.appendingPathComponent("loaded_repositories.json")
    do {
      let data = try Data(contentsOf: fileUrl, options: [])
      guard let repositories = try? JSONDecoder().decode([RepositoryResponse].self, from: data) else { fatalError("Error parsing Json data") }
      return repositories
    } catch {
      print(error)
    }
    return []
  }
  
}
