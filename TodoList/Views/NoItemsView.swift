//
//  noItemsView.swift
//  TodoList
//
//  Created by Bruna Espindola on 12/05/23.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Text("There are no items!")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(.easeIn){
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        
            NoItemsView()
        
    }
}
