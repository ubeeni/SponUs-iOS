//
//  MyAnnouncementsViewModel.swift
//  Spon-us
//
//  Created by 박현수 on 2/14/24.
//

import Foundation
import Moya

class MyAnnouncementsViewModel: ObservableObject {
    @Published var category: String?
    @Published var type: String?
    @Published var isLoading = false
    @Published var myAnnouncementsContents: [MyAnnouncementsContent] = []
    
    let provider = MoyaProvider<SponusAPI>(plugins: [NetworkLoggerPlugin()])
    
    func ChangeAnnouncementStatus(announcementID: Int, completion: @escaping (Bool) -> Void) {
        provider.request(.patchChangeAnnouncementStatus(announcementID: announcementID, status: "CLOSED")) { result in
            switch result {
            case let .success(response):
                do {
                    if response.statusCode == 200 {
                        let responseModel = try response.map(ChangeAnnouncementStatusModel200.self)
                        print(responseModel)
                        completion(true)
                    }
                    else {
                        let responseModel = try response.map(ChangeAnnouncementStatusModel400.self)
                        print(responseModel)
                        completion(false)
                    }
                } catch {
                    print("Error parsing response: \(error)")
                    completion(false)
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
                completion(false)
            }
        }
    }
    
    
    func getMyAnnouncements() {
        self.isLoading = true
        provider.request(.getMyAnnouncements) { result in
            switch result {
            case .success(let response):
                print(response.statusCode)
//                if response.data.isEmpty {
//                    renewToken()
//                }
                print(response.data)
                if let jsonString = String(data: response.data, encoding: .utf8) {
                    print("서버 응답 JSON 데이터: \(jsonString)")
                }
                do {
                    let myAnnouncements = try JSONDecoder().decode(MyAnnouncementsModel.self, from: response.data)
                    DispatchQueue.main.async {
                        self.myAnnouncementsContents = myAnnouncements.content
                        self.isLoading = false
                        print(self.myAnnouncementsContents)
                    }
                } catch {
                    print("JSON 디코딩 오류: \(error)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
