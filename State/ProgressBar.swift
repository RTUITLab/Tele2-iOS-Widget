//
//  ProgressBar.swift
//  Tele2 Widget
//
//  Created by Ivanov on 22.08.2020.
//

import SwiftUI
import WidgetKit

struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    
    var width: Float = 15
    var fontSize: Float = 10
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(
                    lineWidth: CGFloat(self.width),
                    lineCap: .round,
                    lineJoin: .round
                ))
                .foregroundColor(Color.gray)
                
                //            .frame(width: 250, height: 250)
                .overlay(
                    Circle().trim(from:0, to: progress())
                        .stroke(style: StrokeStyle(
                            lineWidth: CGFloat(self.width),
                            lineCap: .round,
                            lineJoin: .round
                        ))
                        .foregroundColor(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
                        .animation(.easeInOut(duration: 0.2))
                        .rotationEffect(Angle(degrees: -90))
                )
            Text("\(counter)")
                .foregroundColor(.white)
                .font(.system(size: CGFloat(self.fontSize)))
                .allowsTightening(true)
        }
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(counter: 5, countTo: 100)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
}
