pub const QueenError = error{ InitializationFailure };

pub const Queen = struct {
    rank: i8,
    file: i8,
    pub fn init(row: i8, col: i8) QueenError!Queen {
        if (row < 0 or col < 0 or row > 7 or col > 7) {
            return QueenError.InitializationFailure;
        }
        return Queen{.rank = row, .file = col};        
    }
    pub fn canAttack(self: Queen, other: Queen) QueenError!bool {
        const drank = @abs(self.rank - other.rank);
        const dfile = @abs(self.file - other.file);
        return (drank * dfile == 0) or (drank / dfile == 1);
    }
};
