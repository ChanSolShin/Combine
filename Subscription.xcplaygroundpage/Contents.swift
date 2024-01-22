//: [Previous](@previous)

import Foundation
import Combine


let subject = PassthroughSubject<String, Never>() // <Output Type, Failier>



// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[Debug]")
.sink { value in
print("Subscriber received value: \(value)")
}

subject.send("Hello") // publisher의 값을 넣으면 관계가 형성된 subscription에 전달
subject.send("Hello again!")
subject.send("Hello for the last time!")
subject.send(completion: .finished) // 끝났다는 completion을 보내서 관계가 끝남
subject.send("Hello ?? :(") // publisher와 subscriber의 관계가 끝나서 값을 보낼 수 없음


//: [Next](@next)
