//
//  SearchButtonView.swift
//  Game Markets
//
//  Created by Fauzi Achmad Bangsa Diria on 09/07/20.
//  Copyright © 2020 nooglersoon. All rights reserved.
//

import SwiftUI

struct ProfileButton: View {
    @Binding var showSheets: Bool
    
    var body: some View {
        Button (action: {
            self.showSheets = true
        }) {
            Image(systemName:"person.crop.circle")
                .resizable()
                
                .foregroundColor(.white)
                .frame(width: 50 , height: 50)
                .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.15), radius: 0.001, x: 2, y: 3.5)
        }
    }
}
