//: [Previous](@previous)

import Foundation
import Combine

// Transform - Map
let numPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numPublisher
    .map { $0 * 2 } // 받은거의 *2 해서(특정형식으로 가공) subscription에 보냄
    .sink {value in
        print("Transformed Value: \(value)")
    }

numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)
subscription1.cancel()

// Filter
let stringPublisher = PassthroughSubject<String,Never>()
let subscription2 = stringPublisher
    .filter { $0.contains("a") } // a가 포함되어 있는것만 filter(걸러서)해서 subscription에 보냄
    .sink { value in
    print("Filtered Vlaue: \(value)")
    }

stringPublisher.send("abc")
stringPublisher.send("Jack")
stringPublisher.send("Joon")
stringPublisher.send("Jenny")
stringPublisher.send("Jason")
subscription2.cancel()

//: [Next](@next)
