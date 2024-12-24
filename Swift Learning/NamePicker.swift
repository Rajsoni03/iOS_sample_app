//
//  NamePickerView.swift
//  Swift Learning
//
//  Created by Raj Soni on 19/12/24.
//

import SwiftUI

struct NamePickerView: View {
    @State private var names: [String] = ["Raj", "Sourabh", "Suman", "Ramphal"]
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack{
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick a Name")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
                
            
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove Picked Name", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll{ name in
                            return name == pickedName
                        }
                    }
                }
                else{
                    pickedName = "No Names Found!"
                }
            } label: {
                Text("Pick Random Name")
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .padding()
        }.padding()
    }
}

#Preview {
    NamePickerView()
}
