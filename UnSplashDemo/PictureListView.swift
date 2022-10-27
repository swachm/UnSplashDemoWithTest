//
//  PictureListView.swift
//  UnSplashDemo
//
//  Created by Manmeet Swach on 2022-10-26.
//

import SwiftUI
import SDWebImageSwiftUI

struct PictureListView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var picturesOfCat: UnSplashDataModel?
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center){
                Color.white.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .leading) {
                        if !viewModel.networkError{
                            if let fetchedPicturesOfCat  = picturesOfCat{
                                ForEach(fetchedPicturesOfCat.results){ picture in
                                    WebImage(url: URL(string: picture.urls.regular))
                                        .resizable()
                                        .indicator(.activity)
                                        .transition(.fade(duration: 0.5))
                                        .scaledToFill()
                                        .frame(width: proxy.size.width - 40, height: proxy.size.width - 40)
                                        .cornerRadius(10)
                                        .clipped()
                                        .padding(20)
                                }
                            }else {
                                ProgressView {
                                    Text("Loading Pictures..")
                                }.frame(maxWidth: .infinity, alignment: .center)
                            }
                       
                        }else{
                            ProgressView {
                                Text("Network Error..")
                            }.frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
            }.onAppear {
                viewModel.fetchPicturesOfCat(){ picturesOfCat in
                    self.picturesOfCat = picturesOfCat
                }
            }
        }
    }
}
