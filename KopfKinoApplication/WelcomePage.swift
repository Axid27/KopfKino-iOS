//
//  WelcomePage.swift
//  KopfKinoApplication
//
//  Created by Pit Kaldewey on 06.02.21.
//

import SwiftUI

struct WelcomePage: View {
    //MARK: Properties
    
    
    
    var body: some View {
        
        //MARK: Body
        
        ZStack {
            
            Image("KKpage1")
                .resizable()
                .scaledToFit()
                .animation(Animation.easeOut(duration: 0.6).delay(0.1))
            
            VStack{
                Text("KopfKino® will visualize your story or idea just by words. Only follow these 2 simple steps...")
//                    .font(.custom("DK Cinnabar Brush", size: 18))
                    .foregroundColor(Color.black)
                    .fontWeight(.heavy)
                    .font(.title2)
                    .lineSpacing(10)
                    .multilineTextAlignment(.center)
                    .frame(width: 350, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 0)
        
                
            } //Vstack
            .frame(minWidth: 0, idealWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 0, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }//ZSTACK
        .edgesIgnoringSafeArea(.all)
    }
        
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
