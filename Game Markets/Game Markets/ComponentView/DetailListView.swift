//
//  DetailListView.swift
//  Game Markets
//
//  Created by Fauzi Achmad Bangsa Diria on 14/07/20.
//  Copyright © 2020 nooglersoon. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailListView: View {
    
    var game: Result
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [Color("lightPurpleTheme"), Color("purpleTheme")]), center: .center, startRadius: 1, endRadius: 200)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                GeometryReader{ geo in
                    VStack(spacing: 0){
                        ZStack {
                            Image(systemName: "gamecontroller" )
                                .font(.title)
                                .foregroundColor(.white)
                            WebImage(url: URL(string: "\(self.game.background_image)"))
                                                       .resizable()
                                                       .aspectRatio(contentMode: .fill)
                                                       .frame(width: geo.size.width, height: 400)
                        }
                        
                        RadialGradient(gradient: Gradient(colors: [Color("lightPurpleTheme"), Color("purpleTheme")]), center: .center, startRadius: 1, endRadius: 200)
                            
                            .overlay(
                                VStack(alignment: .center){
                                    Text("\(self.game.name)")
                                        .font(.title)
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(3)
                                        .shadow(color: .black, radius:0.5, x: 0, y: 2)
                                        .padding()
                                    
                                    Text("RAWG Reviews")
                                        .font(.headline)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .shadow(color: .black, radius:0.5, x: 0, y: 2)
                                        .padding()
                                    
                                    /*
                                     var rating_count: Int
                                     var added: Int
                                     var reviews_count: Int
                                     */
                                    VStack {
                                        HStack(alignment: .center) {
                                            HStack(alignment: .center) {
                                                Spacer()
                                                HStack(alignment: .center) {
                                                    Image(systemName: "star.fill")
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                    Text(String(format: "%.2f", self.game.rating))
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                }.frame(width:50,height: 30)
                                                    .padding(.horizontal, 30.0)
                                                HStack(alignment: .center) {
                                                    Image(systemName: "calendar")
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                    Text(self.game.released)
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                }.frame(height: 30)
                                                .padding(.horizontal, 30.0)
                                                Spacer()
                                            }
                                            .layoutPriority(100)

                                            Spacer()
                                        }
                                        .padding()
                                        
                                        HStack(alignment: .center) {
                                            HStack(alignment: .center) {
                                                Spacer()
                                                VStack(alignment: .center) {
                                                    Text("Added")
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                    Text("\(self.game.added)")
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                }.frame(height: 30)
                                                .padding(.horizontal, 30.0)
                                                VStack(alignment: .center) {
                                                    Text("Count")
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                    Text("\(self.game.reviews_count)")
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                }.frame(height: 30)
                                                
                                                VStack(alignment: .center) {
                                                    Text("Ratings")
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                    Text("\(self.game.ratings_count)")
                                                        .font(.caption)
                                                        .foregroundColor(Color(.white))
                                                }.frame(height: 30)
                                                    
                                                .padding(.horizontal, 30.0)
                                                Spacer()
                                            }

                                            Spacer()
                                        }
                                        .padding()
                                        
                                        
                                    }
                                    
                                    
                                }
                        )
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct DetailListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailListView(game: Result(name: "Grand Theft Auto V", released: "none", background_image: "image", rating: 5.0, rating_count: 100, added: 100, reviews_count: 159))
    }
}
