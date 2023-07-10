//
//  ToDoListItemsView.swift
//  ToDoListAppWithSwiftUI
//
//  Created by yanghj on 2023/07/10.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    /**
        다른 viewModel과 다르게 여기서는 선언만 하고 init에서 객체를 생성해주는데 이유는
        리스트에서 아이템을 지울려면 userId가 필요하다 하지만 생성할때 넣어줄수 있는 방법으로 초기화 할때 매개변수를 넣어서 객체를 생성해주면 된다.
     */
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button {
                                // 삭제
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("삭제")
                            }
                            .tint(.red)

                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("할 일 목록")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "7E0VQn2qfKgbkMuBe6kVLcM0Gu92")
    }
}
