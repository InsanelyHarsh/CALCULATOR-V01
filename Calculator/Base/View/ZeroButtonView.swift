//
//  ZeroButtonView.swift
//  Calculator
//
//  Created by Harsh Yadav on 21/08/21.
//

import SwiftUI

struct ZeroButtonView: View {
    let FontColor:Color
    let OuterColor:Color
    let InnerColor:Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 156, height: 79, alignment: .center)
                .foregroundColor(InnerColor)
                Text("0")
                    .font(.system(size: 55))
                    .foregroundColor(FontColor)
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(OuterColor, lineWidth: 5)
                .frame(width: 160, height: 80, alignment: .center)
            
                
        }

    }
}

struct ZeroButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZeroButtonView(FontColor: .black, OuterColor: .pink, InnerColor: .gray)
            .Preview(with: "firstStyle")
    }
}
