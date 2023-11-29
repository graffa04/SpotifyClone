//
//  searchView.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 27/11/23.
//

import SwiftUI
import AVKit


struct searchView: View {
    
    @State private var showSearchBar = false
    
    var songList = songsListModel()
    
    @State private var song: [songsList] = []
    @State private var searchText = ""
    
    var filteredPlaces: [songsList] {
        if searchText == "" {
            return song
        } else {
            return song.filter { song in
                return song.nameSong.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Image("profile")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        Text("Search")
                            .font(.system(size: 23))
                            .bold()
                        
                        Spacer(minLength: 200)
                        
                        Image(systemName: "camera")
                            .font(.system(size: 23))
                        
                        Spacer()
                    }
                    Spacer(minLength: 20)
                    HStack {
                        Spacer(minLength: 10)
                        Button {
                            showSearchBar = true
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .cornerRadius(5)
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                    
                                    Text("What do you want to listen to?")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15))
                                }.padding(.trailing, 100 )
                            }
                        }.sheet(isPresented: $showSearchBar, content: {
                            searchBar()
                        })
                        Spacer(minLength: 10)
                    }
                    Spacer(minLength: 26)
                    Text("Start browsing")
                        .padding(.trailing, 250)
                    Spacer(minLength: 26)
                    VStack {
                        HStack(spacing: 20){
                            Button {
                                
                            } label: {
                                Text("Music")
                                    .padding(.trailing, 115)
                                    .padding(.bottom, 25)
                                    .bold()
                                    .font(.system(size: 15))
                                    .frame(width: 170, height: 60)
                                    .background(
                                        Image("playlist6")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(10)
                                            .clipped()
                                            .padding(.leading, 110)
                                            .padding(.bottom, 25)
                                            .rotationEffect(.degrees(15))
                                    )
                                    .foregroundColor(.white)
                                
                                
                            }
                            .background(Color(.pink))
                            .cornerRadius(7)
                            Button {
                                
                            } label: {
                                Text("Podcast")
                                    .frame(width: 100)
                                    .padding(.trailing, 95)
                                    .padding(.bottom, 25)
                                    .bold()
                                    .font(.system(size: 15))
                                    .background(
                                        Image("categories3.2")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(10)
                                            .clipped()
                                            .padding(.leading, 110)
                                            .padding(.bottom, 25)
                                            .rotationEffect(.degrees(15))
                                    )
                                    .foregroundColor(.white)
                                
                                
                            }
                            .frame(width: 170, height: 60)
                            .background(Color(red: 0, green: 0, blue: 40))
                            .cornerRadius(7)
                        }
                    }
                    Spacer(minLength: 15)
                    HStack(spacing: 20){
                        Button {
                            
                        } label: {
                            Text("Audiobooks")
                                .frame(width: 100)
                                .padding(.trailing, 75)
                                .padding(.bottom, 25)
                                .bold()
                                .font(.system(size: 15))
                                .background(
                                    Image("categories4.2")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(10)
                                        .clipped()
                                        .padding(.leading, 110)
                                        .padding(.bottom, 25)
                                        .rotationEffect(.degrees(15))
                                )
                                .foregroundColor(.white)
                            
                            
                        }
                        .frame(width: 170, height: 60)
                        .background(Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.6861548013)))
                        .cornerRadius(7)
                        Button {
                            
                        } label: {
                            Text("Live events")
                                .frame(width: 100)
                                .padding(.trailing, 75)
                                .padding(.bottom, 25)
                                .bold()
                                .font(.system(size: 15))
                                .background(
                                    Image("categories2")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(10)
                                        .clipped()
                                        .padding(.leading, 110)
                                        .padding(.bottom, 25)
                                        .rotationEffect(.degrees(15))
                                )
                                .foregroundColor(.white)
                            
                            
                        }
                        .frame(width: 170, height: 60)
                        .background(Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)))
                        .cornerRadius(7)
                    }
                    Spacer(minLength: 26)
                    Text("Explore your genres")
                        .frame(width: 200)
                        .padding(.trailing, 200)
                    Spacer(minLength: 26) 
                    
                    HStack {
                        Spacer()
                        ZStack {
                            Button {
                                
                            } label: {
                                Image("vertical1")
                                    .resizable()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(.black),
                                                    lineWidth: 10)
                                            .shadow(color: Color.black, radius: 50, x: -2, y: -2)
                                    )
                            }
                            .frame(width: 115,height: 180)
                            .cornerRadius(5)
                            Text("#lo-fi")
                                .font(.system(size: 15))
                                .padding(.top, 140)
                                .padding(.trailing, 40)
                        }
                        Spacer()
                        ZStack {
                            Button {
                                
                            } label: {
                                Image("vertical3")
                                    .resizable()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(.black),
                                                    lineWidth: 10)
                                            .shadow(color: Color.black, radius: 50, x: -2, y: -2)
                                    )
                            }
                            .frame(width: 115,height: 180)
                            .cornerRadius(5)
                            Text("#rap")
                                .font(.system(size: 15))
                                .padding(.top, 140)
                                .padding(.trailing, 40)
                        }
                        Spacer()
                        ZStack {
                            Button {
                                
                            } label: {
                                Image("vertical2")
                                    .resizable()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(.black),
                                                    lineWidth: 10)
                                            .shadow(color: Color.black, radius: 50, x: -2, y: -2)
                                    )
                            }
                            .frame(width: 115,height: 180)
                            .cornerRadius(5)
                            Text("#indie")
                                .font(.system(size: 15))
                                .padding(.top, 140)
                                .padding(.trailing, 40)
                        }
                        Spacer()
                        
                    }
                    Spacer(minLength: 26)
                    Text("Browsing all")
                        .padding(.trailing, 260)
                        .frame(width: 390)
                    Spacer(minLength: 26)
                }
            }
        }
    }
}

/*.searchable(text: $searchTerm, prompt: "What do you want to listen to?")*/



#Preview {
    searchView()
}
