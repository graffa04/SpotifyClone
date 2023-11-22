//
//  tabSong.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 15/11/23.
//

import SwiftUI
import AVFoundation
import AVKit

struct BackgroundT1: View {
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.1079011187, green: 0.3485074937, blue: 0.4073579013, alpha: 1))]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundT2: View {
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundT3: View {
    
    let colors: [Color] = [Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct tabSong: View {
    
    //    var currentSong: songsList
    
    
    @State private var showSong = false
    
    @State public var player: AVAudioPlayer?
    
    
    @State public var isPlaying = false
    @State public var totalTime : TimeInterval = 0.0
    @State public var currentTime: TimeInterval = 0.0
    
    @State var showNewScreen = false
    @State private var verticalPosition = 0.0
    
    @Binding var count: Int
    
    @Environment(\.dismiss) var dismiss
    
    let song1 = "song1"
    
    var body: some View {
        NavigationStack {
            ZStack {
                if self.count == 1 {
                    BackgroundT1()
                } else if self.count == 2 {
                    BackgroundT2()
                } else if self.count == 3 {
                    BackgroundT3()
                }
                VStack {
                    HStack {
                        HStack{
                            Spacer()
                            Button {
                                showSong = true
                            } label: {
                                Image("songModal1")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(5)
                            }.accessibilityHidden(true)
                            
                            
                            VStack(alignment: .leading) {
                                Button{
                                    showSong = true
                                }label: {
                                    Text("Name song")
                                }
                                
                                
                                //Text("Name song")
                                Text("Singers name")
                                    .foregroundColor(Color(.gray))
                                    .accessibilityHidden(true)
                            }
                            .font(.system(size: 10))
                            .accessibilityLabel("Name Song, Singer Name, double tap for the song view")
                            
                            Spacer(minLength: 160)
                            Spacer()
                            
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 25) {
                            Button {
                                showSong = true
                            } label: {
                                Image(systemName: "hifispeaker")
                                    .foregroundColor(.gray)
                            }
                            
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        isPlaying ? StopAudio() : playAudio()
                                    }
                            })
                            
                        }
                        .font(.system(size: 25))
                        .padding(.trailing)
                    }
                    Slider(value: Binding(get: {
                        currentTime
                    }, set: { newValue in
                        seekAudio(to: newValue)
                    }), in: 0...totalTime)
                    .accentColor(.white)
                    .padding(.top, 15.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: .white))
                    .frame(width: 370, height: 0.5)
                    .accessibilityHidden(true)
                    
                }
            }
            .frame(height: 65)
            .cornerRadius(8)
            .foregroundColor(.white)
            .onAppear(perform: setupAudio)
            .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
                updateProgress()
            }
            
            
            
        }
        .frame(height: 65)
        .fullScreenCover(isPresented: $showSong, content: {
            modalSong(player: $player ,isPlaying: $isPlaying, totalTime: $totalTime, currentTime: $currentTime)
        })
        
    }
    
    func gestureVertical() -> some Gesture {
        return DragGesture()
            .onChanged { value in
                if value.translation.height < 0 {
                    verticalPosition = 0
                } else {
                    verticalPosition = value.translation.height
                }
                
            }
            .onEnded { value in
                withAnimation(.linear(duration: 0.05)) {
                    showNewScreen.toggle()
                    verticalPosition = .zero
                }
            }
    }
    
    private func setupAudio() {
        guard let url = Bundle.main.url(forResource: song1, withExtension: "mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            totalTime = player?.duration ?? 0.0
            
        } catch {
            print("Error loading audio: \(error)")
        }
    }
    
    private func playAudio() {
        player?.play()
        isPlaying = true
    }
    
    private func StopAudio() {
        player?.pause()
        isPlaying = false
    }
    
    private func updateProgress() {
        guard let player = player else { return }
        currentTime = player.currentTime
    }
    
    private func seekAudio(to time: TimeInterval) {
        player?.currentTime = time
    }
    
    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    tabSong(count: .constant(1))
}
