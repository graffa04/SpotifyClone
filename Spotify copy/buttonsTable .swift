//
//  buttonsTable .swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 14/11/23.
//

import SwiftUI


struct buttonsTable_: View {
    
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack {
                    
                    NavigationLink(destination: {
                        playlistPage()
                    }, label: {
                        Text("playlist")
                            .bold()
                            .font(.footnote)
                            .frame(width: 180, height: 60)
                            .background(
                                Image("playlist1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .position(x: 30, y: 30)
                            )
                            .foregroundColor(.white)
                        
                    }) .background(Color(red: 0.18, green: 0.18, blue: 0.19))
                        .cornerRadius(7)
                    
                    
                    
                    
                    
                    
                    
                    
                    Button{
                        
                    } label: {
                        Text("playlist")
                            .bold()
                            .font(.footnote)
                            .frame(width: 180, height: 60)
                            .background(
                                Image("playlist2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .position(x: 30, y: 30)
                            )
                            .foregroundColor(.white)
                        
                        
                    }
                    .background(Color(red: 0.18, green: 0.18, blue: 0.19))
                    .cornerRadius(7)
                    
                }
                HStack {
                    Button {
                        
                    } label: {
                        Text("playlist")
                            .bold()
                            .font(.footnote)
                            .frame(width: 180, height: 60)
                            .background(
                                Image("playlist3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .position(x: 30, y: 30)
                            )
                            .foregroundColor(.white)
                        
                        
                    }
                    .background(Color(red: 0.18, green: 0.18, blue: 0.19))
                    .cornerRadius(7)
                    
                    Button {
                        
                    } label: {
                        Text("playlist")
                            .bold()
                            .font(.footnote)
                            .frame(width: 180, height: 60)
                            .background(
                                Image("playlist4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .position(x: 30, y: 30)
                            )
                            .foregroundColor(.white)
                        
                        
                    }
                    .background(Color(red: 0.18, green: 0.18, blue: 0.19))
                    .cornerRadius(7)
                }
                HStack {
                    Button {
                        
                    } label: {
                        Text("playlist")
                            .bold()
                            .font(.footnote)
                            .frame(width: 180, height: 60)
                            .background(
                                Image("playlist5")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .position(x: 30, y: 30)
                            )
                            .foregroundColor(.white)
                        
                        
                    }
                    .background(Color(red: 0.18, green: 0.18, blue: 0.19))
                    .cornerRadius(7)
                    Button {
                        
                    } label: {
                        Text("playlist")
                            .bold()
                            .font(.footnote)
                            .frame(width: 180, height: 60)
                            .background(
                                Image("playlist6")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .position(x: 30, y: 30)
                            )
                            .foregroundColor(.white)
                        
                        
                    }
                    .background(Color(red: 0.18, green: 0.18, blue: 0.19))
                    .cornerRadius(7)
                }
                
            }
        }
        .accentColor(.white)

    }
}

#Preview {
    buttonsTable_()
}
