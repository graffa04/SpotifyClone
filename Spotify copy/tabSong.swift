//
//  tabSong.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 15/11/23.
//

import SwiftUI
import AVFoundation
import AVKit
import UIKit

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
            .opacity(0.5)
    }
}

struct BackgroundT3: View {
    
    let colors: [Color] = [Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.5)
    }
}

struct UISliderView: UIViewRepresentable {
    @Binding var value: Double
    
    var minValue = 1.0
    var maxValue = 100.0
    var thumbColor: UIColor = .clear
    var minTrackColor: UIColor = .white
    var maxTrackColor: UIColor = .gray
    
    class Coordinator: NSObject {
        var value: Binding<Double>
        
        init(value: Binding<Double>) {
            self.value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
    
    func makeCoordinator() -> UISliderView.Coordinator {
        Coordinator(value: $value)
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = thumbColor
        slider.minimumTrackTintColor = minTrackColor
        slider.maximumTrackTintColor = maxTrackColor
        slider.minimumValue = Float(minValue)
        slider.maximumValue = Float(maxValue)
        slider.value = Float(value)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
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
    
    @State var count = 1
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isDarkMode = true
    
    let song1 = "song1"
    
    var body: some View {
        ZStack {
//            Color(.black)
//                .ignoresSafeArea()
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
                                    if self.count == 1 {
                                        Image("songModal1")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .cornerRadius(5)
                                    } else if self.count == 2 {
                                        Image("songModal2")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .cornerRadius(5)
                                    } else if self.count == 3 {
                                        Image("songModal3")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .cornerRadius(5)
                                    }
                                    
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
//                        Slider(value: Binding(get: {
//                            currentTime
//                        }, set: { newValue in
//                            seekAudio(to: newValue)
//                        }), in: 0...totalTime)
                        UISliderView(value: Binding(get: {
                            currentTime
                        }, set: { newValue in
                            seekAudio(to: newValue)
                        }))
                        .padding(.top, 9.5)
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
//            .preferredColorScheme(isDarkMode ? .dark : .dark)
            .frame(height: 65)
            .cornerRadius(8)
            .fullScreenCover(isPresented: $showSong, content: {
                modalSong(player: $player ,isPlaying: $isPlaying, totalTime: $totalTime, currentTime: $currentTime, count: $count)
                    .gesture(
                    DragGesture())
            })
        }
        
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
    tabSong()
}
