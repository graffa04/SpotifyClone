//
//  modalSong.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 18/11/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct BackgroundSong1: View {
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.1079011187, green: 0.3485074937, blue: 0.4073579013, alpha: 1)), Color(#colorLiteral(red: 0.09506385773, green: 0.2428356409, blue: 0.2807130218, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1))]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundSong2: View {
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1))]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundSong3: View {
    
    let colors: [Color] = [Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.6861548013)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1))]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct modalSong: View {
    
    @Binding var player: AVAudioPlayer!
    
    @Binding var isPlaying : Bool
    @Binding var totalTime : TimeInterval
    @Binding var currentTime: TimeInterval 

    
    @State var count = 1
    @Environment(\.dismiss) var dismiss
    
    let song1 = "song1"
    
    var body: some View {
        
        ZStack {
            if self.count == 1 {
                BackgroundSong1()
            } else if self.count == 2 {
                BackgroundSong2()
            } else if self.count == 3 {
                BackgroundSong3()
            }
            VStack(spacing: 30) {
                HStack{
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    })
                    Spacer()
                    Text("Name playlist")
                        .font(.system(size: 15))
                        .bold()
                    Spacer()
                    Image(systemName: "ellipsis")
                        .accessibilityLabel("More Option")
                } .frame(width: 360)
                
                if self.count == 1 {
                    Image("songModal1")
                        .resizable()
                        .frame(width: 330, height: 330)
                        .cornerRadius(5)
                        .accessibilityLabel("Song Image")
                } else if self.count == 2 {
                    Image("songModal2")
                        .resizable()
                        .frame(width: 330, height: 330)
                        .cornerRadius(5)
                        .accessibilityLabel("Song Image")
                } else if self.count == 3 {
                    Image("songModal3")
                        .resizable()
                        .frame(width: 330, height: 330)
                        .cornerRadius(5)
                        .accessibilityLabel("Song Image")
                }
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name Song")
                            .bold()
                            .font(.system(size: 25))
                        Text("Artist name")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 35))
                        .accessibilityLabel("add it to a playlist")
                    
                    
                    
                }.frame(width: 350)
                Slider(value: Binding(get: {
                    currentTime
                }, set: { newValue in
                    seekAudio(to: newValue)
                }), in: 0...totalTime)
                .accentColor(.white)
                .padding(.top, 15.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .white))
                .frame(width: 370, height: 0.5)
                HStack {
                    Text(timeString(time: currentTime))
                        .foregroundStyle(Color(.gray))
                    Spacer()
                    Text(timeString(time: totalTime))
                        .foregroundStyle(Color(.gray))
                } .padding(.horizontal)
                HStack {
                    Image(systemName: "shuffle")
                        .font(.system(size: 30))
                        .accessibilityLabel("produce song randomly ")
                    Spacer()
                    Button(action: {
                        StopAudio()
                        if self.count == 3 || self.count == 2 {
                            count -= 1
                        } else {
                            count = 3
                        }
                        let url = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
                    }, label: {
                        Image(systemName: "backward.end.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .accessibilityLabel("go to the previous song")
                    })
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.white)
                        
                        Button(action: {
                            print()
                        }, label: {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                                .onTapGesture {
                                    isPlaying ? StopAudio() : playAudio()
                                }
                                
                        })
                    }
                    Spacer()
                    Button(action: {
                        StopAudio()
                        if self.count < 3 {
                            count += 1
                        } else {
                            count = 1
                        }
                        let url = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
                    }, label: {
                        Image(systemName: "forward.end.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .accessibilityLabel("go to the next song")
                    })
                    Spacer()
                    Image(systemName: "arrow.rectanglepath")
                        .font(.system(size: 20))
                    
                }.padding(.horizontal)
                
                
            }
        }
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
                    updateProgress()
                }
        .onAppear {
            let url = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        }
    }
    
    private func setupAudio() {
        guard let url = Bundle.main.url(forResource: "song1", withExtension: "mp3") else {
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

//#Preview {
//    @State var player: AVAudioPlayer?
//    modalSong(player: $player, isPlaying: .constant(true), totalTime: .constant(2), currentTime: .constant(2))
//}
