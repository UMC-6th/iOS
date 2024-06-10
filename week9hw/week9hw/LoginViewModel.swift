import KeychainSwift
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var loginID: String = ""
    @Published var loginPW: String = ""
    //키체인 이용한 로그인 구현
    let keychain = KeychainSwift()
    
    func admitAccount() {
        keychain.set(loginID, forKey: "userLoginID")
        keychain.set(loginPW, forKey: "userLoginPW")
    }
    
    func IDCorrectCheck(enterID: String) -> Bool {
        guard let savedID = keychain.get("userLoginID") else { return false }
        return enterID == savedID
    }
    
    func PWCorrectCheck(enterPW: String) -> Bool {
        guard let savedPW = keychain.get("userLoginPW") else { return false }
        return enterPW == savedPW
    }
}
