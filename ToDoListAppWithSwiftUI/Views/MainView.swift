//
//  ContentView.swift
//  ToDoListAppWithSwiftUI
//
//  Created by yanghj on 2023/07/10.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    /**
     @ViewBuilder은 여러개의 뷰를 단일 뷰로 래핑할수 있다.
     VStack 도 ViewBuilder 속성 래퍼로 래핑되어있다.
     그래서 VStack에 여러개의 Text, Button 등을 자동으로 수직으로 쌓인 단일 VStack 뷰가 반환된다.
     */
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("프로필", systemImage: "person.circle")
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
