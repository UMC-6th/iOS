//
//  AuthViewModel.swift
//  UMCWeek8
//
//  Created by 이승민 on 12/1/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject { // 값이 변경되면 뷰를 업데이트할 수 있게
    // @Published : ObservableObject에서 속성을 선언할 때 사용하는 PropertyWrapper
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User? // 현재사용자
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        }
        catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser (withEmail email: String, password: String, nickname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, nickname: nickname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) // Firebase 컬렉션만들기
            await fetchUser()
        } catch {
            print("DEBUG : Failed to create user with error \(error.localizedDescription)")
        }
       
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // 백엔드에서 로그아웃
            self.userSession = nil // user session 지우고, 로그인 화면으로
            self.currentUser = nil // current user data model 지우기
        }
        catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccout() {
        if  let user = Auth.auth().currentUser {
            user.delete { error in
                if let error = error {
                    print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
                } else {
                    self.userSession = nil
                    self.currentUser = nil
                }
            }
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        self.currentUser = try? snapshot.data(as: User.self)
        
//        print("DEBUG: Current user is \(self.currentUser)") // 현재사용자 잘 가져오는지 확인
    }
}
