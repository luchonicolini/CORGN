//
//  HomeView.swift
//  CorGN
//
//  Created by Luciano Nicolini on 20/01/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var currentHome: HomeModel?
    @State var showPage: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("**Bienvenido al CORGN**")
                    .padding([.leading, .top])
                    .font(.system(size: 31, weight: .bold))
            
                
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10, content:  {
                            ForEach(ModelList) { card in
                                GeometryReader(content: { geometry in
                                    let cardSize = geometry.size
                                    let minX = min(geometry.frame(in: .scrollView).minX * 1.4, geometry.size.width * 1.4)
                                    
                                    Button {
                                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7)) {
                                            
                                            showPage = true
                                        }
                                    } label: {
                                        Image(card.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .offset(x: -minX)
                                            .frame(width: cardSize.width * 2.5)
                                            .frame(width: cardSize.width, height: cardSize.height)
                                            .overlay(content: {
                                                //Overlay
                                                OverlayCardView(card: card)
                                            })
                                        
                                            .clipShape(.rect(cornerRadius: 20))
                                            .shadow(color: .black.opacity(0.15), radius: 8, x: 5, y: 10)
                                    }
                                    
                                    
                                })
                                
                                .frame(width: size.width - 60)
                                .scrollTransition(.interactive, axis: .horizontal) {
                                    view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.90)
                                }
                            }
                        })
                        .padding(.horizontal,20)
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    }
                    
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                }
                .frame(height: 300)
                
                ListView()
                
                
                
            }
            .scrollIndicators(.hidden)
        }
        //.fontDesign(.monospaced)
    }
}


@ViewBuilder
//OverlayCard
func OverlayCardView(card: HomeModel) -> some View {
    ZStack(alignment: .bottom) {
        LinearGradient(colors: [.black.opacity(0.1), Color.clear, .black.opacity(0.1), .black.opacity(0.5), .black], startPoint: .top, endPoint: .bottom)
        
        HStack {
            Image(card.image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(.rect(cornerRadius: 15))
            
            VStack(alignment: .leading) {
                Text(card.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Text("Game")
                    .font(.caption)
                    .lineLimit(1)
            }
            .foregroundStyle(.white)
            Spacer()
        }
        .padding()
    }
}


#Preview {
    HomeView()
}

