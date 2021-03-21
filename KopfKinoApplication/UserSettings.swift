//
//  UserSettings.swift
//  KopfKinoApplication
//
//  Created by Pit Kaldewey on 06.02.21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire
import Photos
import AssetsLibrary

class UserData : ObservableObject {

   
    
    @Published var UserInput : String = "Write here"
    @Published var UserStyle : String = "neutral"
    @Published var UserVoice : Bool = false    
    
    @Published var link: String = ""
    @Published var videoReady = false
    
    var task:  URLSessionTask? = nil
    
    var count = 0
}

extension UserData{
  
    
    func sendingData(){
    
        guard let url = URL(string: "https://kopfkino-app.herokuapp.com/create/") else { return }

    let body = [
        "user_input": UserInput,
            "style" : "neutral",
            "voiceover" : String(UserVoice)
        ]

        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                    print("Error took place \(error)")
                return }

            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                
                DispatchQueue.main.async {
                    self.link = dataString
                    print("Sending Data was successfull")
                    print(self.link)
                    
                    self.checkUrl()
                    //if let httpresponse = response as? HTTPURLResponse{
                    //    if [200,201, 202, 203].contains(httpresponse.statusCode) {
                    //        self.videoReady = true
                    //    }
                    //}
                } //DispatchQueue
                
                }
            
        }.resume()      //URLSessionEND
    } //Func End
    
    func checkUrl() {
        
        guard let url = URL(string: link) else { return }
        
        var request = URLRequest(url: url)
        request.method = .get
        request.timeoutInterval = 30

        AF.request(request).responseJSON { (response: DataResponse<Any, AFError>) in
            
            if [200,201, 202, 203].contains(response.response?.statusCode) {
                self.videoReady = true
            }
            else {
                print("count: \(self.count), code: \(response.response?.statusCode ?? -1)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.checkUrl()
                }
            }
        }
    } // MARK: CheckUrl End
    
    func requestAuthorization(completion: @escaping ()->Void) {
            if PHPhotoLibrary.authorizationStatus() == .notDetermined {
                PHPhotoLibrary.requestAuthorization { (status) in
                    DispatchQueue.main.async {
                        completion()
                    }
                }
            } else if PHPhotoLibrary.authorizationStatus() == .authorized{
                completion()
            }
        }



    func saveVideoToAlbum(_ outputURL: URL, _ completion: ((Error?) -> Void)?) {
            requestAuthorization {
                PHPhotoLibrary.shared().performChanges({
                    let request = PHAssetCreationRequest.forAsset()
                    request.addResource(with: .video, fileURL: outputURL, options: nil)
                }) { (result, error) in
                    DispatchQueue.main.async {
                        if let error = error {
                            print(error.localizedDescription)
                        } else {
                            print("Saved successfully")
                        }
                        completion?(error)
                    }
                }
            }
        }
    
} //EndExtension

