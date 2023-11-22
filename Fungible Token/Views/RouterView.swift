//
//  RouterView.swift
//  Fungible Token
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI
import FCL
import FlowComponents
import ecDAO

struct RouterView: View {
    @State var loggedIn: Bool = false
    @State var pendingTx: Bool = false
    @State var showErrorView: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            Group {
                if !loggedIn {
                    SignInView()
                } else {
                    MainView()
                }
            }
            .padding(.horizontal, 20)
            
            if pendingTx {
                TransactionView()
            }
        }
        .sheet(isPresented: $showErrorView, onDismiss: { flowManager.txError = nil }, content: {
            ErrorView(error: flowManager.txError ?? "")
        })
        .onReceive(fcl.$currentUser) { user in
            self.loggedIn = (user != nil)
        }
        .onReceive(flowManager.$pendingTx) { tx in
            self.pendingTx = (tx != nil)
        }
        .onReceive(flowManager.$txError) { error in
            self.showErrorView = (error != nil)
        }
    }
}

#Preview {
    RouterView()
}
