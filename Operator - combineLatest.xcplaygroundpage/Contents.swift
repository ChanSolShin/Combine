//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest

let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

//Publishers.CombineLatest(strPublisher, numPublisher).sink { (str, num) in // 이렇게도 사용가능
//    print("Receive: \(str), \(num)")
//}

strPublisher.combineLatest(numPublisher).sink { (str, num) in // 다른 publisher와 합쳐서 한번에 반환(마지막거만 저장)
    print("Receive: \(str), \(num)")
}

strPublisher.send("a")
numPublisher.send(1)
strPublisher.send("b")
strPublisher.send("c")


numPublisher.send(2)
numPublisher.send(3)
// 먼저 받은거 순서대로 출력. 마지막 값만 저장됨


// Advanced CombineLatest

let usernamePublisher = PassthroughSubject<String, Never>() // 두 퍼블리셔를 결합해서 아이디, 비밀번호가 조건을 만족하는지
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCrendetialsSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
    print("Credential valid? : \(valid)")
    }

usernamePublisher.send("chansol")
passwordPublisher.send("sdfsf") // 길이가 짧아서 false 반환
passwordPublisher.send("qwertyuiod") // 길이를 충족해서 true 반환

// Merge

let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher




let mergePublisherSubscription = publisher1.merge(with: publisher2) // 두개를 합침. 두 퍼블리셔의 타입이 같아야함
    .sink { value in
    print("Merge: subscription received value: \(value)")
    }



//: [Next](@next)
