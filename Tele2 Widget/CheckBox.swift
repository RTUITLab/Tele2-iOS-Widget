//
//  CheckBox.swift
//  Tele2 Widget
//
//  Created by Ivanov on 23.08.2020.
//

import SwiftUI

//MARK:- Checkbox Field
struct CheckboxField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int
    let callback: (String, Bool)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 10,
        color: Color = Color.black,
        textSize: Int = 14,
        callback: @escaping (String, Bool)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.callback = callback
    }
    
    @State var isMarked:Bool = false
    
    var body: some View {
        Button(action:{
            self.isMarked.toggle()
            self.callback(self.id, self.isMarked)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: size))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}

enum Gender: String {
    case male
    case female
}

struct CheckBox: View {
    var body: some View {
            HStack{
                Text("Gender")
                    .font(Font.headline)
                VStack {
                    CheckboxField(
                        id: Gender.male.rawValue,
                        label: Gender.male.rawValue,
                        size: 14,
                        textSize: 14,
                        callback: checkboxSelected
                    )
                    CheckboxField(
                        id: Gender.female.rawValue,
                        label: Gender.female.rawValue,
                        size: 14,
                        textSize: 14,
                        callback: checkboxSelected
                    )
                }
            }
            .padding()
        }
        
        func checkboxSelected(id: String, isMarked: Bool) {
            print("\(id) is marked: \(isMarked)")
        }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox()
    }
}
