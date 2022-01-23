//
//  PreviewLayoutComponentModifier.swift
//  Calculator
//
//  Created by Harsh Yadav on 21/08/21.
//

import Foundation
import SwiftUI

struct PreviewLayoutComponentModifier:ViewModifier{
    let Name:String
    func body(content: Content) -> some View {
        content
            .previewLayout(.sizeThatFits)
            .previewDisplayName(Name)
            .padding()
    }
}

extension View{
    func Preview(with Name:String) -> some View{
        self.modifier(PreviewLayoutComponentModifier(Name: Name))
    }
}
