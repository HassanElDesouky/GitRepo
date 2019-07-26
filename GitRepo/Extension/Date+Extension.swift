//
//  Date+Extension.swift
//  GitRepo
//
//  Created by Hassan El Desouky on 7/27/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

extension Date {
  static func getFormattedDate(string: String , formatter:String) -> String{
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = formatter
    
    let date: Date? = dateFormatterGet.date(from: string)
    return dateFormatterPrint.string(from: date!);
  }
}
