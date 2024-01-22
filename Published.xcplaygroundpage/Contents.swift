//: [Previous](@previous)

import Foundation
import UIKit
import Combine

final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 20
}

final class Label {
    var text: String = ""
}


let label = Label()
let vm = SomeViewModel()
print("text: \(label.text)")

vm.$name.assign(to: \.text, on: label)
// vm이라는 publisher에 생긴 데이터를 label의 text에 할당
print("text: \(label.text)")

vm.name = "Jason" // vm의 name을 바꾸면 label의 텍스트가 업데이트 됨.
print("text: \(label.text)")

//: [Next](@next)
