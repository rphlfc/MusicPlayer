//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Raphael Cerqueira on 17/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlayerView()
    }
}

struct PlayerView: View {
    @State var isPlaying = false
    @State var liked = false
    @State var isRepeatOn = false
    @State var isShuffleOn = false
    @State var progress: CGFloat = 0
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all, edges: .all)
            
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 27))
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 27))
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(.black)
                    })
                }
                .padding(.top)
                
                Text("Bring Me The Horizon")
                    .font(.system(size: 19))
                    .foregroundColor(.gray)
                    .padding(.top)
                
                Text("Kingslayer (feat. BABYMETAL)")
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 8)
                
                Image("cover")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .frame(height: 8)
                            .foregroundColor(Color(#colorLiteral(red: 0.6063727736, green: 0.6431342959, blue: 0.7079168558, alpha: 1)))
                        
                        Capsule()
                            .frame(width: ((offset / geometry.size.width) * geometry.size.width) + 16, height: 8)
                            .foregroundColor(Color(#colorLiteral(red: 0.2229017019, green: 0.2814418077, blue: 0.4016884565, alpha: 1)))
                        
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color(#colorLiteral(red: 0.2229017019, green: 0.2814418077, blue: 0.4016884565, alpha: 1)))
                            .offset(x: offset)
                            .gesture(
                                DragGesture()
                                    .onChanged({ (value) in
                                        if value.location.x <= 0 {
                                            offset = 0
                                        } else if value.location.x > geometry.size.width {
                                            offset = geometry.size.width - 15
                                        } else {
                                            offset = value.location.x
                                        }
                                    })
                            )
                    }
                }
                .padding(.top)
                .frame(height: 32)
                
                HStack {
                    Text("1:26")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("3:40")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "music.note.list")
                            .font(.system(size: 27))
                    })
                    
                    Spacer()
                    
                    HStack(spacing: 40) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "backward.end.fill")
                                .font(.system(size: 32))
                        })
                        
                        Button(action: {
                            isPlaying.toggle()
                        }, label: {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .font(.system(size: 40))
                                .padding()
                                .background(Color(#colorLiteral(red: 0.2229017019, green: 0.2814418077, blue: 0.4016884565, alpha: 1)))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        })
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "forward.end.fill")
                                .font(.system(size: 32))
                        })
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        liked.toggle()
                    }, label: {
                        Image(systemName: liked ? "heart.fill" : "heart")
                            .font(.system(size: 27))
                    })
                }
                .padding(.top)
                .foregroundColor(Color(#colorLiteral(red: 0.2229017019, green: 0.2814418077, blue: 0.4016884565, alpha: 1)))
                
                HStack {
                    Button(action: {
                        isRepeatOn.toggle()
                    }, label: {
                        Image(systemName: "repeat")
                            .font(.system(size: 27))
                            .foregroundColor(isRepeatOn ? Color.green : Color(#colorLiteral(red: 0.2229017019, green: 0.2814418077, blue: 0.4016884565, alpha: 1)))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        isShuffleOn.toggle()
                    }, label: {
                        Image(systemName: "shuffle")
                            .font(.system(size: 27))
                            .foregroundColor(isShuffleOn ? Color.green : Color(#colorLiteral(red: 0.2229017019, green: 0.2814418077, blue: 0.4016884565, alpha: 1)))
                    })
                }
                .padding(.top)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
