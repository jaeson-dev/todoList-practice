//
//  AddView.swift
//  TodoList_tutorial
//
//  Created by Jaeson.dev on 2022/03/14.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here ...", text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background()
                    .cornerRadius(10)
                
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✏️")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed(){
        
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentaionMode.wrappedValue.dismiss()
        }
       
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3  {
            alertTitle = "세 글자 이상 입력하세요😎"
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
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
