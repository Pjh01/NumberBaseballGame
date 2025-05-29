class GameManagement {
    let baseballGame = BaseballGame()
    
    func startGame() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            guard let userInput = readLine() else {
                print("올바른 숫자를 입력해주세요!\n")
                continue
            }
            
            switch userInput {
            case "1":
                baseballGame.start()
            //case "2":
                //
            //case "3":
                //
            default:
                print("올바른 숫자를 입력해주세요!\n")
            }
        }
    }
}
