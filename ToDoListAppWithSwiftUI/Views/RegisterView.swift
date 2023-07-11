//
//  RegisterView.swift
//  ToDoListAppWithSwiftUI
//
//  Created by yanghj on 2023/07/10.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
     
    var body: some View {
        ScrollView {
            VStack {
                HeaderView(
                    title: "회원가입",
                    subTitle: "이제 할 일 들을 정리해보세요.",
                    angle: -15,
                    background: Color.yellow)
                
                VStack {
                    TextField("이름", text: $viewModel.name)
                        .font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding(.bottom, 10)
                    
                    TextField("Email 주소", text: $viewModel.email)
                        .font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding(.bottom, 10)
                    
                    SecureField("비밀번호", text: $viewModel.password)
                        .font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(0)
                    
                    TLButton(title: "계정 생성", background: .green) {
                        viewModel.register()
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                    .padding(20)
                }
                .offset(y: -50)
                
                Spacer()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
