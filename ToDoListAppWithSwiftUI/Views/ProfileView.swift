//
//  ProFileView.swift
//  ToDoListAppWithSwiftUI
//
//  Created by yanghj on 2023/07/10.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    init() {
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("프로필 로딩중...")
                }
            }
            .navigationTitle("프로필")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 125, height: 125)
                .padding()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("이름: ")
                        .bold()
                    Text(user.name)
                }
                .padding()
                HStack {
                    Text("이메일: ")
                        .bold()
                    Text(user.email)
                }
                .padding()
                HStack {
                    Text("가입일: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated,time: .shortened))")
                }
                .padding()
            }
            .padding()
            
            Button {
                viewModel.logOut()
            } label: {
                Text("로그아웃")
            }
            .tint(.red)
            .padding()

            Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
