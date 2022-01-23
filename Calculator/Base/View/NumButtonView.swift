//
//  NumButtonView.swift
//  Calculator
//
//  Created by Harsh Yadav on 21/08/21.
//

import SwiftUI

struct NumButtonView: View {
    let Num:String
    let shadowcolor:Color
    let shadowRadius:CGFloat
    let shadowX:CGFloat
    let ShadowY:CGFloat
    let NumFontColor:Color
    let BGcolor:Color
    var body: some View {
        Circle()
            .frame(width: 80, height: 80)
            .shadow(color: shadowcolor, radius: shadowRadius, x: shadowX, y: ShadowY)
            .overlay(
                Text(Num)
                    .font(.system(size: 45))
                    .font(.headline)
                    .foregroundColor(NumFontColor)
            )
            .foregroundColor(BGcolor)
        
        
        
    }
}

struct NumButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumButtonView(Num: "1", shadowcolor: .white, shadowRadius: 6, shadowX: 0, ShadowY: 3, NumFontColor: .white, BGcolor: .black)
                .Preview(with: "Number")
            
            //            NumButtonView(Num: 2)
            //                .previewLayout(.sizeThatFits)
        }
        .previewDevice("iPhone 12 Pro")
    }
}
