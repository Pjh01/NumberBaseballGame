// 게임 기록 관리 클래스
class GameRecord {
    var gameRecords: [Int] = []
    
    // 게임 기록 추가 메서드
    func addRecord(_ record: Int) {
        gameRecords.append(record)
    }
    
    // 저장된 게임 기록 출력 메서드
    func printRecords() {
        print("< 게임 기록 보기 >")
        
        if gameRecords.isEmpty {
            print("기록된 게임이 없습니다\n")
        } else {
            let result = gameRecords.enumerated()
                .map { "\($0.offset + 1)번째 게임: 시도 횟수 - \($0.element)" }
                .joined(separator: "\n")
            print(result + "\n")
        }
    }
}
