//
//  MainView.swift
//  Fungible Token
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI
import FCL

struct MainView: View {
    
    var body: some View {
        VStack {
            HeaderView()
            
            ScrollView {
                setupVaultView()
                
                mintTokensView()
                
                getBalanceView()
                
                yourVaultView()
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 6) {
            Image("ea-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
            Text("Emerald Academy")
                .font(.title)
                .foregroundStyle(Color.eaPrimary)
            
            Button {
                Task {
                    try await fcl.unauthenticate()
                }
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .foregroundStyle(Color.black)
                    .padding(10)
            }
            .background(Color.eaPrimary)
            .cornerRadius(15)
            .padding(10)
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    MainView()
}

struct setupVaultView: View {
    var body: some View {
        GroupBox(label: Text("1. Setup Your Vault"), content: {
            VStack {
                Text("In order to receive tokens you must first setup a vault.")
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Button(action: {}, label: {
                    HStack(spacing: 0) {
                        Image(systemName: "chevron.left.slash.chevron.right")
                            .font(.body)
                        Text("View Transaction")
                    }
                })
                .foregroundStyle(.eaPrimary)
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, 3)
                
                ButtonView(title: "Setup Vault") {
                    //TODO
                }
            }
        })
    }
}

struct mintTokensView: View {
    var body: some View {
        GroupBox(label: Text("2. Mint Tokens to Your Account"), content: {
            Text("Time to go back to your terminal! Look for the scripts directory and execute the mint function.")
                .multilineTextAlignment(.center)
                .padding(.vertical)
        })
    }
}

struct getBalanceView: View {
    var body: some View {
        GroupBox(label: Text("3. Get Balance"), content: {
            VStack {
                Text("Now, we are going to run a script to get the tokens stored in your vault.")
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Button(action: {}, label: {
                    HStack(spacing: 0) {
                        Image(systemName: "chevron.left.slash.chevron.right")
                            .font(.body)
                        Text("View Script")
                    }
                })
                .foregroundStyle(.eaPrimary)
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, 3)
                
                ButtonView(title: "Get Balance") {
                    //TODO
                }
            }
        })
    }
}

struct yourVaultView: View {
    var body: some View {
        GroupBox(label: Text("4. Your Vault"), content: {
            VStack {
                Text("Bellow, you can see your token balance. Feel free to transfer them other wallets!")
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Button(action: {}, label: {
                    HStack(spacing: 0) {
                        Image(systemName: "chevron.left.slash.chevron.right")
                            .font(.body)
                        Text("View Script")
                    }
                })
                .foregroundStyle(.eaPrimary)
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, 3)
                
                ButtonView(title: "Get Balance") {
                    //TODO
                }
            }
        })
    }
}
