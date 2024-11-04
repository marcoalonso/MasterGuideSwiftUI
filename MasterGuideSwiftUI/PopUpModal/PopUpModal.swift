//
//  PopUpModal.swift
//  MasterGuideSwiftUI
//
//  Created by Marco Alonso on 03/10/24.
//

import SwiftUI

struct PopUpModal: View {
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea()
            
            Button(action: { showModal = true }) {
                Text("Click Me")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                    .padding(20)
                    .background(Color.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
           
            ModalView(isShowing: $showModal)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .statusBar(hidden: true)
    }
}



#Preview {
    PopUpModal()
}
