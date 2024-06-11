import SwiftUI

struct ContentView: View {
    @State var loginID: String = ""
    @State var loginPW: String = ""

    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("로그인")
            TextField("Enter Your ID", text: $loginID)
                .padding()
            TextField("Enter Your PW", text: $loginPW)
                .padding()
            
            Button(action: {
                loginViewModel.loginID = loginID
                loginViewModel.loginPW = loginPW
                loginViewModel.admitAccount()
            }, label: {
                Text("Admission")
            })
            
            Button(action: {
                if loginViewModel.IDCorrectCheck(enterID: loginID) && loginViewModel.PWCorrectCheck(enterPW: loginPW) {
                    print("Login Successful")
                } else {
                    print("Incorrect ID or Password")
                }
            }, label: {
                Text("Login")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView(loginViewModel: LoginViewModel())
}
