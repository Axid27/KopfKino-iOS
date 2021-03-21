//
//  VideoPage.swift
//  KopfKinoApplication
//
//  Created by Pit Kaldewey on 06.02.21.
//

import SwiftUI
import AVKit

struct VideoPage: View {
    
    //MARK: Properties
    
    @ObservedObject var userData : UserData
    
    @State var homeButton = false
    
    var body: some View {
        
    //MARK: Body
        
        NavigationView{
        
            ZStack{
                
            LinearGradient(gradient: Gradient(colors: [Color("LightBlue"), Color("SeaBlue")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
                VStack (alignment: .center, spacing: 50){
                    Text("Your Video:")
                        .font(.custom("DK Cinnabar Brush", size: 50))
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Orange"))
                        .shadow(color: .black, radius: 5, x: 3, y: 2)
        
        //Player
        player(UserData: userData).frame(height: UIScreen.main.bounds.height / 2 )
            .frame(width: UIScreen.main.bounds.width / 1.64, height: UIScreen.main.bounds.height / 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
            .shadow(color: .black, radius: 5, x: 3, y: 2)
       
        
                    
                        Button(action: {
                            
                           //downloader()
                            let urll = "https://kopfkino-app.herokuapp.com/dl/test.mp4"
                            let url = URL(string: urll)
                            self.userData.saveVideoToAlbum(url!/* pass your final url to save */) { (error) in
                                                    //Do what you want
                                                }
                            }){
                            
                            HStack (alignment: .center, spacing: 10){
                                Image(systemName: "square.and.arrow.down")
                                    .scaleEffect(1.5)
                                
                                Text("Download")
                                    .font(.custom("DK Cinnabar Brush", size: 30))
                                    .foregroundColor(.white)
        //                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        //                            .fontWeight(.bold)
                                    
                            }
                        }
                        .accentColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(Color.init("Orange").opacity(0.8))
                        .cornerRadius(10)
                        .offset(x: 0, y: 0) //PushingUp
                        .shadow(color: .black, radius: 6, x: 2, y: 2)
                        
                    //NAV LINK
                    NavigationLink(

                        destination: ContentView(user: userData), isActive: $homeButton) { EmptyView() }
                    
                    
                    Button(action: {
                        self.homeButton = true
                       //downloader()
                     
                        }){
                       
                        Text("Creating a different story")
                            .font(.custom("DK Cinnabar Brush", size: 20))
                            .foregroundColor(.white)
                    } // HomeButton End
                    
                } //VSTACK
        
        }//ZSTACKEnd
            .edgesIgnoringSafeArea(.all)
        
        }//NAVVIEW
        .navigationTitle("")
        .navigationBarHidden(true)
    } //BODY
}


struct VideoPage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPage(userData: UserData())
    }
}





//MARK: PlayerStruct

struct player: UIViewControllerRepresentable {
    
    @ObservedObject var UserData : UserData
    
    func  makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        
        
        let controller = AVPlayerViewController()
//     let url = "https://kopfkino-app.herokuapp.com/dl/test.mp4"
        let url = "\(UserData.link)"
        print(UserData.link)
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        controller.player?.play()
        return controller
    }
        func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
    }
}
