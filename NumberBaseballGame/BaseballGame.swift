class BaseballGame {
    func start() {
        let answer = makeAnswer()
        
        print("< 게임을 시작합니다 >")
        
        while true {
            print("숫자를 입력하세요")
            
            guard let userNumber = readLine(), let _ = Int(userNumber), checkInputNumber(userNumber) else {
                print("올바르지 않은 입력값입니다\n")
                continue
            }
            
            if checkAnswer(userNumber: userNumber, answer: answer) {
                break
            }
        }
    }
    
    func makeAnswer() -> Int {
        let selectNumbers = Array(1...9).shuffled().prefix(3)
        let answer = selectNumbers[0] * 100 + selectNumbers[1] * 10 + selectNumbers[2]
        
        return answer
    }
    
    func checkInputNumber(_ number: String) -> Bool {
        let numberArray = number.compactMap { $0.wholeNumberValue }
        
        return numberArray.count == 3 && Set(numberArray).count == 3 && !numberArray.contains(0)
    }
    
    func checkAnswer(userNumber: String, answer: Int) -> Bool {
        var strikeCount = 0
        var ballCount = 0
        let userNumberArray = userNumber.compactMap { $0.wholeNumberValue }
        let answerArray = String(answer).compactMap { $0.wholeNumberValue }
        
        if userNumberArray == answerArray {
            print("정답입니다!\n")
            return true
        }
        
        for i in 0..<3 {
            if userNumberArray[i] == answerArray[i] {
                strikeCount += 1
            } else if answerArray.contains(userNumberArray[i]) {
                ballCount += 1
            }
        }
        
        var result = ""
        if strikeCount > 0 { result += "\(strikeCount)스트라이크 " }
        if ballCount > 0 { result += "\(ballCount)볼" }
        if result.isEmpty { result = "Nothing" }
        print(result + "\n")
        
        return false
    }
}
