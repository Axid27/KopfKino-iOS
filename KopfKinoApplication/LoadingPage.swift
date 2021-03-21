//
//  LoadingPage.swift
//  KopfKinoApplication
//
//  Created by Pit Kaldewey on 06.02.21.
//

import SwiftUI

struct LoadingPage: View {
    
    //MARK: Properties
//    @EnvironmentObject var user : UserData
    @ObservedObject var user : UserData
    
    
    var body: some View {
        
        //MARK: Body
        
        
        NavigationView{
            
            ZStack {
                
                Image("KKpage4")
                    .resizable()
                    .scaledToFit()
                
                            
                
            //NAV LINK
            VStack {
                
                NavigationLink(
                    destination: VideoPage(userData: user), isActive: $user.videoReady) { EmptyView()}
                
            //Lottie Animation
                LottieView(fileName: "loadingButterfly")
                   .frame(width: 250, height: 250, alignment: .center)
                
                Text(user.UserInput)
                    .font(.custom("DK Cinnabar Brush", size: 30))
                    .foregroundColor(.white)
            } // VSTACK
            .frame(minWidth: 0, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
         
                
        }//ZSTACK View
        .ignoresSafeArea()
        
            
        }// NAVstack
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
        
        
    } // BOdy
} //VIEW

struct LoadingPage_Previews: PreviewProvider {
    
    static let user = UserData()
    static var previews: some View {
        LoadingPage(user: user)
    }
}

