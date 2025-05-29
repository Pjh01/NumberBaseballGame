class BaseballGame {
    func start() -> Int {
        let answer = makeAnswer()
        var trialCount = 0
        
        print("< 게임을 시작합니다 >")
        
        while true {
            print("숫자를 입력하세요")
            
            guard let userNumber = readLine(), let _ = Int(userNumber) else {
                print("올바르지 않은 입력값입니다\n")
                continue
            }
            
            let (isOk, userNumberArray) = checkInputNumber(userNumber)
            guard isOk else {
                print("서로 다른 숫자로 이루어진 3자리 수를 입력해주세요\n")
                continue
            }
            
            trialCount += 1
            if checkAnswer(userNumber: userNumberArray, answer: answer) {
                break
            }
        }
        return trialCount
    }
    
    func makeAnswer() -> [Int] {
        let firstNumber = Int.random(in: 1...9)
        let remainNumbers = Array(0...9).filter { $0 != firstNumber }.shuffled().prefix(2)
        
        return [firstNumber] + Array(remainNumbers)
    }
    
    func checkInputNumber(_ number: String) -> (isOk: Bool, userNumberArray: [Int]) {
        let numberArray = number.compactMap { $0.wholeNumberValue }
        let isOk = numberArray.count == 3 && Set(numberArray).count == 3 && numberArray[0] != 0
        
        return (isOk, numberArray)
    }
    
    func checkAnswer(userNumber: [Int], answer: [Int]) -> Bool {
        var strikeCount = 0
        var ballCount = 0
        
        if userNumber == answer {
            print("정답입니다!\n")
            return true
        }
        
        for i in 0..<3 {
            if userNumber[i] == answer[i] {
                strikeCount += 1
            } else if answer.contains(userNumber[i]) {
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
