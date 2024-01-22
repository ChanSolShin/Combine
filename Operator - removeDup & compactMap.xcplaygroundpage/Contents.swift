//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates. 같은 데이터가 들어올때 중복된 부분을 지움
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ") // 공백을 기준으로 배열로 반환
    .publisher
words
    .removeDuplicates() // 중복된 부분을 지움
    .sink { value in
    print(value)
    }.store(in: &subscriptions) // .store은, let subscription = words 를 대신해서 사용. 불필요한 subscription 생성방지



// compactMap. 변경된 내용이 nil인경우 값을 보내지 않음
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap { Float($0) } // 실수형으로 타입 캐스팅하고, 캐스팅 가능한 data만 받음
    .sink { value in
    print(value)
    }.store(in: &subscriptions)


// ignoreOutput. 새로들어오는 데이터를 더 신경쓰지 않음
let numbers = (1...10_000).publisher

numbers
    .ignoreOutput() // 데이터를 더 받지 않고 finished 반환
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)


// prefix. 여러개의 데이터가 들어올때 일정개수만 받음
let tens = (1...10).publisher

tens
    .prefix(2) // tens에서 2까지만 받고 finished
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)


//: [Next](@next)
