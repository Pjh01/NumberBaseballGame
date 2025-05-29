// 야구 게임 클래스
class BaseballGame {
    // 게임 시작 메서드(시도한 횟수 반환)
    func start() -> Int {
        let answer = makeAnswer()   // 랜덤 정답(숫자 배열) 생성
        var trialCount = 0          // 시도 횟수
        
        print("< 게임을 시작합니다 >")
        
        while true {
            print("숫자를 입력하세요")
            
            // 사용자 입력을 받아 Int 변환 여부 확인
            guard let userNumber = readLine(), let _ = Int(userNumber) else {
                print("올바르지 않은 입력값입니다\n")
                continue
            }
            
            // 입력값 유효성 검사 및 숫자 배열 변환
            let (isOk, userNumberArray) = checkInputNumber(userNumber)
            guard isOk else {
                print("서로 다른 숫자로 이루어진 3자리 수를 입력해주세요\n")
                continue
            }
            
            // 시도 횟수 증가 및 정답 여부 확인
            trialCount += 1
            if checkUserAnswer(userNumber: userNumberArray, answer: answer) {
                break
            }
        }
        return trialCount   // 최종 시도 횟수 반환
    }
    
    // 서로 다른 3자리 정답 숫자 생성 메서드
    func makeAnswer() -> [Int] {
        // 첫 자리는 1~9 중 선택, 나머지는 0~9(첫 숫자 제외) 중 선택
        let firstNumber = Int.random(in: 1...9)
        let remainNumbers = Array(0...9).filter { $0 != firstNumber }.shuffled().prefix(2)
        
        return [firstNumber] + Array(remainNumbers)
    }
    
    // 사용자 입력 문자열의 유효성(숫자 3자리, 중복 X, 첫 숫자 0 X) 확인 및 숫자 배열 변환 메서드
    func checkInputNumber(_ number: String) -> (isOk: Bool, userNumberArray: [Int]) {
        let numberArray = number.compactMap { $0.wholeNumberValue }
        let isOk = numberArray.count == 3 && Set(numberArray).count == 3 && numberArray[0] != 0
        
        return (isOk, numberArray)
    }
    
    // 사용자 숫자 배열과 정답 배열 비교 및 정답 여부 판단 메서드
    func checkUserAnswer(userNumber: [Int], answer: [Int]) -> Bool {
        var strikeCount = 0
        var ballCount = 0
        
        if userNumber == answer {
            print("정답입니다!\n")
            return true
        }
        
        // 스트라이크(숫자와 위치 일치)와 볼(숫자만 일치) 계산
        for i in 0..<3 {
            if userNumber[i] == answer[i] {
                strikeCount += 1
            } else if answer.contains(userNumber[i]) {
                ballCount += 1
            }
        }
        
        // 비교 결과 출력
        var result = ""
        if strikeCount > 0 { result += "\(strikeCount)스트라이크 " }
        if ballCount > 0 { result += "\(ballCount)볼" }
        if result.isEmpty { result = "Nothing" }
        print(result + "\n")
        
        return false    // 정답이 아니므로 false 반환
    }
}
