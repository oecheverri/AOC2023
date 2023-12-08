import Foundation

let input = """
Time:        49     78     79     80
Distance:   298   1185   1066   1181
"""

let components = input.components(separatedBy: "\n")

if let timeStart = components[0].firstIndex(of: ":"),
      let distanceStart = components[1].firstIndex(of: ":"),
		let time = Int(components[0][timeStart..<components[0].endIndex].replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ":", with: "")),
		let distance = Int(components[1][distanceStart..<components[1].endIndex].replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ":", with: ""))
		{

			
			struct RaceDetails {
				let time: Int
				let recordDistance: Int
			}
			
			
			let race = RaceDetails(time: time, recordDistance: distance)
			
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
				return winningHoldTimes
			}
			
			let value = findWinningHoldTimes(for: race).count
			print(value)
		} else {
			print("You done fucked up")
		}