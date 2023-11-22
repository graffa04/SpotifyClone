//
//  Singers.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 15/11/23.
//

import SwiftUI

struct buttonSingers: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
            .clipShape(Circle())
        
    }
}

struct Singers: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Spacer()
                Spacer()
                Button {
                    
                } label: {
                    VStack {
                        
                        Image("tyler")
                            .resizable()
                            .frame(width: 126, height: 126)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 126, height: 126)
                            .clipShape(Circle())
                        
                        Text("Tyler The Creator")
                            .font(
                                Font.custom("Inter", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(width: 100, height: 29,alignment: .leading)
                    }
                }
                Button {
                    
                } label: {
                    VStack {
                        
                        Image("eminem")
                            .resizable()
                            .frame(width: 126, height: 126)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 126, height: 126)
                            .clipShape(Circle())
                        
                        Text("Eminem")
                            .font(
                                Font.custom("Inter", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(width: 50, height: 29,alignment: .leading)
                    }
                }
                Button {
                    
                } label: {
                    VStack {
                        
                        Image("drake")
                            .resizable()
                            .frame(width: 126, height: 126)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 126, height: 126)
                            .clipShape(Circle())
                        
                        Text("drake")
                            .font(
                                Font.custom("Inter", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(width: 37, height: 29,alignment: .leading)
                    }
                }
                Button {
                    
                } label: {
                    VStack {
                        
                        Image("luche")
                            .resizable()
                            .frame(width: 126, height: 126)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 126, height: 126)
                            .clipShape(Circle())
                        
                        Text("Luchè")
                            .font(
                                Font.custom("Inter", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(width: 37, height: 29,alignment: .leading)
                    }
                }
                Button {
                    
                } label: {
                    VStack {
                        
                        Image("theWeeknd")
                            .resizable()
                            .frame(width: 126, height: 126)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 126, height: 126)
                            .clipShape(Circle())
                        
                        Text("The Weeknd")
                            .font(
                                Font.custom("Inter", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(width: 37, height: 29,alignment: .leading)
                    }
                }
            }
        } .scrollIndicators(.hidden)
    }
}

#Preview {
    Singers()
}
