// 게임 관리 클래스
class GameManagement {
    let baseballGame = BaseballGame()
    let gameRecord = GameRecord()
    var isEnd = false
    
    // 전체 게임 흐름 관리 메서드
    func startGame() {
        while !isEnd {
            print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            guard let userInput = readLine() else {
                print("올바른 숫자를 입력해주세요!\n")
                continue
            }
            
            // 사용자 입력에 따른 기능 분기
            switch userInput {
            case "1":
                // 숫자 야구 게임 시작 및 시도 횟수 기록
                let record = baseballGame.start()
                gameRecord.addRecord(record)
            case "2":
                // 게임 기록 출력
                gameRecord.printRecords()
            case "3":
                // 게임 종료
                print("< 숫자 야구 게임을 종료합니다 >")
                isEnd = true
            default:
                // 잘못된 입력 처리
                print("올바른 숫자를 입력해주세요!\n")
            }
        }
    }
}
