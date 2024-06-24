//
//  ContentView.swift
//  Week10
//
//  Created by 이승민 on 6/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var mainLabel = "대기중"
    @State private var textFieldInput = ""
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                Text(mainLabel)
                    .font(.system(size: 25, weight: .bold))
                    .padding(.bottom, 20)


                HStack {
                    TextField("회차를 입력해주세요!!!", text: $textFieldInput)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color.orange, lineWidth: 1))
                        .frame(height: 40)

                    Button(action: {
                        mainButtonTapped()
                    }) {
                        Text("검색")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 80, height: 40)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                }
                .padding(.horizontal, 30)

                Spacer()
            }
            .navigationBarTitle("로또 번호 조회", displayMode: .inline)
            .navigationBarColor(backgroundColor: .darkGray, titleColor: .white)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("에러"), message: Text("없는 회차입니다! 다시입력해주세요 :)"), dismissButton: .default(Text("확인")))
            }
        }
    }

    // MARK: - 검색 버튼 클릭했을 때
    func mainButtonTapped() {
        if let finalNum = Int(textFieldInput) {
            let urlString = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(finalNum)"
            if let url = URL(string: urlString) {
                fetchData(from: url)
            }
        }
    }

    // MARK: - 에러처리 및 로또번호 나타내기
    func fetchData(from url: URL) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            
            guard let safeData = data else {
                print("Error: Did not receive data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            
            do {
                let lotto = try JSONDecoder().decode(Lotto.self, from: safeData)
                DispatchQueue.main.async { // 비동기 처리
                    self.mainLabel = "\(lotto.drwtNo1), \(lotto.drwtNo2), \(lotto.drwtNo3), \(lotto.drwtNo4), \(lotto.drwtNo5), \(lotto.drwtNo6), Bonus: \(lotto.bnusNo)"
                }
            } catch {
                DispatchQueue.main.async {
                    self.showAlert = true
                }
            }
        }.resume()
    }
}

struct Lotto: Codable {
    let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo: Int
}

// Extension to change the Navigation Bar color
extension View {
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}

struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init( backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = titleColor
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
