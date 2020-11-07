//
//  GameDetailView.swift
//  Game Markets
//
//  Created by Fauzi Achmad Bangsa Diria on 08/07/20.
//  Copyright © 2020 nooglersoon. All rights reserved.
//

import SwiftUI

struct TitleSearchBar: View {
    var body: some View {
        Text("Market Search")
            .foregroundColor(.white)
    }
}

struct GameDetailView: View {
    @ObservedObject var gameStore = ResultStore()
    @State var searchText = ""
    var body: some View {
        
        NavigationView {
            ZStack{
                Color("purpleTheme")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    SearchBar(text: $searchText)
                        .padding(.vertical)
                    List(gameStore.results.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })
                    ){ item in
                        
                        NavigationLink(destination: DetailListView(game: item)) {
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        
                    } .onAppear() {
                        self.gameStore.fetchLatestLoans()
                    }
                }
            }
            .navigationBarTitle(Text("Market Search"))
            
        }
    }
    
    init() {
        UITableView.appearance().separatorStyle = .singleLine
        UITableViewCell.appearance().backgroundColor = UIColor(red: 24, green: 30, blue: 96)
        UITableView.appearance().backgroundColor = UIColor(red: 24, green: 30, blue: 96)
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView()
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
