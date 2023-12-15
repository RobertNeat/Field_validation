import SwiftUI

struct ContentView: View {
    
    @State var dish_name: String = ""
    
    let allowedTitleCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZĄĆĘŁŃÓŚŹŻąćęłńóśźż")
    @State var validationStatus: Bool = false
    @State var validationMessage:String = ""
    

    var body: some View {
        VStack {
            List {
                Section(header: Text("Tytuł")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(.gray)
                    .padding(5)
                ) {
                    TextField("", text: $dish_name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(5)
                }
            }

            //Text("Validation: \(String(validationStatus))")

            Button("Zapisz", action: {
                validationStatus = validate()
            })
        }
        .padding()
        .alert(isPresented: $validationStatus) {
                    Alert(
                        title: Text("Błąd"),
                        message: Text("Wprowadzono niedozwolony znak."),
                        dismissButton: .default(Text("OK"))
                    )
                }
    }

    private func validate() -> Bool {
        if dish_name.isEmpty || dish_name.rangeOfCharacter(from: allowedTitleCharacters.inverted) != nil {
            return true//false  //zwracamy true w momoencie kiedy był błąd walidacji
        }
        return false//true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
