//
//  Fungible_TokenApp.swift
//  Fungible Token
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI

@main
struct Fungible_TokenApp: App {
    
    init() {
        FlowManager.shared.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            RouterView()
        }
    }
}
