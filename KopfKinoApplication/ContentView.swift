//
//  ContentView.swift
//  KopfKinoApplication
//
//  Created by Pit Kaldewey on 06.02.21.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    
    @StateObject var user = UserData()
    
    var body: some View {
//        let user = UserData()
        //MARK: BODY

        
        NavigationView{
        TabView{
         
            WelcomePage()
            StylePage(user: user)
            TextPage(user: user)

            } //Tabview
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarHidden(true)
        } //:NAvView
        
        
        
       
       
        
        
        
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static let user = UserData()
    static var previews: some View {
        ContentView()
            
    }
}
