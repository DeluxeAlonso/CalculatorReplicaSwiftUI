//
//  CalculatorView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var env: CalculatorEnvironmentObject
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                CalculatorResultDisplayView()
                CalculatorButtonsView()
            }.padding(.bottom)
        }
    }
    
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView().environmentObject(DependencyInjectionFactory.createCalculatorEnvironmentObject())
    }
}
