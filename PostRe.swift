//
//  PostRe.swift
//  KopfKinoApplication
//
//  Created by Pit Kaldewey on 07.02.21.
//

//import SwiftUI
//
//class Anfrage: ObservableObject{
//
//    //MARK: Properties
////    @ObservedObject var user = UserData()
////    @EnvironmentObject var user : UserData
//
//    @Published var link: String = ""
//
//
//    func sendingData(){
//
//        guard let url = URL(string: "https://kopfkino-app.herokuapp.com/create/") else { return }
//
//    let body = [
//        "user_input": user.UserInput,
//            "style" : "neutral",
//            "voiceover" : "False"
//        ]
//
//        let finalBody = try? JSONSerialization.data(withJSONObject: body)
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = finalBody
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//            if let error = error {
//                    print("Error took place \(error)")
//                return }
//
//            if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                    print("Response data string:\n \(dataString)")
//
//                DispatchQueue.main.async {
//                    self.link = dataString
//                    print("Sending Data was successfull")
//                    print(self.link)
//                } //DispatchQueue
//
//                }
//
//        }.resume()      //URLSessionEND
//    } //Func End
//
//} //Class End
