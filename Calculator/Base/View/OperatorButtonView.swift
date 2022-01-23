//
//  OperatorButtonView.swift
//  Calculator
//
//  Created by Harsh Yadav on 21/08/21.
//

import SwiftUI

struct OperatorButtonView: View {
    let operatorName:String
    let OuterRingColor:Color
    let InnerRingColor:Color
    let FontColor:Color
    let shadowcolor:Color
    let shadowRadius:CGFloat
    let shadowX:CGFloat
    let ShadowY:CGFloat
    let FontSize:CGFloat
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 80, height: 80, alignment: .center)
                .foregroundColor(OuterRingColor)
                .shadow(color: shadowcolor, radius: shadowRadius, x: shadowX, y: ShadowY)
                .overlay(
                    Circle()
                        .frame(width: 70, height: 70, alignment: .center)
                        .foregroundColor(InnerRingColor)
                )
            Text(operatorName)
                .font(.system(size: FontSize))
                .font(.headline)
                .foregroundColor(FontColor)
            
        }


    }
}

struct OperatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OperatorButtonView(operatorName: "%", OuterRingColor: .orange, InnerRingColor: .white, FontColor: .black, shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 55)
                .Preview(with: "first")
            
            OperatorButtonView(operatorName: "+", OuterRingColor: .pink, InnerRingColor: .white, FontColor: .black, shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 55)
                .Preview(with: "second")
        }
    }
}
