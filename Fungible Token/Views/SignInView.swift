//
//  SignInView.swift
//  Fungible Token
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI
import FCL

struct SignInView: View {
    var body: some View {
        VStack {
            Text("Fungible Token")
                .font(.largeTitle)
                .padding(.bottom, 5)
            
            Text("A DApp that lets users create their own fungible token and transfer them to another account on Flow testnet.")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            
            Image("ea-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 100)
            
            ButtonView(title: "Connect Wallet") {
                fcl.openDiscovery()
            }
        }
    }
}
