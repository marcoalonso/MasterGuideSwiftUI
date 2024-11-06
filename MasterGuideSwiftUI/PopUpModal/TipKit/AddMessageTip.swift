//
//  AddMessageTip.swift
//  MasterGuideSwiftUI
//
//  Created by Marco Rodriguez on 06/11/24.
//

import Foundation
import TipKit

struct AddMessageTip: Tip {
    var title: Text {
        Text("Click here")
            .foregroundStyle(.teal)
    }
    
    var message: Text? {
        Text("Drag and drop to ajust height")
    }
    
    var image: Image? {
        Image(systemName: "hand.tap.fill")
    }
}

struct SearchTip: Tip {
    var title: Text {
        Text("Click here")
    }
    
    var message: Text? {
        Text("To search any topic of your interest")
    }
    
    var image: Image? {
        Image(systemName: "exclamationmark.magnifyingglass")
    }
    
    
}
