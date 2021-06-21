import Foundation

class CoronaClass {
    
    var seats = [Int]()
    var numberOfSeats: Int
    var safestDistance = -100000
    var middleIndex = -1000000
    var enumeratedTables = [Int]()
    
     init(n: Int) {
        self.numberOfSeats = n
        self.enumeratedTables = Array(0..<numberOfSeats)
     }
    
     func seat() -> Int {
    
        if numberOfSeats >= 1 && numberOfSeats <= 100 {
            
            for _ in enumeratedTables {
                if seats.isEmpty {
                    seats.append(0)
                    enumeratedTables.remove(at: 0)
                    return 0
                }
                if seats.count == 1 {
                    safestDistance = enumeratedTables.max() ?? 0
                    seats.append(safestDistance)
                    enumeratedTables.remove(at: (safestDistance - 1))
                    return safestDistance
                }
                
                if seats.count >= 2 {
                    
                    if enumeratedTables.count % 2 != 0 {
                        seats.append(enumeratedTables.count / 2 + 1)
                        enumeratedTables.removeSubrange((enumeratedTables.count / 2 + 1) ..< enumeratedTables.count)
                    } else if enumeratedTables.count % 2 == 0 {
                        seats.append(enumeratedTables[enumeratedTables.count / 2 - 1])
                        enumeratedTables.removeSubrange((enumeratedTables.count / 2 - 1) ..< enumeratedTables.count)
                    }
                    
                }
                
                seats.sort()
                
                var seatNumber: Int?
                for x in 0..<seats.count {
                    seatNumber = seats[x]
                }
                return seatNumber ?? 0
            }
        }
        return -1
     }
     
     func leave(_ p: Int) {
        seats = seats.filter { $0 != p }
     }
}
