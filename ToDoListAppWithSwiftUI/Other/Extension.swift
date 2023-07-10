//
//  Extension.swift
//  ToDoListAppWithSwiftUI
//
//  Created by yanghj on 2023/07/10.
//

import Foundation

extension Encodable {
    /**
        Codable를 준수하는 타입을 [String: Any] 형식의 딕셔너리로 변화하는 기능
        JSON 데이터를 다른 시스템에 전송하거나 저장하기 위해 codable 타입을 딕셔너리로 변환할 수 있다.
     */
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
