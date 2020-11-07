//
//  ContentView.swift
//  Game Markets
//
//  Created by Fauzi Achmad Bangsa Diria on 07/07/20.
//  Copyright © 2020 nooglersoon. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    let gradient = Gradient(colors: [Color("lightPurpleTheme"), Color("purpleTheme")])
    @ObservedObject var gameStore = ResultStore()
    @State var showSheets = false
    @State var searchText = ""
    @State var showAlert = true
    var body: some View {
        NavigationView{
            ZStack {
                RadialGradient(gradient: gradient, center: .center, startRadius: 1, endRadius: 200)
                    .edgesIgnoringSafeArea(.all)
                VStack (alignment: .leading){
//                    Heading()
                    SearchBar(text: $searchText)
                        .padding(.vertical)
                        ScrollView {

                                    ForEach(gameStore.results.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })
                                    ) { item in
                                    NavigationLink(destination: DetailListView(game: item)) {
                                        MainCard(game: item)
                                    }
                                    
                                }
                                .onAppear() {
                                    self.gameStore.fetchLatestLoans()
                                }
                    }
                }
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                         ProfileButton(showSheets: $showSheets)
                            .padding([.bottom, .trailing], 25.0)
                    }
                }
                
            }
            .sheet(isPresented: self.$showSheets) {
                    ProfileView()
            }
        .navigationBarTitle("Game Markets")
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Welcome to Game Markets!"), message: Text("Search and Enjoy :)"), dismissButton: .default(Text("Got your game!")))
        })
    }
    
    init() {

        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static let purpleTheme = Color("purpleTheme")
    static let lightPurpleTheme = Color("lightPurpleTheme")
}
