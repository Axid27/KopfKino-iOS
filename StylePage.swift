//
//  StylePage.swift
//  KopfKinoApplication
//
//  Created by Pit Kaldewey on 06.02.21.
//

import SwiftUI

struct StylePage: View {
    
    //MARK: Properties
    @ObservedObject var user : UserData
    
    
    
    var body: some View {
       
        //MARK: Body
       
        
        ZStack {
            
            Image("KKpage2")
                .resizable()
                .scaledToFit()
            
            VStack {
//
//                let styleList = ["sad", "happy", "neutral"]
//
//                for i in styleList {
//                    Text("\(styleList[i])")
//                }
                
                var buttonText = user.UserStyle
                Button(action: {
                    if buttonText == "sad"{ user.UserStyle = "neutral"; buttonText = "neutral" }
                    if buttonText == "happy"{ user.UserStyle = "sad"; buttonText = "sad" }
                    if buttonText == "neutral"{ user.UserStyle = "happy"; buttonText = "happy" }
                    
                    
                }){
                    HStack (alignment: .center, spacing: 10){
                        Image("ColorPaletteBunt")
                            .scaleEffect(0.8)
                            
                        Text(buttonText)
                            .font(.custom("DK Cinnabar Brush", size: 30))
                            .foregroundColor(Color("GreyBlue"))
//                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                            .fontWeight(.bold)
                            
                    }
                } //ButtonEnd
                .accentColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(Color.init("Orange").opacity(0.8))
                .cornerRadius(10)
                .offset(x: 0, y:-45) //PushingUp
                .shadow(color: .black, radius: 6, x: 2, y: 2)
                
                
                
                Toggle(isOn: $user.UserVoice) {
                    
                    Text("Voiceover")
                        .font(.custom("DK Cinnabar Brush", size: 30))
                        .foregroundColor(Color("Orange"))
                        .offset(x: 85, y: 0)
                } //Toggle
                .offset(x: -50, y:150) //Pushing Left
                
                
                
                
                
            } // VSTACK
            .frame(minWidth: 0, idealWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 0, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
        }.edgesIgnoringSafeArea(.all)

        .navigationTitle("")
        .navigationBarHidden(true)
        
    } // MARK: BODY END
}

struct StylePage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StylePage(user: UserData())
                .preferredColorScheme(.light)
                
            StylePage(user: UserData())
            StylePage(user: UserData())
        }
    }
}
