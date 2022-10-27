//
//  ViewModel.swift
//  UnSplashDemo
//
//  Created by Manmeet Swach on 2022-10-26.
//

import Foundation
import Reachability
import Combine

class ViewModel: ObservableObject{
    
    let session: URLSession
    private var cancellable: AnyCancellable?
    @Published var networkError: Bool  = false
    private var accessKey = "iMDuXpufsXopXuRSTKIC0CKFaEU5PsQni4PLc7DnzkQ"
    let reachability = try! Reachability()

    init(urlSession: URLSession = .shared){
        self.session = urlSession
    }
    
    func fetchPicturesOfCat(completion: @escaping (UnSplashDataModel) -> Void){
        if reachability.connection == .unavailable {
            networkError = true
        }else{
            let url = URL(string: "https://api.unsplash.com/search/photos/?client_id=\(accessKey)&query=cat&page=1")!
            cancellable = session.dataTaskPublisher(for: url)
                .tryMap { $0.data }
                .decode(type: UnSplashDataModel.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .catch { _ in Just(UnSplashDataModel(total: 0, results: [])) }
                .sink { picturesOfCat in
                    completion(picturesOfCat)
            }
        }
    }
}
