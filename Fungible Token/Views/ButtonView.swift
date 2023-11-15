//
//  ButtonView.swift
//  Fungible Token
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI

struct ButtonView: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.title2)
                .foregroundStyle(Color.black)
        }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color.eaPrimary)
            .cornerRadius(15)
            .buttonStyle(PlainButtonStyle())
    }
}
