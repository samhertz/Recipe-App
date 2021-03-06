//
//  RecipeFeatureView.swift
//  Recipe List App
//
//  Created by Samuel Hertz on 1/29/22.
//

import SwiftUI

struct RecipeFeatureView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = true
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                
                TabView {
                    
                    ForEach (0..<model.recipes.count) { index in
                     
                        if model.recipes[index].featured == true {
                           
                            Button {
                                
                                //show the recipedetail sheet
                                self.isDetailViewShowing = true
                                
                            } label: {
                                ZStack {
                                    
                                    Rectangle()
                                        .foregroundColor(.white)
                                        
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                        
                                    }
                                    
                                }
                            }

                            .sheet(isPresented: $isDetailViewShowing) {
                                //show the recipe detail view
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(20)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }.padding([.leading, .bottom])
        }
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
