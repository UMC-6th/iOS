//
//  ApiView.swift
//  Week10
//
//  Created by 김승원 on 6/11/24.
//

import SwiftUI

struct ApiView: View {
    
    @State var downloadedMovies = [Movie]()
    @State var text: String = ""
    
    @StateObject var apiVM = ApiViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("영화 차트")
            TextField("날짜를 입력하세요 ex)20231225", text: $text)
                .padding()
                .border(.blue)
            Button("불러오기", action:{
                apiVM.fetchMovie(date: text) { movies in
                    if let movies = movies {
                        
                        // 배열 받아서 빈배열에 넣기
                        downloadedMovies = movies
                        dump(movies)
                        
                        print("전체 영화 갯수 확인: \(Movie.movieId)")
                    } else {
                        print("영화데이터가 없습니다. 또는 다운로드에 실패했습니다.")
                    }
                }
            })
        }
        .padding()
    }
}

//#Preview {
//    ApiView(, text: "hello")
//}
