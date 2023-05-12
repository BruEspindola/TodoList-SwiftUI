//
//  AddView.swift
//  TodoList
//
//  Created by Bruna Espindola on 12/05/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            TextField("Type something here...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
            Button(action: handleSave,
            label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
        }
        .padding(14)
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func handleSave(){
        if textIsAppropiate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropiate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be ate least 3 characters long! 🫨"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
