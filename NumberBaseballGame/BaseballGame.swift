class BaseballGame {
    func start() {
        let answer = makeAnswer()
    }
    
    func makeAnswer() -> Int {
        let selectNumbers = Array(1...9).shuffled().prefix(3)
        let answer = selectNumbers[0] * 100 + selectNumbers[1] * 10 + selectNumbers[2]
        
        return answer
    }
}
