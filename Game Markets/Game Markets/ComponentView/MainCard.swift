//
//  MainCard.swift
//  Game Markets
//
//  Created by Fauzi Achmad Bangsa Diria on 07/07/20.
//  Copyright © 2020 nooglersoon. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI


struct MainCard: View {
    var game: Result
    let url: String = ""
    var body: some View {
        
        VStack {
            ZStack {
                Image(systemName: "gamecontroller" )
                    .font(.title)
                    .foregroundColor(.white)
                WebImage(url: URL(string: "\(game.background_image)"))
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        VStack{
                            Spacer()
                            Text(game.name)
                                .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .shadow(color: .black, radius:0.5, x: 0, y: 2)
                        }.padding()
                        
                )
            }

            HStack {
                HStack(alignment: .center) {
                    HStack(alignment: .center) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(Color(.yellow))
                        Text(String(format: "%.2f", game.rating))
                            .font(.caption)
                            .foregroundColor(Color(.white))
                    }.frame(height: 30)
                    Spacer()
                    HStack(alignment: .center) {
                        Image(systemName: "calendar")
                            .font(.caption)
                            .foregroundColor(Color(.white))
                        Text(game.released)
                            .font(.caption)
                            .foregroundColor(Color(.white))
                    }.frame(height: 30)
                }
                .layoutPriority(100)

                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 0.2), lineWidth: 1)
            }
            
        )
        .padding([.top, .horizontal])
        
        }
        
    // load images from URL
    
    
    }

struct MainCard_Previews: PreviewProvider {
    static var previews: some View {
        MainCard(game: Result(name: "GTA V", released: "10-05-2020", background_image: "image", rating: 4.45, rating_count: 57, added: 100, reviews_count: 150))
    }
}

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                    
                }
               
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.endEditing()
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
