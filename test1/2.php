<?php

function solution($blocks): int
{
    $length = count($blocks);
    $distanceApart = move(0, $blocks, $length);

    for ($i = 1; ($i < count($blocks) - 1); $i++) {
        $tmp = move($i, $blocks, $length);
        if ($tmp > $distanceApart) {
            $distanceApart = $tmp;
        }
    }

    return $distanceApart;
}

function move($optimalStartingPoint, $blocks, $length)
{
    $movesLeft = 0;
    $movesRight = 0;

    //left
    $i = $optimalStartingPoint;
    while (0 < $i && ($blocks[$i-1] >= $blocks[$i])) {
        $movesLeft++;
        $i--;
    }

    // right
    $i = $optimalStartingPoint;
    while ($length-1 > $i && ($blocks[$i+1] >= $blocks[$i])) {
        $movesRight++;
        $i++;
    }

    return $movesLeft + $movesRight + 1;
}

$blocks = [2, 6, 8, 5]; // return 3
$result = solution($blocks);
var_dump('Blocks away: ' . $result . ' : Expected: 3');

$blocks = [1, 5, 5, 2, 6]; // return 4
$result = solution($blocks);
var_dump('Blocks away: ' . $result . ' : Expected: 4');

$blocks = [1, 1]; // return 2
$result = solution($blocks);
var_dump('Blocks away: ' . $result . ' : Expected: 2');


