//
//  ProgressBarHorizontal.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 22.08.2020.
//

import SwiftUI

struct ProgressBarHorizontal: View {
    var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
                    .animation(.linear)
            }.cornerRadius(5.0)
        }
    }
}

struct ProgressBarHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarHorizontal(value: 0.1).frame(height:5)
    }
}
