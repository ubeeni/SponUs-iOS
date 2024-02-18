//
//  ProfileVIew.swift
//  Spon-us
//
//  Created by 황인성 on 2024/01/16.
//

import SwiftUI

struct ProfileView: View {
    @Binding var rootIsActive: Bool
    var organizationId: Int
    @ObservedObject var organizationViewModel: OrganizationViewModel = OrganizationViewModel()
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView {

                    Image("TestImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 540)
                        .padding(.bottom, 40)

                VStack(alignment: .leading, spacing: 16){
                    
                    Text(organizationViewModel.organization?.name ?? "안불러와짐.")
                        .font(.Heading09)
                    
                    SponUsDivider()
                        .padding(.bottom, 8)
                    
                    Text(organizationViewModel.organization?.description ?? "안불러와짐.")
                        .multilineTextAlignment(.leading)
                        .font(.Body10)
                      .foregroundColor(Color.sponusGrey800)
                      .padding(.trailing, 20)
                      .padding(.bottom, 24)
                    
                    Text("기업 정보")
                        .font(.Heading09)
                    
                    SponUsDivider()
                        .padding(.bottom, 8)
                    
                    ProfileSNSView()
                    .padding(.bottom, 24)
                    
                    Text("활동 기록")
                        .font(.Heading09)
                    
                    SponUsDivider()
                        .padding(.bottom, 8)
                    
                    ProfileHistoryCell(stateMessage: "게시 중 공고")
                    .padding(.bottom, 4)
                    
                    ProfileHistoryCell(stateMessage: "진행 중 공고")
                    .padding(.bottom, 4)
                    
                    ProfileHistoryCell(stateMessage: "완료된 공고")
                    
                    
                }
                .foregroundColor(Color.sponusBlack)
                .padding(.leading, 40)
            }
            
        }
        .onAppear(){
            organizationViewModel.fetchOrganization(organizationId: organizationId)
        }
        .navigationTitle("프로필").font(.Body01)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarBackground()
        .navigationBarItems(leading: CustomBackButton(), trailing: Button(action: {self.rootIsActive = false}, label: {
            Image(.icHome)
                .renderingMode(.template)
                .foregroundStyle(.black)
        }))
    }
    
    
    
}

struct ProfileSNSView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            Button(action: {
                openInstagram() //인스타주소 수정해야됨
            }, label: {
                HStack(spacing: 13) {
                    Text("Instagram")
                        .font(.English08)
                    .foregroundColor(Color.sponusGrey800)
                    
                    Image("ic_link")
                }
            })

          
            Button(action: {
                openDefaultApp()
            }, label: {
                HStack(spacing: 13) {
                    Text("musinsa.com")
                        .font(.English08)
                    .foregroundColor(Color.sponusGrey800)
                    
                    Image("ic_link")
                }
            })
            
            
            Button(action: {
                openFacebook()
            }, label: {
                HStack(spacing: 13) {
                    Text("facebook")
                        .font(.English08)
                    .foregroundColor(Color.sponusGrey800)
                    
                    Image("ic_link")
                }
            })
        }
    }
    
    
    func openInstagram() {
            let instagramUrl = URL(string: "instagram://user?username=inseong53")!
            if UIApplication.shared.canOpenURL(instagramUrl) {
                UIApplication.shared.open(instagramUrl, options: [:], completionHandler: nil)
            } else {
                // Instagram 앱이 설치되어 있지 않을 경우, 웹사이트를 열 수 있습니다.
                let webUrl = URL(string: "https://www.instagram.com/inseong53/")!
                UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
            }
        }
    
    func openDefaultApp() {
            guard let url = URL(string: "http://www.musinsa.com") else {
                return
            }

            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    
    func openFacebook() {
            let facebookUrl = URL(string: "facebook://")!
            if UIApplication.shared.canOpenURL(facebookUrl) {
                UIApplication.shared.open(facebookUrl, options: [:], completionHandler: nil)
            } else {
                // Instagram 앱이 설치되어 있지 않을 경우, 웹사이트를 열 수 있습니다.
                let webUrl = URL(string: "https://www.facebook.com/")!
                UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
            }
        }
}


struct ProfileHistoryCell: View {
    
    var stateMessage: String
    
    var body: some View {
        HStack {
            Text(stateMessage)
                .font(.Body06)
            .foregroundColor(Color.sponusGrey800)
            
            Spacer()
            
            Text("1건")
                .font(.English07)
              .foregroundColor(Color.sponusPrimary)
        }
        .frame(width: 133)
    }
}

//#Preview {
//    ProfileView(rootIsActive: .constant(false))
//}
