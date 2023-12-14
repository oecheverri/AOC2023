import Foundation

let sampleData = """
...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#.....
"""

let expandedSample = """
....#........
.........#...
#............
.............
.............
........#....
.#...........
............#
.............
.............
.........#...
#....#.......
"""

let puzzleInput = """
........#.........................................................................................................#..................#......
.............#.......................#....................................#......#......................#.......................#...........
...............................#...........#...........................................................................#....................
.........................#...........................#.......................................#...........................................#..
.....#...............................................................................#......................................................
....................................................................................................................................#.......
...........................................................#..............................#................#.......#........................
..........#..........#............#..................................#......#...............................................................
.........................................#..................................................................................................
#..............#.............#.......................#........................................#.......................#.....................
......#..........................................................................#......#...........#.......................................
................................................................................................................#...........................
............#...........#...............................#..............#...................................#................................
....................................#................................................#.....................................#................
...#.............#..............................................#...........................................................................
.......................................................................................................#....................................
.........#.....................#...............................................................#............................................
.........................................................................................................................................#..
#...............................................................................#.....................................#.....................
......#...........#.................#..........#.........................................#..................................................
...........#............#..............................#..............#..........................................#..........................
...................................................................................#..............#...........................#.............
..................................................#.........................................................................................
.............................................#............................................................................#.............#...
.........................................................................................................#..................................
.....#........................#...........................#.....#..............#............#...............................................
................#................................................................................................................#..........
................................................#.............................................................#.............................
..........................#..........#.......................#.....................#.....#...........#......................................
............#......#........................#.....................#.....#.....................#........................#...................#
............................................................................................................................................
................................#.......................#...................................................................#...............
.....#...................................#...................................................................#........................#.....
....................................#.......................#...............................................................................
.............................................#................................#................#................................#...........
#.....................#.................................................#............................#......................................
.....................................................#............................................................#.......#.........#.......
..................#............................................#...........................................................................#
...............................#.......#..................................................................#.................................
............#..............................................................#.................................................#..............
...................................#........................................................#...............................................
#....................#......................................................................................................................
......#....................................................#.......................................#........................................
...................................................................#...........#...............................................#.....#......
.............................#..................#................................................................#..........................
...................#...............................................................#......................................#.................
............................................................................................................................................
............................................#....................#.................................................................#........
........#......#...............#.......#...........#.........................................#..............................................
........................................................................................#.........#........#................................
............................................................................................................................................
..#..............................................................................#..........................................................
..................................#.......................#.............................................#........#.....................#....
.............#...............#..............#.....................................................................................#.........
............................................................................................................................................
.....................................#.............................#....................#...................................................
..........#.................................................................................................................................
.....#...........................#.......#...............................#..........#........#...............#.....#......#.................
................................................#..................................................#........................................
#.......................................................................................................................................#...
............................................................................................................................................
.....................#................................#........................................#...........#................................
...........#..............#..........................................#......................................................................
....................................#...........................#...............#....................#................#............#......#.
......#..............................................................................#......................................#...............
..............#.................#..............#..........................................#.................................................
...........................................................#.............#..................................................................
.#......................................................................................................................................#...
...............................................................................#.........................#.....#..................#.........
.................................................................#...............................#...................#......................
.......#.........#.....#..................#..........#...............................#......................................................
...........................................................................................................................#................
.............................#........#......................#..............................................#............................#..
........................................................#..........................................#...............#........................
...............................................................................#...................................................#........
............#...................#.......................................................................#...................................
......#....................#................#.........................#.................#.....#.............................................
...................................................#........................................................................................
.....................#...............#.....................................#.............................................#.................#
.........#.........................................................#.................................#......................................
............................................................................................................................................
............................................................................................................................................
.....#...........................................#..........#.....................................#.......#.................................
........................#......#............................................................................................................
..............................................................................#..............#........#.....................................
#.................#.........................#......................................................................#........................
.............#.........................#..................#........................#......................................#.................
........................................................................#...................................................................
....#...................................................................................................#.................................#.
.....................#.............................................#............#.......#.......................................#...........
...............................................#............#..................................#............................................
..............#................#...........................................#............................................#...................
.#.....#....................................................................................................................................
...........................#........#..................#.........#..................................................................#.......
...............................................................................................................................#............
....................#......................#.......................................#...........................#............................
..........#........................................#..........#...............#...................#.........................................
..................................#......................................................................#.................#................
.......................#......................................................................#......................#......................
..................#............................#.................#......#...................................................................
.................................................................................#.............................................#............
............#.................#......#..............................................................................................#.....#.
#.....................................................#....................#.........#..........................#...........................
.....#.....................................#................#...............................................................................
..................................#.........................................................................................#..........#....
................#.......................................................................#......#............................................
........................................#...................................................................................................
.........#.............#.......................#.......................................................#............................#.......
..............................................................................#.............................................................
#.............................#....................................................#........................................................
......................................#.....................#.....................................................#..............#..........
..................................................................#.......................#................#...............................#
...................#..............#...................#..............................................#..................#...................
................................................................................................#...........................................
.......#.....#..............................................................................................................................
..................................................#.................................................................................#.......
......................#..................#........................................#....................#......#...........................#.
.......................................................#.................#................#................................#................
...........................#.......................................#................................................#.......................
.................................................................................................................................#..........
......#..........................................#.............................#......................................................#.....
...................#....................#............................................#..........#...........................................
...........#.........................................#...........#..........................................#...............................
..#..............................#.........................................#...........................................#....................
......................................................................#.................#...................................................
.......................#...................................................................................................#................
...........................................................#......................#..................#........#.............................
.....#................................#.....#.......................................................................#..............#........
#...............................#........................................#.......................#..........................................
........................................................................................................................#...................
.........................................#..................................................................................................
............#.....................................#..................#......#................#........................................#.....
........................................................#......#.......................................#....................................
........#.........#..................#..................................................#.......................#...........................
................................................................................#........................................#.........#........
............................................................................................................#.................#.............
........................................#......#............................................................................................
....................#..............................................................#............#......................................#....
.........#.....................#.........................................#.............................#.......#............................
...#......................#............................#........#......................#...............................#..........#.........
"""

struct Coordinates: Equatable {
    let x: Int
    let y: Int
}

enum SpaceObjectType: String, Equatable, CustomStringConvertible {
    case galaxy = "#"
    case vacuum = "."
    
    init?(from value: Character) {
        self.init(rawValue: String(value))
    }
    
    var description: String {
        switch self {
            case .galaxy:
                return "🪐"
            case .vacuum:
             return "◼️"
        }
    }
}

struct SpaceObject: Equatable, CustomStringConvertible {
    
    var coordinates: Coordinates
    let type: SpaceObjectType
    
    init?(from value: Character, x: Int, y: Int) {
        self.init(from: value, at: .init(x: x, y: y))
    }
    
    init?(from value: Character, at coordinates: Coordinates) {
        guard let type = SpaceObjectType(from: value) else { return nil }
        self.init(type, at: coordinates)
    }
    
    init(_ type: SpaceObjectType, at coordinates: Coordinates) {
        self.type = type
        self.coordinates = coordinates
    }
    
    var isGalaxy: Bool {
        type == .galaxy
    }
    
    var description: String {
        "\(type)"
    }
    
    func stepsBetween(_ object: SpaceObject) -> Int {
        abs(coordinates.x - object.coordinates.x) + abs(coordinates.y - object.coordinates.y)
    }
}

typealias Universe = [[SpaceObject]]

extension Universe {
    var galaxies: [SpaceObject] {
        flatMap{ $0.filter(\.isGalaxy) }
    }
    
    func print() {
        for row in universe {
            var rowText = ""
            for object in row {
                rowText.append(object.description)
            }
            Swift.print(rowText)
        }
    }
    
    func getColumn(at index: Int) -> [SpaceObject] {
        flatMap{ $0.filter{ $0.coordinates.x == index } }
    }
    
    
    mutating func insertColumn(objects: [SpaceObject], at column: Int) {
        for (rowIndex, var row) in enumerated() {
            row.insert(objects[rowIndex], at: column)
            self[rowIndex] = row
        }
    }
}

let input = puzzleInput

let universe = input.components(separatedBy: "\n")
                            .enumerated().map {y, rowString in
                                rowString.enumerated()
                                .compactMap {x, value in
                                    SpaceObject.init(from: value, x: x, y: y)
                                }
                            }

let sampleExpandedUniverse: Universe = expandedSample.components(separatedBy: "\n")
.enumerated().map {y, rowString in
    rowString.enumerated()
    .compactMap {x, value in
        SpaceObject.init(from: value, x: x, y: y)
    }
}

func hasGalaxy(objects: [SpaceObject]) -> Bool {
    for object in objects {
        if object.isGalaxy {
            return true
        }
    }
    return false
}

func expandUniverse(currentState universe: Universe) -> Universe {
    var expandedUniverse = [[SpaceObject]]()
    
    for row in universe {
        expandedUniverse.append(row)
        if !hasGalaxy(objects: row) {
            expandedUniverse.append(row)
        }
    }
    
    for column in stride(from: expandedUniverse[0].endIndex - 1, through: 0, by: -1) {
        let columnObjects = expandedUniverse.getColumn(at: column)
        if !hasGalaxy(objects: columnObjects) {
            expandedUniverse.insertColumn(objects: columnObjects, at: column)
        }
    }
    
    for (rowIndex, var row) in expandedUniverse.enumerated() {
        for (column, var object) in expandedUniverse[rowIndex].enumerated() {
            object.coordinates = .init(x: column, y: rowIndex)
            row[column] = object
        }
        expandedUniverse[rowIndex] = row
    }
    return expandedUniverse
}

let expandedUniverse = expandUniverse(currentState: universe)
let sum = expandedUniverse.galaxies.map { galaxy in
    expandedUniverse.galaxies.reduce(0) {
        $0 + galaxy.stepsBetween($1)
    }
}.reduce(0) {$0 + $1} / 2

print(sum)
