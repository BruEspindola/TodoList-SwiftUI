//
//  ListRowView.swift
//  TodoList
//
//  Created by Bruna Espindola on 12/05/23.
//

import SwiftUI


struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isComplete ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplete ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First", isComplete: false)
    static var item2 = ItemModel(title: "Second", isComplete: true)
    
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
