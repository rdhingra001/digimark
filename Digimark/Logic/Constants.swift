//
//  Constants.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/23/22.
//

import Foundation
import SwiftUI

class Constants: NSObject {
    
    static func getGrey(scheme: ColorScheme) -> Color {
        let lightGrey = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
        let darkGrey = Color(red: 80.0/255.0, green: 80.0/255.0, blue: 80.0/255.0, opacity: 1.0)
        
        return scheme == .dark ? darkGrey : lightGrey
    }
    
    static func getGreyInvert(scheme: ColorScheme) -> Color {
        let lightGrey = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
        let darkGrey = Color(red: 80.0/255.0, green: 80.0/255.0, blue: 80.0/255.0, opacity: 1.0)
        
        return scheme == .light ? darkGrey : lightGrey
    }
}
