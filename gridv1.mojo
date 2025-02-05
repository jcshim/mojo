import random

@value
struct Grid(StringableRaising):
    var rows: Int
    var cols: Int
    var data: List[List[Int]]

    # Grid 인스턴스를 문자열로 표현하는 메서드
    def __str__(self) -> String:
        var s: String = ""
        for row in range(self.rows):
            for col in range(self.cols):
                if self[row, col] == 1:
                    s += "*"
                else:
                    s += " "
            if row != self.rows - 1:
                s += "\n"
        return s

    # 인덱싱 지원: grid[row, col] 문법으로 셀 값 접근
    def __getitem__(self, row: Int, col: Int) -> Int:
        return self.data[row][col]

    # 인덱싱 대입 지원: grid[row, col] = value 문법
    def __setitem__(mut self, row: Int, col: Int, value: Int) -> None:
        self.data[row][col] = value

    # 정적 메서드: 랜덤한 Grid 생성
    @staticmethod
    def random(rows: Int, cols: Int) -> Self:
        random.seed()  # 매번 다른 결과를 위해 현재 시간을 기반으로 시드 설정
        var data: List[List[Int]] = List[List[Int]]()
        for row in range(rows):
            var row_data: List[Int] = List[Int]()
            for col in range(cols):
                # 0 또는 1을 랜덤하게 생성
                row_data.append(Int(random.random_si64(0, 1)))
            data.append(row_data)
        return Self(rows, cols, data)

    # 게임 오브 라이프 규칙에 따라 다음 세대로 진화
    def evolve(self) -> Self:
        var next_generation: List[List[Int]] = List[List[Int]]()
        for row in range(self.rows):
            var row_data: List[Int] = List[Int]()
            var row_above: Int = (row - 1) % self.rows
            var row_below: Int = (row + 1) % self.rows
            for col in range(self.cols):
                var col_left: Int = (col - 1) % self.cols
                var col_right: Int = (col + 1) % self.cols

                var num_neighbors: Int = (
                    self[row_above, col_left] +
                    self[row_above, col] +
                    self[row_above, col_right] +
                    self[row, col_left] +
                    self[row, col_right] +
                    self[row_below, col_left] +
                    self[row_below, col] +
                    self[row_below, col_right]
                )

                var new_state: Int = 0
                if self[row, col] == 1 and (num_neighbors == 2 or num_neighbors == 3):
                    new_state = 1
                elif self[row, col] == 0 and num_neighbors == 3:
                    new_state = 1

                row_data.append(new_state)
            next_generation.append(row_data)
        return Self(self.rows, self.cols, next_generation)
