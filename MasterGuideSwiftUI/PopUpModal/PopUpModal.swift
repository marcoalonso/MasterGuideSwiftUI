//
//  PopUpModal.swift
//  MasterGuideSwiftUI
//
//  Created by Marco Alonso on 03/10/24.
//

import SwiftUI
import TipKit

struct PopUpModal: View {
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Button(action: { showModal = true }) {
                    Text("Click Me")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .padding(20)
                        .background(Color.white.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                Spacer()
            }
           
            ModalView(isShowing: $showModal)
                .task {
                    try? Tips.resetDatastore()
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .statusBar(hidden: true)
    }
}



#Preview {
    PopUpModal()
}
