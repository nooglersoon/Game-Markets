//
//  ProfileView.swift
//  Game Markets
//
//  Created by Fauzi Achmad Bangsa Diria on 09/07/20.
//  Copyright © 2020 nooglersoon. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    let gradient = Gradient(colors: [Color("lightPurpleTheme"), Color("purpleTheme")])
    
    var body: some View {
        
        ZStack{
            RadialGradient(gradient: gradient, center: .center, startRadius: 1, endRadius: 200)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                Text("""
Hello,
Nice to Meet You!
""")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                Image("fauziabd")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 300, height: 300)
                Text("I'm Fauzi Achmad Bangsa Diria")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("reach me at fachmadb@gmail.com")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("redTheme"))
                    .multilineTextAlignment(.center)
                Text("see my portfolio at: github.com/nooglersoon")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer()
                } .padding()
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
