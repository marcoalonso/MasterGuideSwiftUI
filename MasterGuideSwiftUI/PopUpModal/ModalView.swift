//
//  ModalView.swift
//  MasterGuideSwiftUI
//
//  Created by Marco Alonso on 03/10/24.
// https://www.youtube.com/watch?v=8hJLL72lQ7A

import SwiftUI

struct ModalView: View {
    @Binding var isShowing: Bool
    @State var currentHeight: CGFloat = 400
    
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 700
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .animation(.easeIn)
    }
    
    var mainView: some View {
        VStack {
            ZStack {
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.0001))
            .gesture(dragGesture)
            
            ZStack {
                
                
                VStack {
                    Image("modal")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: 400)
                    
                    Text("Modal Example Title")
                        .font(.title2)
                    
                    Text("This is the content of the modal")
                        .font(.subheadline)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
            }
            .frame(maxHeight: currentHeight)
            .frame(maxWidth: .infinity)
            .background()
        }
    }
    
    @State private var prevDragTraslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                let dragAmount = val.translation.height - prevDragTraslation.height
                if currentHeight > maxHeight || currentHeight < minHeight {
                    currentHeight -= dragAmount / 6
                } else {
                    currentHeight -= dragAmount
                }
                prevDragTraslation = val.translation
            }
            .onEnded { val in
                prevDragTraslation = .zero
            }
    }
}

#Preview {
    ModalView(isShowing: .constant(true))
}
