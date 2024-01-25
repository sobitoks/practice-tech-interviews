<?php

function solution($A)
{
    $length = count($A);
    $moves = 0;

    if ($length === 0) {
        return $moves;
    }

    $sum = 0;

    for ($i = 0; $i < $length; $i++) {
        $sum += $A[$i];

        if (($sum < 0) || ($sum === 0 && ($i + 1) < $length && ($sum + $A[$i + 1]) < 0)) {
            $sum -= $A[$i];
            $A[] = $A[$i];
            unset($A[$i]);
            $moves++;
        }
    }

    return $moves;
}

$A1 = [10, -10, -1, -1, 10]; // 1
$moves = solution($A1);
//var_dump('Moves: ' . $moves . ' : Expected: 1');
echo $moves === 1 ? 'Pass' : 'Fail';
echo "\n";

// Test Case 2
$A2 = [-1, -1, -1, 1, 1, 1, 1]; // 3
$moves = solution($A2);
//var_dump('Moves: ' . $moves . ' : Expected: 3');
echo $moves === 3 ? 'Pass' : 'Fail';
echo "\n";

// Test Case 3
$A3 = [5, -2, -3, 1]; // 0
$moves = solution($A3);
//var_dump('Moves: ' . $moves . ' : Expected: 0');
echo $moves === 0 ? 'Pass' : 'Fail';
echo "\n";