//
//  searchPage.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 15/11/23.
//

import SwiftUI


struct Background: View {
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.1407667696, green: 0.5089942217, blue: 0.5972044468, alpha: 1)), Color(#colorLiteral(red: 0.1079011187, green: 0.3485074937, blue: 0.4073579013, alpha: 1)), Color(#colorLiteral(red: 0.09506385773, green: 0.2428356409, blue: 0.2807130218, alpha: 1)), Color(#colorLiteral(red: 0.08821473271, green: 0.1449819803, blue: 0.1618441939, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1))]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Cover: View {
    
    @Environment(\.dismiss) var dismiss
    
    var model: playlistModel
    
    var body: some View {
        NavigationStack {
            
            ZStack(alignment: .top) {
                Image(model.Image)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .rotationEffect(.degrees(270))
                    .accessibilityLabel("Playlist")
                
                //                Button(action: {
                //                    dismiss.callAsFunction()
                //
                //                }, label: {
                //                    Label("Back", systemImage: "chevron.left")
                //                        .labelStyle(.iconOnly)
                //                        .offset(x: -165)
                //                        .font(.system(size: 20))
                //                        .foregroundColor(.white)
                //                })
                
            }
            //            .navigationBarItems(leading: Image(systemName: "chevron.left") {
            //
            //            })
        }
    }
}

struct infoplaylist: View {
    
    var model: playlistModel
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.nameProfile)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(colorScheme == .dark ? .white : .white)
                
                HStack {
                    Image(model.imageProfile)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                    
                    Text("Creator playlist")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(colorScheme == .dark ? .white : .white)
                }
                
            }
            .padding(.leading)
            .padding(.top)
            
            Spacer()
            
            
        }
    }
}

struct Control: View {
    
    var model: playlistModel
    
    @State private var buttonTapped = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                HStack {
                    Text(model.details)
                        .accessibilityLabel("Duration 4 hours and 23 minutes")
                }
                
                HStack(alignment: .center, spacing: 25) {
                    Button {
                        self.buttonTapped.toggle()
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(buttonTapped ? .green : .white)
                    }
                    
                    Image(systemName: "arrow.down.circle")
                    Image(systemName: "ellipsis")
                }
                .font(.system(size: 25))
            }
            .foregroundColor(.gray)
            .font(.system(size: 14))
            .padding(.leading)
            
            Spacer()
            
            ZStack(alignment: .bottomTrailing) {
                HStack(spacing: 20) {
                    Image(systemName: "shuffle")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                        .accessibilityLabel("shuffle song")
                    ZStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.green)
                        
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .accessibilityLabel("play button")
                        
                    }
                }
//                ZStack {
//                    Circle()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.white)
//                    
//                    Image(systemName: "shuffle")
//                        .foregroundColor(.green)
//                        .font(.system(size: 10))
//                }
            }
            .padding(.horizontal)
        }
    }
}

struct Songs: View {
    
    var songList = songsListModel()
    
    //    @EnvironmentObject var currentSong: songsList
    
    @State private var buttonTapped = false
    @State private var isSelected: Bool = false
    
//    @Binding var player: AVAudioPlayer?
//    @Binding var isPlaying : Bool
//    @Binding var totalTime : TimeInterval
//    @Binding var currentTime: TimeInterval 
    
    let song1 = "song1"
//    @Binding var player: AVAudioPlayer?
//    @Binding var isPlaying : Bool
    
    var body: some View {
        ForEach(songList.songs) { songList in
            Button {
                songList.isSelected.toggle()
            } label: {
                HStack {
                    Image(songList.imageSong)
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(songList.nameSong)
                            .font(.system(size: 14))
                            .foregroundColor(songList.isSelected ? .green : .white)
                        
                        HStack {
                            
                            if songList.explicit {
                                Image(systemName: "e.square.fill")
                            }
                            
                            Text(songList.nameArtist)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                }
            }
        }.frame(width: 350)
    }
    
//    private func setupAudio() {
//        guard let url = Bundle.main.url(forResource: song1, withExtension: "mp3") else {
//            return
//        }
//        
//        do {
//            player = try AVAudioPlayer(contentsOf: url)
//            player?.prepareToPlay()
//            totalTime = player?.duration ?? 0.0
//            
//        } catch {
//            print("Error loading audio: \(error)")
//        }
//    }
//    
//    private func playAudio() {
//        player?.play()
//        isPlaying = true
//    }
//    
//    private func StopAudio() {
//        player?.pause()
//        isPlaying = false
//    }
}
struct playlistPage: View {
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Background()
                ScrollView {
                    VStack {
                        Cover(model: playlistModel())
                        
                        VStack {
                            infoplaylist(model: playlistModel())
                            Control(model: playlistModel())
                            
                            VStack(spacing: 24){
                                Songs()
                                
                            }.padding(.top)
                        }
                        Spacer()
                        
                        
                        
                    }
                }
            }
        }
    }
}
#Preview {
    playlistPage()
    
}
