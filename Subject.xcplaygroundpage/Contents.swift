import Foundation
import Combine

// PassthroughSubject
let relay = PassthroughSubject<String, Never>() // 들고있는 값이 없음, Never: 실패할리 없다
let subscription1 = relay.sink { value in
    print("subscription1 received value: \(value)")
}

relay.send("Hello")
relay.send("World!")


// CurrentValueSubject

let variable = CurrentValueSubject<String, Never>("") // 들고있는 값이 있기때문에 초기 값을 지정

variable.send("Initial text")

let subscription2 = variable.sink { value in
    print("subscription2 received value: \(value)")
}

variable.send("More Text") // variable(Publisher)에 값을 추가함
variable.value



let publisher = ["Here", "we", "go"].publisher

publisher.subscribe(relay)
