import 'package:tablitsacheyto/models/test.dart';

const tests = [
  Test(
    answer: '0',
    equesion: '-',
    n1: '11',
    n2: '11',
    answers: ['0', '22', '11', '5'],
  ),
  Test(
    answer: '13',
    equesion: '+',
    n1: '8',
    n2: '5',
    answers: ['13', '3', '1', '7'],
  ),

  Test(
    answer: '6',
    equesion: '+',
    n1: '3',
    n2: '3',
    answers: ['6', '9', '3', '0'],
  ),

  // Test 22 (Basic subtraction)
  Test(
    answer: '2',
    equesion: '-',
    n1: '5',
    n2: '3',
    answers: ['2', '8', '5', '1'],
  ),

  // Test 23 (Basic multiplication)
  Test(
    answer: '12',
    equesion: '*',
    n1: '3',
    n2: '4',
    answers: ['12', '7', '3', '0'],
  ),

  // Test 24 (Basic division)
  Test(
    answer: '5',
    equesion: '/',
    n1: '10',
    n2: '2',
    answers: ['5', '3', '10', '1'],
  ),

  // Test 25 (Negative addition)
  Test(
    answer: '-4',
    equesion: '+',
    n1: '-7',
    n2: '3',
    answers: ['-4', '10', '-7', '1'],
  ),

  // Test 26 (Negative subtraction)
  Test(
    answer: '-10',
    equesion: '-',
    n1: '-6',
    n2: '4',
    answers: ['-10', '2', '-6', '1'],
  ),

  // Test 27 (Negative multiplication)
  Test(
    answer: '-8',
    equesion: '*',
    n1: '4',
    n2: '-2',
    answers: ['-8', '6', '4', '0'],
  ),

  // Test 28 (Decimal division)
  Test(
    answer: '2.5',
    equesion: '/',
    n1: '5',
    n2: '2',
    answers: ['2.5', '3', '5', '0'],
  ),

  // Test 29 (Large addition)
  Test(
    answer: '1000',
    equesion: '+',
    n1: '999',
    n2: '1',
    answers: ['1000', '2000', '999', '1'],
  ),

  // Test 30 (Large subtraction)
  Test(
    answer: '500',
    equesion: '-',
    n1: '1000',
    n2: '500',
    answers: ['500', '1500', '1000', '1'],
  ),

  // Test 31 (Large multiplication)
  Test(
    answer: '5000',
    equesion: '*',
    n1: '100',
    n2: '50',
    answers: ['5000', '2500', '100', '1'],
  ),

  // Test 32 (Large division)
  Test(
    answer: '10',
    equesion: '/',
    n1: '100',
    n2: '10',
    answers: ['10', '100', '5', '1'],
  ),

  // Test 33 (Mixed operations)
  Test(
    answer: '15',
    equesion: '+',
    n1: '10',
    n2: '5',
    answers: ['15', '20', '10', '1'],
  ),

  // Test 34 (Mixed operations)
  Test(
    answer: '-2',
    equesion: '-',
    n1: '5',
    n2: '7',
    answers: ['-2', '2', '5', '1'],
  ),

  // Test 35 (Mixed operations)
  Test(
    answer: '24',
    equesion: '*',
    n1: '6',
    n2: '4',
    answers: ['24', '10', '6', '1'],
  ),

  // Test 36 (Mixed operations)
  Test(
    answer: '2',
    equesion: '/',
    n1: '4',
    n2: '2',
    answers: ['2', '1', '4', '0'],
  ),

  // Test 37 (Negative mixed operations)
  Test(
    answer: '-10',
    equesion: '+',
    n1: '-15',
    n2: '5',
    answers: ['-10', '-20', '-15', '1'],
  ),

  // Test 38 (Negative mixed operations)
  Test(
    answer: '-12',
    equesion: '-',
    n1: '-5',
    n2: '7',
    answers: ['-12', '-2', '-5', '1'],
  ),

  // Test 39 (Negative mixed operations)
  Test(
    answer: '10',
    equesion: '*',
    n1: '-5',
    n2: '-2',
    answers: ['10', '3', '-5', '1'],
  ),

  // Test 40 (Negative mixed operations)
  Test(
    answer: '-2.5',
    equesion: '/',
    n1: '5',
    n2: '-2',
    answers: ['-2.5', '2.5', '5', '0'],
  ),
// Test 4 (Subtracting zero)
  Test(
    answer: '100',
    equesion: '-',
    n1: '100',
    n2: '0.00',
    answers: ['10', '1000', '100', '0'],
  ),

// Test 6 (Negative sign)
  Test(
    answer: '7',
    equesion: '+',
    n1: '9',
    n2: '-2',
    answers: ['7', '11', '-2', '1'],
  ),

// Test 7 (Basic division)
  Test(
    answer: '16',
    equesion: '/',
    n1: '32',
    n2: '2',
    answers: ['16', '2', '34', '1'],
  ),

// Test 8 (Repeated numbers)
  Test(
    answer: '14',
    equesion: '+',
    n1: '7',
    n2: '7',
    answers: ['14', '49', '7', '1'],
  ),

// Test 9 (Decimal multiplication)
  Test(
    answer: '3',
    equesion: '*',
    n1: '1.5',
    n2: '2',
    answers: ['3', '1.5', '0.5', '1'],
  ),

// Test 10 (Basic subtraction)
  Test(
    answer: '4',
    equesion: '-',
    n1: '10',
    n2: '6',
    answers: ['4', '16', '10', '1'],
  ),

// Test 11 (Basic addition)
  Test(
    answer: '9',
    equesion: '+',
    n1: '4',
    n2: '5',
    answers: ['9', '1', '20', '4'],
  ),

  Test(
    answer: '21',
    equesion: '+',
    n1: '14',
    n2: '7',
    answers: ['21', '1', '7', '11'],
  ),

  Test(
    answer: '9',
    equesion: '-',
    n1: '7',
    n2: '-2',
    answers: ['9', '5', '7', '1'],
  ),
  Test(
    answer: '-7',
    equesion: '+',
    n1: '-5',
    n2: '-2',
    answers: ['-7', '3', '-5', '1'],
  ),
  Test(
    answer: '3',
    equesion: '*',
    n1: '1.5',
    n2: '2',
    answers: ['3', '1.5', '0.5', '1'],
  ),

  Test(
    answer: '4',
    equesion: '-',
    n1: '10',
    n2: '6',
    answers: ['4', '16', '10', '1'],
  ),

  Test(
    answer: '9',
    equesion: '+',
    n1: '4',
    n2: '5',
    answers: ['9', '1', '20', '4'],
  ),

  Test(
    answer: '21',
    equesion: '+',
    n1: '14',
    n2: '7',
    answers: ['21', '1', '7', '11'],
  ),

  Test(
    answer: '9',
    equesion: '-',
    n1: '7',
    n2: '-2',
    answers: ['9', '5', '7', '1'],
  ),
  Test(
    answer: '-7',
    equesion: '+',
    n1: '-5',
    n2: '-2',
    answers: ['-7', '3', '-5', '1'],
  ),
  Test(
    answer: '2',
    equesion: '-',
    n1: '7',
    n2: '5',
    answers: ['2', '12', '7', '1'],
  ),
  Test(
    answer: '18',
    equesion: '+',
    n1: '14',
    n2: '4',
    answers: ['18', '8', '14', '2'],
  ),
  Test(
    answer: '-1',
    equesion: '-',
    n1: '3',
    n2: '4',
    answers: ['-1', '7', '3', '1'],
  ),
];
