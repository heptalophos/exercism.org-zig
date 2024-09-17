pub const Coordinate = struct {
    x: f32,
    y: f32,
    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate { .x = x_coord, .y = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const dist = @sqrt(self.x * self.x + self.y * self.y);
        var points: u8 = 0;
        if (dist <= 10) points += 1;
        if (dist <= 5)  points += 4;
        if (dist <= 1)  points += 5;
        return points;
    }
};
