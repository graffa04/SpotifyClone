//
//  slidingCategories.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 15/11/23.
//

import SwiftUI

//struct Categories: ButtonStyle {
//    
//    var categories = categoriesModel()
//    //    @State var imageC: String
//    let imageNames = ["categories1", "categories2", "categories3", "categories4", "categories5"]
//    
//    
//    func makeBody(configuration: Configuration) -> some View {
//        ForEach(imageNames, id: \.self) { imageNames in
//            
//            Button{
//                
//            } label: {
//                HStack {
//                    VStack {
//                        
//                    }
//                }
//            }
//        }
//    }
//}



struct slidingCategories: View {
    
    var categories = categoriesModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Spacer()
                Spacer()
                Button {
                    
                } label: {
                    VStack{
                        Image("categories1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .frame(width: 150, height: 150)
                            .clipShape(Rectangle())
                        
                        Text("Arianna Grande, The Weeknd, Luchè, Geolier")
                            .font(
                                Font.custom("Inter", size: 10)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .frame(width: 150, height: 29,alignment: .leading)
                    }
                }
                Button {
                    
                } label: {
                    VStack{
                        Image("categories2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .frame(width: 150, height: 150)
                            .clipShape(Rectangle())
                        
                        Text("Arianna Grande, The Weeknd, Luchè, Geolier")
                            .font(
                                Font.custom("Inter", size: 10)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .frame(width: 150, height: 29,alignment: .leading)
                    }
                }
                Button {
                    
                } label: {
                    VStack{
                        Image("categories3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .frame(width: 150, height: 150)
                            .clipShape(Rectangle())
                        
                        Text("Arianna Grande, The Weeknd, Luchè, Geolier")
                            .font(
                                Font.custom("Inter", size: 10)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .frame(width: 150, height: 29,alignment: .leading)
                    }
                }
                Button {
                    
                } label: {
                    VStack{
                        Image("categories4")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .frame(width: 150, height: 150)
                            .clipShape(Rectangle())
                        
                        Text("Arianna Grande, The Weeknd, Luchè, Geolier")
                            .font(
                                Font.custom("Inter", size: 10)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .frame(width: 150, height: 29,alignment: .leading)
                    }
                }
                Button {
                    
                } label: {
                    VStack{
                        Image("categories5")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .frame(width: 150, height: 150)
                            .clipShape(Rectangle())
                        
                        Text("Arianna Grande, The Weeknd, Luchè, Geolier")
                            .font(
                                Font.custom("Inter", size: 10)
                                    .weight(.medium)
                            )
                            .foregroundColor(.gray)
                            .frame(width: 150, height: 29,alignment: .leading)
                    }
                }
                
            }
            
        } .scrollIndicators(.hidden)
    }
}

#Preview {
    slidingCategories()
}
