//
//  ApiViewModel.swift
//  Week10
//
//  Created by 김승원 on 6/11/24.
//

import Foundation

// 서버에서 주는 데이터 ===========================================================
struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
    let audiAcc: String
    let openDt: String
}

class ApiViewModel: ObservableObject {
    let movieURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    
    let myKey = "5e3ccd2099b956a228782d1733df3b89"
    
    func fetchMovie(date: String, completion: @escaping ([Movie]?) -> Void) {
        let urlString = "\(movieURL)&key=\(myKey)&targetDt=\(date)"
        performRequest(with: urlString) { movies in
            completion(movies)
        }
    }
    
    func performRequest(with urlString: String, completion: @escaping ([Movie]?) -> Void) {
        print(#function)
        
        guard let url = URL(string: urlString) else { return }
        
        
        let session = URLSession(configuration: .default)
        
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                completion(nil)
                return
            }
            
            
            if let movies = self.parseJSON(safeData) {
                
                completion(movies)
            } else {
                completion(nil)
            }
        }
        
        
        task.resume()
    }
    
    
    func parseJSON(_ movieData: Data) -> [Movie]? {
        
        print(#function)
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
            
            let dailyLists = decodedData.boxOfficeResult.dailyBoxOfficeList
            
            
            let myMovielists = dailyLists.map {
                Movie(movieNm: $0.movieNm, rank: $0.rank, openDate: $0.openDt, audiCnt: $0.audiCnt, accAudi: $0.audiAcc)
            }
            
            return myMovielists
            
        } catch {
            
            print("파싱 실패")
            
            return nil
        }
        
    }
}
