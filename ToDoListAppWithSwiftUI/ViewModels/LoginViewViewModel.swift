//
//  LoginViewViewModel.swift
//  ToDoListAppWithSwiftUI
//
//  Created by yanghj on 2023/07/10.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        /**
         .trimmingCharacters(in: .whitespaces).isEmpty 는 문자열 앞뒤에 공백 문자를 제거하는 메서드
         */
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "아이디, 비밀번호를 입력해주세요."
            return false
        }
        
        // 이메일 형식인지 비교
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "이메일 형식이 아닙니다."
            return false
        }
        
        return true
    }
}
