//
//  Fungible_TokenApp.swift
//  Fungible Token
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI
import FCL
import Flow
import ecDAO

@main
struct Fungible_TokenApp: App {
    private let testAccount = "YOUR TEST ACCOUNT"
    
    init() {
        let defaultProvider: FCL.Provider = .devWallet
        let defaultNetwork: Flow.ChainID = .emulator
        let accountProof = FCL.Metadata.AccountProofConfig(appIdentifier: "Fungible Token")
        let metadata = FCL.Metadata(appName: "Fungible Token",
                                    appDescription: "Fungible Token Demo App for Emerald Academy",
                                    appIcon: URL(string: "https://academy.ecdao.org/ea-logo.png")!,
                                    location: URL(string: "https://academy.ecdao.org/")!,
                                    accountProof: accountProof)
        fcl.config(metadata: metadata,
                   env: defaultNetwork,
                   provider: defaultProvider)

        fcl.config
            .put("0xDeployer", value: fcl.currentEnv == .emulator ? "0xf8d6e0586b0a20c7" : testAccount)
            .put("0xStandard", value: fcl.currentEnv == .emulator ? "0xf8d6e0586b0a20c7" : "0x631e88ae7f1d7c20")
        
        ecDAOinit()
    }
    
    var body: some Scene {
        WindowGroup {
            RouterView()
        }
    }
}
