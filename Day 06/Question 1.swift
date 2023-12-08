import Foundation

let input = """
Time:        49     78     79     80
Distance:   298   1185   1066   1181
"""

let components = input.components(separatedBy: "\n")

if let timeStart = components[0].firstIndex(of: ":"),
      let distanceStart = components[1].firstIndex(of: ":")
		{
			let times = components[0][timeStart..<components[0].endIndex].trimmingCharacters(in: .whitespaces).components(separatedBy: " ").compactMap(Int.init)
			let distances = components[1][distanceStart..<components[1].endIndex].trimmingCharacters(in: .whitespaces).components(separatedBy: " ").compactMap(Int.init)
			
			struct RaceDetails {
				let time: Int
				let recordDistance: Int
			}
			
			
			let raceDetails = times.enumerated().reduce([RaceDetails]()) {
				var res = $0
				res.append(.init(time: $1.element, recordDistance: distances[$1.offset]))
				return res
			}		
			
			func calculateDistance(for heldTime: Int, totalTime: Int) -> Int {
				totalTime*heldTime - Int(truncating: NSDecimalNumber(decimal: pow(.init(heldTime), 2)))
			}
			
			func findWinningHoldTimes(for race: RaceDetails) -> [Int] {
				var winningHoldTimes = [Int]()
				
				for holdTime in 1..<race.time {
					if calculateDistance(for: holdTime, totalTime: race.time) > race.recordDistance {
						winningHoldTimes.append(holdTime)
					}
				}
				
				print(winningHoldTimes)
				return winningHoldTimes
			}
			
			let value = raceDetails.reduce(1) {
				$0 * findWinningHoldTimes(for: $1).count
			}
			
			print(value)
		} else {
			print("You done fucked up")
		}