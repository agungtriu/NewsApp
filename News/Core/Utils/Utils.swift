//
//  Date.swift
//  News
//
//  Created by Agung Tri Utomo on 05/12/21.
//

import Foundation

final class Utils {
    static func convertDate(date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        return dateFormatter.date(from: date)
    }
}
