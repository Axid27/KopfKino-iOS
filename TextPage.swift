//
//  TextPage.swift
//  KopfKinoApplication
//
//  Created by Pit Kaldewey on 06.02.21.
//

import SwiftUI
import Combine

struct TextPage: View {
    
    //MARK: Properties
    @ObservedObject var user : UserData
    
    
    @State var checkData = false // checkInput Var
    @State var stringCount = ""
    var body: some View {
        
        //MARK: Body

        
        ZStack {
            
            Image("KKpage3")
                .resizable()
                .scaledToFit()
            
            VStack (alignment: .center, spacing: 30) {
                
        // UserInput
                
                TextEditor(text: $user.UserInput)
                    .lineSpacing(10.0)
                    .foregroundColor(.black)
                    .opacity(1)
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 250, alignment: .center)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 5, y: 3)
                    .border(Color("GreyBlue"),width: 2)
                    .padding(.vertical, 0)
               
        // String Counter
                let strcount = user.UserInput
                Text("\(strcount.count)/250")
                    .foregroundColor(.white)
                
        // String when Input was left empty
                Text(stringCount)
                    .foregroundColor(.white)
                    
        //NAV LINK
                NavigationLink(

                    destination: LoadingPage(user: user), isActive: $checkData) { EmptyView() }
                    
        // BUTTON Create
                
                Button(action: {
                    user.UserInput = strcount
        //   Calling InputManager -->
                    if user.UserInput == ""{
                        self.user.UserInput = "Check your story"
                    }
                    if user.UserInput.count > 250 {
                        stringCount = "Too many characters"
                    }
                    else{
                        self.user.sendingData()
                        self.checkData = true
                    }
                    
                    

                    }){
                    
                    HStack (alignment: .center, spacing: 0){
                        Image("FilmReel")
                            .scaleEffect(0.7)
                        
                        Text("Create")
                            .font(.custom("DK Cinnabar Brush", size: 30))
                            .foregroundColor(.white)
                 
                        
                    } // HSTACK
                    .accentColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 0)
                    .background(Color.init("Orange").opacity(0.8))
                    .cornerRadius(10)
                    .offset(x: 0, y: 0) //PushingUp
                    .shadow(color: .black, radius: 6, x: 2, y: 2)
                }
                
            }//VSTack
            .frame(minWidth: 0, idealWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 0, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
        } // zSTACK END
        .ignoresSafeArea(.all)

    }
}

struct TextPage_Previews: PreviewProvider {
    static var user = UserData()
    static var previews: some View {
        TextPage(user: UserData())
    }
}



