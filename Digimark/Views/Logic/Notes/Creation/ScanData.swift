//
//  ScanData.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/25/22.
//

import Foundation

struct ScanData: Identifiable {
    var id = UUID()
    let content: String
    
    init(content: String) {
        self.content = content
    }
}
