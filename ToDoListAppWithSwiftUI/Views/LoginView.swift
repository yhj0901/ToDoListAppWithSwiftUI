//
//  LoginView.swift
//  ToDoListAppWithSwiftUI
//
//  Created by yanghj on 2023/07/10.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Header
                    HeaderView(
                        title: "할 일 목록",
                        subTitle: "일을 끝내다",
                        angle: 15,
                        background: Color.green)
                    
                    // Login form
                    VStack {
                        
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.red)
                        }
                        
                        TextField("Email", text: $viewModel.email)
                            .font(.system(size: 20))
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .padding(.bottom, 10)
            
                        SecureField("Password", text: $viewModel.password)
                            .font(.system(size: 20))
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(0)
                        
                        TLButton(
                            title: "로그인",
                            background: .blue
                        ) {
                            viewModel.login()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                        .padding(20)
                        
                    }
                    .offset(y: -50)
                    .padding(.bottom, 100)
                    
                    
                    // Create Account
                    VStack {
                        Text("여기에 새로 오셨나요?")
                        NavigationLink("계정을 생성하다",
                                       destination: RegisterView())
                    }
                    .padding(.top, 80)
                    
                    Spacer()
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
