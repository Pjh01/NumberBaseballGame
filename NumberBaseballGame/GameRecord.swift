class GameRecord {
    var gameRecords: [Int] = []
    
    func addRecord(_ record: Int) {
        gameRecords.append(record)
    }
    
    func printRecords() {
        print("< 게임 기록 보기 >")
        
        if gameRecords.isEmpty {
            print("기록된 게임이 없습니다\n")
        } else {
            var result = ""
            for (index, record) in gameRecords.enumerated() {
                result += "\(index + 1)번째 게임: 시도 횟수 - \(record)\n"
            }
            print(result)
        }
    }
}
