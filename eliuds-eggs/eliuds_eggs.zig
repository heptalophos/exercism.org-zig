pub fn eggCount(number: usize) usize {
    var n: usize = number;
    var count: usize = 0;
    while (n > 0) {
        count += 1;
        n &= n - 1;
    }
    return count;
    ////////// OR using tail recursion //////////////////////
    //                                                     //
    // if (number == 0) return 0;                          //
    // return (1 & number) + eggCount(number >> 1);        //
    //                                                     //  
    // In general though, the loop above is more efficient //

}
