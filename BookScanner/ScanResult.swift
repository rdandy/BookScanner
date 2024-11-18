//
//  ScanResult.swift
//  BookScanner
//
//  Created by Andy on 2024-11-18.
//

import Foundation
import Combine

class ScanResult: ObservableObject {
    @Published var isbnCode: String = ""
}
