/// An API for solving Dice Nets puzzles.
library dicenets;

//import 'dart:collection';
import 'dart:math';

import 'package:powers/powers.dart';
import 'package:dicenets/clue.dart';
import 'package:dicenets/puzzle.dart';

/// Provide access to the Prime Cuts API.
class dicenets {
  Puzzle puzzle = Puzzle();

  static const bool traceInit = false;
  static const bool traceSolve = true;

  late final Clue a1;
  late final Clue a4;
  late final Clue a8;
  late final Clue a10;
  late final Clue a12;
  late final Clue a14;
  late final Clue a16;
  late final Clue a17;
  late final Clue a18;
  late final Clue a19;
  late final Clue a21;
  late final Clue a23;
  late final Clue a25;
  late final Clue a27;
  late final Clue a29;
  late final Clue a30;
  late final Clue a31;
  late final Clue a33;
  late final Clue a35;
  late final Clue a36;

  late final Clue d1;
  late final Clue d2;
  late final Clue d3;
  late final Clue d5;
  late final Clue d6;
  late final Clue d7;
  late final Clue d9;
  late final Clue d11;
  late final Clue d13;
  late final Clue d15;
  late final Clue d18;
  late final Clue d20;
  late final Clue d22;
  late final Clue d24;
  late final Clue d26;
  late final Clue d28;
  late final Clue d32;
  late final Clue d34;

  dicenets() {
    try {
      _initdicenets();
    } catch (e, stack) {
      print('error=$e, stack=$stack');
    }
  }

  void _initdicenets() {
    a1 = Clue(name: 'A1', length: 4, valueDesc: 'Prime', solve: solveA1);
    puzzle.addClue(a1);
    a4 = Clue(name: 'A4', length: 4, valueDesc: 'Power', solve: solveA4);
    puzzle.addClue(a4);
    a8 = Clue(
        name: 'A8', length: 4, valueDesc: 'Triangular - A18', solve: solveA8);
    puzzle.addClue(a8);
    a10 = Clue(
        name: 'A10', length: 3, valueDesc: 'Multiple of D34', solve: solveA10);
    puzzle.addClue(a10);
    a12 =
        Clue(name: 'A12', length: 3, valueDesc: 'Even Square', solve: solveA12);
    puzzle.addClue(a12);
    a14 =
        Clue(name: 'A14', length: 2, valueDesc: 'Triangular', solve: solveA14);
    puzzle.addClue(a14);
    a16 = Clue(
        name: 'A16', length: 3, valueDesc: 'Triangular - A31', solve: solveA16);
    puzzle.addClue(a16);
    a17 = Clue(
        name: 'A17', length: 4, valueDesc: 'Multiple of D7', solve: solveA17);
    puzzle.addClue(a17);
    a18 =
        Clue(name: 'A18', length: 5, valueDesc: 'Triangular', solve: solveA18);
    puzzle.addClue(a18);
    a19 = Clue(
        name: 'A19', length: 2, valueDesc: 'Triangular - A29', solve: solveA19);
    puzzle.addClue(a19);
    a21 = Clue(name: 'A21', length: 2, valueDesc: 'Power', solve: solveA21);
    puzzle.addClue(a21);
    a23 = Clue(
        name: 'A23', length: 5, valueDesc: 'Multiple of D32', solve: solveA23);
    puzzle.addClue(a23);
    a25 = Clue(name: 'A25', length: 4, valueDesc: 'Prime', solve: solveA25);
    puzzle.addClue(a25);
    a27 = Clue(
        name: 'A27', length: 3, valueDesc: 'Square - A16', solve: solveA27);
    puzzle.addClue(a27);
    a29 = Clue(
        name: 'A29',
        length: 2,
        valueDesc: 'Multiple of a Power',
        solve: solveA29);
    puzzle.addClue(a29);
    a30 = Clue(
        name: 'A30', length: 3, valueDesc: 'Square + D24', solve: solveA30);
    puzzle.addClue(a30);
    a31 = Clue(
        name: 'A31', length: 3, valueDesc: 'Square - A16', solve: solveA31);
    puzzle.addClue(a31);
    a33 = Clue(
        name: 'A33', length: 4, valueDesc: 'Multiple of A30', solve: solveA33);
    puzzle.addClue(a33);
    a35 =
        Clue(name: 'A35', length: 4, valueDesc: 'Triangular', solve: solveA35);
    puzzle.addClue(a35);
    a36 = Clue(
        name: 'A36', length: 4, valueDesc: 'Jumble of D1', solve: solveA36);
    puzzle.addClue(a36);

    d1 = Clue(name: 'D1', length: 4, valueDesc: 'Square', solve: solveD1);
    puzzle.addClue(d1);
    d2 = Clue(name: 'D2', length: 6, valueDesc: 'Square', solve: solveD2);
    puzzle.addClue(d2);
    d3 = Clue(
        name: 'D3',
        length: 2,
        valueDesc: 'Product 3 distinct Primes',
        solve: solveD3);
    puzzle.addClue(d3);
    d5 = Clue(
        name: 'D5',
        length: 5,
        valueDesc: 'Product 3 distinct Primes',
        solve: solveD5);
    puzzle.addClue(d5);
    d6 = Clue(name: 'D6', length: 4, valueDesc: 'D7 + D18', solve: solveD6);
    puzzle.addClue(d6);
    d7 = Clue(name: 'D7', length: 2, valueDesc: 'Power', solve: solveD7);
    puzzle.addClue(d7);
    d9 = Clue(name: 'D9', length: 7, valueDesc: 'Triangular', solve: solveD9);
    puzzle.addClue(d9);
    d11 = Clue(
        name: 'D11', length: 3, valueDesc: 'Twice a Square', solve: solveD11);
    puzzle.addClue(d11);
    d13 = Clue(name: 'D13', length: 7, valueDesc: 'Square', solve: solveD13);
    puzzle.addClue(d13);
    d15 = Clue(name: 'D15', length: 4, valueDesc: 'Square', solve: solveD15);
    puzzle.addClue(d15);
    d18 = Clue(name: 'D18', length: 4, valueDesc: 'Power', solve: solveD18);
    puzzle.addClue(d18);
    d20 = Clue(name: 'D20', length: 6, valueDesc: 'Square', solve: solveD20);
    puzzle.addClue(d20);
    d22 = Clue(
        name: 'D22',
        length: 5,
        valueDesc: 'Multiple of Square of D32',
        solve: solveD22);
    puzzle.addClue(d22);
    d24 = Clue(
        name: 'D24',
        length: 3,
        valueDesc: 'Sum of 2 consecutive Squares',
        solve: solveD24);
    puzzle.addClue(d24);
    d26 = Clue(
        name: 'D26',
        length: 4,
        valueDesc: 'Half of a Triangular',
        solve: solveD26);
    puzzle.addClue(d26);
    d28 = Clue(name: 'D28', length: 4, valueDesc: 'Square', solve: solveD28);
    puzzle.addClue(d28);
    d32 = Clue(name: 'D32', length: 2, valueDesc: 'A19 - D7', solve: solveD32);
    puzzle.addClue(d32);
    d34 = Clue(name: 'D34', length: 2, valueDesc: 'Prime', solve: solveD34);
    puzzle.addClue(d34);

    puzzle.addDigitIdentity(a1, 1, d1, 1);
    puzzle.addDigitIdentity(a1, 2, d2, 1);
    puzzle.addDigitIdentity(a1, 3, d3, 1);
    puzzle.addDigitIdentity(a4, 2, d5, 1);
    puzzle.addDigitIdentity(a4, 3, d6, 1);
    puzzle.addDigitIdentity(a4, 4, d7, 1);
    puzzle.addDigitIdentity(a8, 1, d3, 2);
    puzzle.addDigitIdentity(a8, 2, d9, 1);
    puzzle.addDigitIdentity(a8, 4, d5, 2);
    puzzle.addDigitIdentity(a10, 1, d1, 3);
    puzzle.addDigitIdentity(a10, 2, d2, 3);
    puzzle.addDigitIdentity(a10, 3, d11, 1);
    puzzle.addDigitIdentity(a12, 1, d9, 2);
    puzzle.addDigitIdentity(a12, 2, d13, 1);
    puzzle.addDigitIdentity(a12, 3, d5, 3);
    puzzle.addDigitIdentity(a14, 1, d6, 3);
    puzzle.addDigitIdentity(a14, 2, d15, 1);
    puzzle.addDigitIdentity(a16, 1, d1, 4);
    puzzle.addDigitIdentity(a16, 2, d2, 4);
    puzzle.addDigitIdentity(a16, 3, d11, 2);
    puzzle.addDigitIdentity(a17, 1, d13, 2);
    puzzle.addDigitIdentity(a17, 2, d5, 4);
    puzzle.addDigitIdentity(a17, 3, d6, 4);
    puzzle.addDigitIdentity(a17, 4, d15, 2);
    puzzle.addDigitIdentity(a18, 2, d2, 5);
    puzzle.addDigitIdentity(a18, 3, d11, 3);
    puzzle.addDigitIdentity(a18, 4, d9, 4);
    puzzle.addDigitIdentity(a18, 5, d13, 3);
    puzzle.addDigitIdentity(a19, 1, d5, 5);
    puzzle.addDigitIdentity(a19, 2, d20, 1);
    puzzle.addDigitIdentity(a21, 1, d2, 6);
    puzzle.addDigitIdentity(a21, 2, d22, 1);
    puzzle.addDigitIdentity(a23, 1, d9, 5);
    puzzle.addDigitIdentity(a23, 2, d13, 4);
    puzzle.addDigitIdentity(a23, 3, d24, 1);
    puzzle.addDigitIdentity(a23, 4, d20, 2);
    puzzle.addDigitIdentity(a23, 5, d15, 4);
    puzzle.addDigitIdentity(a25, 1, d18, 3);
    puzzle.addDigitIdentity(a25, 2, d26, 1);
    puzzle.addDigitIdentity(a25, 3, d22, 2);
    puzzle.addDigitIdentity(a25, 4, d9, 6);
    puzzle.addDigitIdentity(a27, 1, d24, 2);
    puzzle.addDigitIdentity(a27, 2, d20, 3);
    puzzle.addDigitIdentity(a27, 3, d28, 1);
    puzzle.addDigitIdentity(a29, 1, d18, 4);
    puzzle.addDigitIdentity(a29, 2, d26, 2);
    puzzle.addDigitIdentity(a30, 1, d22, 3);
    puzzle.addDigitIdentity(a30, 2, d9, 7);
    puzzle.addDigitIdentity(a30, 3, d13, 6);
    puzzle.addDigitIdentity(a31, 1, d24, 3);
    puzzle.addDigitIdentity(a31, 2, d20, 4);
    puzzle.addDigitIdentity(a31, 3, d28, 2);
    puzzle.addDigitIdentity(a33, 1, d22, 4);
    puzzle.addDigitIdentity(a33, 3, d13, 7);
    puzzle.addDigitIdentity(a33, 4, d34, 1);
    puzzle.addDigitIdentity(a35, 1, d32, 2);
    puzzle.addDigitIdentity(a35, 2, d26, 4);
    puzzle.addDigitIdentity(a35, 3, d22, 5);
    puzzle.addDigitIdentity(a36, 2, d34, 2);
    puzzle.addDigitIdentity(a36, 3, d20, 6);
    puzzle.addDigitIdentity(a36, 4, d28, 4);

    puzzle.addReference(a8, a18, false);
    puzzle.addReference(a10, d34, false);
    puzzle.addReference(a16, a31, false);
    puzzle.addReference(a17, d7, false);
    puzzle.addReference(a19, a29, false);
    puzzle.addReference(a23, d32, false);
    puzzle.addReference(a27, a16, false);
    puzzle.addReference(a30, d24, false);
    puzzle.addReference(a31, a16, false);
    puzzle.addReference(a33, a30, false);
    puzzle.addReference(a36, d1, true);
    puzzle.addReference(d6, d7, false);
    puzzle.addReference(d6, d18, false);
    puzzle.addReference(d22, d32, false);
    puzzle.addReference(d32, a19, false);
    puzzle.addReference(d32, d7, false);

    if (traceInit) {
      print(puzzle.toString());
    }
  }

  List<Clue> updateQueue = [];

  void addToUpdateQueue(Clue clue) {
    if (!updateQueue.contains(clue)) {
      updateQueue.add(clue);
    }
  }

  void solve() {
    bool updated;
    var iterations = 0;
    // Manual Clue iterations=298 (143 updates) instead of 311 (144 updates)
    // updateQueue = [
    //   a4,
    //   a12,
    //   a14,
    //   a21,
    //   a29,
    //   d7,
    //   d11,
    //   d15,
    //   d18,
    //   d24,
    //   d26,
    //   d34,
    //   d18,
    //   d6,
    //   a35,
    //   d32,
    //   a1,
    //   a19,
    //   a25,
    //   a17,
    //   a30,
    //   a33,
    //   d2,
    //   d22
    // ];

    var allClue = List<Clue>.from(puzzle.clues.values).toList();
    updateQueue
        .addAll(allClue.where((element) => !updateQueue.contains(element)));

    if (traceSolve) {
      print("UPDATES-----------------------------");
    }

    while (updateQueue.length > 0) {
      Clue clue = updateQueue.removeAt(0);
      iterations++;
      updated = solveClue(clue);
      if (updated) {
        for (var referrer in clue.referrers) {
          addToUpdateQueue(referrer);
        }
      }
    }
    print('Clue iterations=$iterations');

    if (traceSolve) {
      print("PARTIAL SOLUTION-----------------------------");
      print(puzzle.toSummary());
      // print(puzzle.toString());
    }

    print("ITERATE SOLUTIONS-----------------------------");
    var count = puzzle.iterate();
    print('Solution count=$count');

    if (traceSolve) {
      print("SOLUTION-----------------------------");
      print(puzzle.lastSolutionToString());
      // print(puzzle.toString());
    }
  }

  bool solveClue(Clue clue) {
    // If clue solved already then skip it
    if (clue.values != null && clue.values!.length == 1) return false;

    var updated = false;
    if (clue.initialise()) updated = true;

    if (clue.solve != null) {
      var possibleValue = <int>{};
      if (clue.solve!(clue, possibleValue)) updated = true;
      // If no Values returned then Solve function could not solve
      if (possibleValue.isNotEmpty) {
        if (clue.updateValues(possibleValue)) updated = true;
        if (clue.finalise()) updated = true;
      }
    }

    if (traceSolve && updated) {
      print("solve: ${clue.toSummary()}");
    }
    return updated;
  }

  static List<int> filterDice(Iterable<int> values) {
    List<int> dice = [];
    for (var value in values) {
      var ok = true;
      for (var digit in value.toString().split('')) {
        if ("7890".contains(digit)) {
          ok = false;
          break;
        }
      }
      if (ok) dice.add(value);
    }
    return dice;
  }

  static void filterDigits(
      Clue clue, List<int> values, Set<int> possibleValue) {
    for (var value in values) {
      if (clue.digitsMatch(value)) {
        possibleValue.add(value);
      }
    }
  }

  static void filterDiceDigits(
      Clue clue, List<int> values, Set<int> possibleValue) {
    filterDigits(clue, filterDice(values), possibleValue);
  }

  bool solveA1(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFourDigitPrimes(), possibleValue);
    return false;
  }

  bool solveA4(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFourDigitPowers(), possibleValue);
    return false;
  }

  bool solveA8(Clue clue, Set<int> possibleValue) {
    findTriangularsLessClue(clue, a18, possibleValue);
    return false;
  }

  bool solveA10(Clue clue, Set<int> possibleValue) {
    findMultiplesOfClue(clue, d34, possibleValue);
    return false;
  }

  bool solveA12(Clue clue, Set<int> possibleValue) {
    var values = filterDice(getThreeDigitSquares());
    values.removeWhere((value) => value % 2 == 1);
    filterDigits(clue, values, possibleValue);
    return false;
  }

  bool solveA14(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getTwoDigitTriangles(), possibleValue);
    return false;
  }

  bool solveA16(Clue clue, Set<int> possibleValue) {
    if (a31.values != null) {
      if (a31.values!.length == 13) {
        var b = true;
      }
      findTriangularsLessClue(clue, a31, possibleValue);
    } else {
      // A16 and A31 are mutually referential, so need a way to get started
      var values = getValuesFromClueDigits(a31);
      if (values != null) {
        findTriangularsLessValues(clue, values, possibleValue);
      }
    }
    return false;
  }

  Set<int>? getValuesFromClueDigits(Clue clue) {
    var numValues = 1;
    for (var d = 0; d < clue.length; d++) {
      numValues *= clue.digits[d].length;
    }
    if (numValues >= 100) return null;
    var values = <int>{};
    for (var d1 in clue.digits[0]) {
      for (var d2 in clue.digits[1]) {
        for (var d3 in clue.digits[2]) {
          var value = d3 + 10 * (d2 + 10 * d1);
          values.add(value);
        }
      }
    }
    return values;
  }

  bool solveA17(Clue clue, Set<int> possibleValue) {
    findMultiplesOfClue(clue, d7, possibleValue);
    return false;
  }

  bool solveA18(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFiveDigitTriangles(), possibleValue);
    return false;
  }

  bool solveA19(Clue clue, Set<int> possibleValue) {
    findTriangularsLessClue(clue, a29, possibleValue);
    return false;
  }

  bool solveA21(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getTwoDigitPowers(), possibleValue);
    return false;
  }

  bool solveA23(Clue clue, Set<int> possibleValue) {
    findMultiplesOfClue(clue, d32, possibleValue);
    return false;
  }

  bool solveA25(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFourDigitPrimes(), possibleValue);
    return false;
  }

  bool solveA27(Clue clue, Set<int> possibleValue) {
    findSquarePlusOrMinusClue(clue, a16, possibleValue, false);
    return false;
  }

  bool solveA29(Clue clue, Set<int> possibleValue) {
    findMultiplesOfPower(clue, possibleValue);
    return false;
  }

  bool solveA30(Clue clue, Set<int> possibleValue) {
    findSquarePlusOrMinusClue(clue, d24, possibleValue, true);
    return false;
  }

  bool solveA31(Clue clue, Set<int> possibleValue) {
    if (a16.values != null) {
      findTriangularsLessClue(clue, a16, possibleValue);
    } else {
      // A16 and A31 are mutually referential, so need a way to get started
      var values = getValuesFromClueDigits(a16);
      if (values != null) {
        findTriangularsLessValues(clue, values, possibleValue);
      }
    }
    return false;
  }

  bool solveA33(Clue clue, Set<int> possibleValue) {
    findMultiplesOfClue(clue, a30, possibleValue);
    return false;
  }

  bool solveA35(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFourDigitTriangles(), possibleValue);
    return false;
  }

  bool solveA36(Clue clue, Set<int> possibleValue) {
    // A36 is Jumble of D1
    if (d1.values != null) {
      // Construct Jumbles of all values
      for (var value in d1.values!) {
        var jumbles = <int>{};
        for (var d1 = 0; d1 < 4; d1++) {
          for (var d2 = 0; d2 < 4; d2++) {
            if (d2 != d1) {
              for (var d3 = 0; d3 < 4; d3++) {
                if (d3 != d1 && d3 != d2) {
                  for (var d4 = 0; d4 < 4; d4++) {
                    if (d4 != d3 && d4 != d1 && d4 != d2) {
                      var str = value.toString();
                      var jumble = str[d1] + str[d2] + str[d3] + str[d4];
                      jumbles.add(int.parse(jumble));
                    }
                  }
                }
              }
            }
          }
        }
        var possible = <int>{};
        filterDiceDigits(clue, jumbles.toList(), possible);
        possibleValue.addAll(possible);
      }
    }
    return false;
  }

  static bool solveFourDigitSquares(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFourDigitSquares(), possibleValue);
    return false;
  }

  bool solveD1(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFourDigitSquares(), possibleValue);
    // A36 is Jumble of D1, so check for illegal values
    if (possibleValue.length > 0) {
      // Find required and forbidden digits in A36, check for D1 values that have them
      var required = <int>{};
      var forbidden = Set.from(List.generate(6, (index) => index + 1));
      for (var d = 0; d < a36.length; d++) {
        if (a36.digits[d].length == 1) {
          required.addAll(a36.digits[d]);
        }
        forbidden.removeAll(a36.digits[d]);
      }
      if (required.length > 0 || forbidden.length > 0) {
        var removeValue = <int>{};
        for (var value in possibleValue) {
          var ok = true;
          for (var digit in required) {
            if (!value.toString().contains(digit.toString())) {
              ok = false;
              break;
            }
          }
          for (var digit in forbidden) {
            if (value.toString().contains(digit.toString())) {
              ok = false;
              break;
            }
          }
          // Update D1
          if (!ok) {
            removeValue.add(value);
          }
        }
        possibleValue.removeAll(removeValue);
      }
    }
    return false;
  }

  static bool solveSixDigitSquares(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getSixDigitSquares(), possibleValue);
    return false;
  }

  var solveD2 = solveSixDigitSquares;

  bool solveD3(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getTwoDigitMultipleThreePrimes(), possibleValue);
    return false;
  }

  bool solveD5(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFiveDigitMultipleThreePrimes(), possibleValue);
    return false;
  }

  bool solveD6(Clue clue, Set<int> possibleValue) {
    findPlusOrMinusClues(clue, d7, d18, possibleValue, true);
    return false;
  }

  bool solveD7(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getTwoDigitPowers(), possibleValue);
    return false;
  }

  bool solveD9(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getSevenDigitTriangles(), possibleValue);
    return false;
  }

  bool solveD11(Clue clue, Set<int> possibleValue) {
    var squares = getTwoDigitSquares().where((value) => value >= 50).toList();
    squares.addAll(getThreeDigitSquares().where((value) => value < 500));
    var values = squares.map((value) => 2 * value).toList();
    filterDigits(clue, values, possibleValue);
    return false;
  }

  static bool solveSevenDigitSquares(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getSevenDigitSquares(), possibleValue);
    return false;
  }

  var solveD13 = solveSevenDigitSquares;

  bool solveD15(Clue clue, Set<int> possibleValue) {
    var values = filterDice(getFourDigitSquares());
    filterDigits(clue, values, possibleValue);
    return false;
  }

  bool solveD18(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFourDigitPowers(), possibleValue);
    return false;
  }

  var solveD20 = solveSixDigitSquares;

  bool solveD22(Clue clue, Set<int> possibleValue) {
    if (d32.values != null) {
      var values = d32.values!.map((value) => value * value).toList();
      findMultiplesOfValues(clue, values, possibleValue);
    }
    return false;
  }

  bool solveD24(Clue clue, Set<int> possibleValue) {
    // Sum of two consecutive squares
    var squares = getSquaresRange(49, 999);
    int previous = 0;
    var values = <int>[];
    for (var square in squares) {
      if (previous != 0) {
        var sum = previous + square;
        if (sum < 100) continue;
        if (sum > 999) break;
        values.add(sum);
      }
      previous = square;
    }
    filterDiceDigits(clue, values, possibleValue);
    return false;
  }

  bool solveD26(Clue clue, Set<int> possibleValue) {
    var triangles = getFourDigitTriangles()
        .where((value) => value >= 2000 && value % 2 == 0)
        .toList();
    triangles.addAll(getFiveDigitTriangles()
        .where((value) => value < 20000 && value % 2 == 0));
    var values = triangles.map((value) => value ~/ 2).toList();
    filterDigits(clue, values, possibleValue);
    return false;
  }

  bool solveD28(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, getFourDigitSquares(), possibleValue);
    return false;
  }

  bool solveD32(Clue clue, Set<int> possibleValue) {
    findPlusOrMinusClues(clue, a19, d7, possibleValue, false);
    return false;
  }

  bool solveD34(Clue clue, Set<int> possibleValue) {
    filterDiceDigits(clue, twoDigitPrimes, possibleValue);
    return false;
  }

  static void findTriangularsLessClue(
      Clue output, Clue input, Set<int> possibleValue) {
    if (input.values != null) {
      findTriangularsLessValues(output, input.values!, possibleValue);
    }
  }

  static void findTriangularsLessValues(
      Clue output, Set<int> values, Set<int> possibleValue) {
    var minInput =
        values.reduce((value, element) => element < value ? element : value);
    var maxInput =
        values.reduce((value, element) => element > value ? element : value);
    var lo = 10.pow(output.length - 1) as int;
    var hi = (10.pow(output.length) as int) - 1;
    var minTriangle = lo + minInput;
    var maxTriangle = hi + maxInput;
    var triangles = getTrianglesRange(minTriangle, maxTriangle);
    for (var value in values) {
      var values = <int>[];
      for (var triangle in triangles) {
        var difference = triangle - value;
        if (difference < lo) continue;
        if (difference >= hi) continue;
        values.add(difference);
      }
      var possible = <int>{};
      filterDiceDigits(output, values, possible);
      possibleValue.addAll(possible);
    }
  }

  static void findPlusOrMinusClues(
      Clue output, Clue input1, Clue input2, possibleValue,
      [bool plus = false]) {
    if (input1.values != null && input2.values != null) {
      var lo = 10.pow(output.length - 1) as int;
      var hi = (10.pow(output.length) as int) - 1;
      for (var value1 in input1.values!) {
        var values = <int>[];
        for (var value2 in input2.values!) {
          var difference = plus ? value1 + value2 : value1 - value2;
          if (difference < lo) continue;
          if (difference >= hi) continue;
          values.add(difference);
        }
        var possible = <int>{};
        filterDiceDigits(output, values, possible);
        possibleValue.addAll(possible);
      }
    }
  }

  static void findSquarePlusOrMinusClue(Clue output, Clue input, possibleValue,
      [bool plus = false]) {
    if (input.values != null) {
      var minInput = input.values!
          .reduce((value, element) => element < value ? element : value);
      var maxInput = input.values!
          .reduce((value, element) => element > value ? element : value);
      var lo = 10.pow(output.length - 1) as int;
      var hi = (10.pow(output.length) as int) - 1;
      int minSquare;
      int maxSquare;
      if (plus) {
        minSquare = lo > maxInput ? lo - maxInput : 1;
        maxSquare = hi - minInput;
      } else {
        minSquare = lo + minInput;
        maxSquare = hi + maxInput;
      }
      var squares = getSquaresRange(minSquare, maxSquare);
      for (var value in input.values!) {
        var values = <int>[];
        for (var square in squares) {
          var difference = plus ? square + value : square - value;
          if (difference < lo) continue;
          if (difference >= hi) continue;
          values.add(difference);
        }
        var possible = <int>{};
        filterDiceDigits(output, values, possible);
        possibleValue.addAll(possible);
      }
    }
  }

  static void findMultiplesOfPower(Clue clue, Set<int> possibleValue) {
    var hi = (10.pow(clue.length) as int) - 1;
    var squares = getPowersInRange(1, hi);
    findMultiplesOfValues(clue, squares, possibleValue);
  }

  static void findMultiplesOfClue(
      Clue output, Clue input, Set<int> possibleValue) {
    if (input.values != null) {
      findMultiplesOfValues(output, input.values!.toList(), possibleValue);
    }
  }

  static void findMultiplesOfValues(
      Clue clue, List<int> values, Set<int> possibleValue) {
    var loResult = 10.pow(clue.length - 1) as int;
    var hiResult = (10.pow(clue.length) as int) - 1;
    for (var value in values) {
      var loMultiplier = loResult ~/ value;
      if (loMultiplier < 2) loMultiplier = 2;
      var hiMultiplier = hiResult ~/ value;
      var values = <int>[];
      for (var multiplier = loMultiplier;
          multiplier <= hiMultiplier;
          multiplier++) {
        var multiple = multiplier * value;
        if (multiple < loResult) continue;
        if (multiple >= hiResult) continue;
        values.add(multiple);
      }
      var possible = <int>{};
      filterDiceDigits(clue, values, possible);
      possibleValue.addAll(possible);
    }
  }
}

const List<int> twoDigitPrimes = [
  11,
  13,
  17,
  19,
  23,
  29,
  31,
  37,
  41,
  43,
  47,
  53,
  59,
  61,
  67,
  71,
  73,
  79,
  83,
  89,
  97
];

Map<int, Set<int>> getSumTwoPrimes() {
  var primes = <int, Set<int>>{};
  for (var p1 in twoDigitPrimes) {
    for (var p2 in twoDigitPrimes) {
      var sum = p1 + p2;
      if (!primes.containsKey(sum)) {
        primes[sum] = <int>{};
      }
      primes[sum]!.add(p1);
      primes[sum]!.add(p2);
    }
  }
  return primes;
}

List<int> getTwoDigitTriangles() {
  return getNDigitTriangles(2);
}

List<int> getFourDigitTriangles() {
  return getNDigitTriangles(4);
}

List<int> getFiveDigitTriangles() {
  return getNDigitTriangles(5);
}

List<int> getSevenDigitTriangles() {
  return getNDigitTriangles(7);
}

List<int> getNDigitTriangles(int n) {
  var lo = 10.pow(n - 1) as int;
  var hi = (10.pow(n) as int) - 1;
  return getTrianglesRange(lo, hi);
}

List<int> getTrianglesRange(int lo, int hi) {
  var triangles = <int>[];
  int index = 1;
  int next = 1;
  while (next <= hi) {
    if (next >= lo) triangles.add(next);
    index++;
    next += index;
  }
  return triangles;
}

List<int> getTwoDigitSquaresLessA1(int? d1) {
  var squares = <int>[];
  int minA1 = d1 != null ? d1 : 10;
  int maxA1 = d1 != null ? d1 : 99;
  for (var d1 = 1; d1 <= 200.sqrt().floor(); d1++) {
    var value = d1 * d1;
    if (value - minA1 > 9 && value - maxA1 < 100) {
      squares.add(value);
    }
  }

  return squares;
}

List<int> getTwoDigitSquares() {
  return getNDigitSquares(2);
}

List<int> getThreeDigitSquares() {
  return getNDigitSquares(3);
}

List<int> getFourDigitSquares() {
  return getNDigitSquares(4);
}

List<int> getSixDigitSquares() {
  return getNDigitSquares(6);
}

List<int> getSevenDigitSquares() {
  return getNDigitSquares(7);
}

List<int> getNDigitSquares(int n) {
  var lo = 10.pow(n - 1) as int;
  var hi = (10.pow(n) as int) - 1;
  return getSquaresRange(lo, hi);
}

List<int> getSquaresRange(int lo, int hi) {
  var squares = <int>[];
  var loSq = sqrt(lo).ceil();
  var hiSq = sqrt(hi).floor();
  for (var d1 = loSq; d1 <= hiSq; d1++) {
    var value = d1 * d1;
    squares.add(value);
  }
  return squares;
}

List<int> getFourDigitPrimes() {
  return getNDigitPrimes(4);
}

List<int> getNDigitPrimes(n) {
  var lo = 10.pow(n - 1);
  var limit = 10.pow(n) - 1;
  var primes = getPrimesUpto(limit)
      .where((element) => element >= lo && element <= limit)
      .toList();
  return primes;
}

List<int> getPrimesUpto(limit) {
  var hi = limit ~/ 2;
  List<int> sieve = List.generate(hi, (i) => 2 * i + 3);
  for (var i = 0; i < hi; i++) {
    if (sieve[i] != 0) {
      for (var j = i + 1; j < hi; j++) {
        if (sieve[j] % sieve[i] == 0) {
          sieve[j] = 0;
        }
      }
    }
  }
  var primes =
      sieve.where((element) => element != 0 && element <= limit).toList();
  primes.insertAll(0, [1, 2]);
  return primes;
}

List<int> getTwoDigitMultipleThreePrimes() {
  return getNDigitMultipleThreePrimes(2);
}

List<int> getFiveDigitMultipleThreePrimes() {
  return getNDigitMultipleThreePrimes(5);
}

List<int> getNDigitMultipleThreePrimes(int n) {
  var lo = 10.pow(n - 1) as int;
  var hi = 10.pow(n) as int;
  var primes = getPrimesUpto(hi ~/ 2);
  var products = <int>{};
  for (var p1 in primes.where((p) => p * p * p < hi)) {
    for (var p2 in primes.where((p) => p > p1 && p * p * p1 < hi)) {
      for (var p3 in primes.where((p) => p > p2 && p * p2 * p1 < hi)) {
        var product = p1 * p2 * p3;
        if (product < lo) continue;
        products.add(product);
      }
    }
  }
  return products.toList();
}

List<int> getTwoDigitPowers() {
  return getNDigitPowers(2);
}

List<int> getFourDigitPowers() {
  return getNDigitPowers(4);
}

List<int> getNDigitPowers(n) {
  var lo = 10.pow(n - 1) as int;
  var hi = (10.pow(n) as int) - 1;
  return getPowersInRange(lo, hi);
}

List<int> getPowersInRange(int lo, int hi) {
  var powers = <int>{};
  var any = true;
  for (var power = 3; any; power++) {
    any = false;
    for (var n = 2;; n++) {
      var value = n.pow(power) as int;
      if (value > hi) break;
      if (value < lo) continue;
      any = true;
      powers.add(value);
    }
  }
  var result = powers.toList();
  result.sort();
  return result;
}

List<int> getFiveDigitPalindromes() {
  var palindromes = <int>[];
  for (var d1 = 1; d1 < 10; d1++) {
    for (var d2 = 0; d2 < 10; d2++) {
      for (var d3 = 0; d3 < 10; d3++) {
        var value = d1 * 10000 + d2 * 1000 + d3 * 100 + d2 * 10 + d1;
        palindromes.add(value);
      }
    }
  }
  return palindromes;
}

Map<int, Map<String, int>> getThreeDigitPrimeMultiples() {
  var multiples = <int, Map<String, int>>{};
  outer:
  for (var p1 in twoDigitPrimes) {
    var finished = true;
    for (var p2 in twoDigitPrimes.where((element) => element > p1)) {
      var multiple = p1 * p2;
      if (multiple >= 1000) {
        if (finished) break outer;
        break;
      }
      finished = false;
      if (multiple >= 100) {
        multiples[multiple] = {'p1': p1, 'p2': p2};
      }
    }
  }
  return multiples;
}

class GridIterator extends Iterable<int?> with Iterator<int?> {
  int value;
  String valueStr;
  int prime;
  String primeStr;
  int? _current;
  int index = 0;

  GridIterator(this.value, this.prime)
      : valueStr = value.toString(),
        primeStr = prime.toString(),
        index = 0;

  // `moveNext`method must return boolean value to state if next value is available
  bool moveNext() {
    while (index < valueStr.length - 1 &&
            valueStr.substring(index, index + 2) != primeStr ||
        index == 0 && valueStr[index + 2] == '0') {
      index++;
    }
    if (index == valueStr.length - 1) {
      _current = null;
      return false;
    } else {
      _current = int.parse(
          valueStr.substring(0, index) + valueStr.substring(index + 2));
      index += 1;
      return true;
    }
  }

  // `current` getter method returns the current value of the iteration when `moveNext` is called
  int? get current => _current;

  @override
  Iterator<int?> get iterator => this;
}

int reverse(int prime) {
  var primeStr = prime.toString();
  var reverse = primeStr[1] + primeStr[0];
  return int.parse(reverse);
}

bool primeHasReverse(int prime) {
  var other = reverse(prime);
  return twoDigitPrimes.contains(other) && other != prime;
}

bool ascending(int value) {
  var valueStr = value.toString();
  var last = 0;
  for (var index = 0; index < valueStr.length; index++) {
    var next = int.parse(valueStr[index]);
    if (next <= last) return false;
    last = next;
  }
  return true;
}

int sumDigits(int value) {
  var valueStr = value.toString();
  var sum = 0;
  for (var index = 0; index < valueStr.length; index++) {
    sum += int.parse(valueStr[index]);
  }
  return sum;
}

bool isJumble(int value, int jumble) {
  var valueStr = value.toString();
  var jumbleStr = jumble.toString();
  for (var index = 0; index < valueStr.length; index++) {
    if (!jumbleStr.contains(valueStr[index])) return false;
    jumbleStr.replaceFirst(RegExp(valueStr[index]), '');
  }
  return true;
}

/*

  // A15 - Value 5 digits D^3, Removed prime L, Grid entry S^2
  bool solveA15(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var maxD = 100000.cbrt().floor();
    var minD = 10000.cbrt().ceil();
    var allD = puzzle.primes['D']!
        .where((element) => element <= maxD && element >= minD)
        .toList();
    var fiveDigitCubedPrimes = allD.map((e) => e * e * e).toList();
    var twoDigitPrimesSquared = twoDigitPrimes.map((e) => e * e).toList();
    var possibleD = <int>{};
    var possibleL = <int>{};
    var possibleS = <int>{};
    for (var index = 0; index < fiveDigitCubedPrimes.length; index++) {
      var value = fiveDigitCubedPrimes[index];
      var d = allD[index];
      for (var l in puzzle.primes['L']!.where((element) => element != d)) {
        for (var grid in GridIterator(value, l)) {
          var sIndex = twoDigitPrimesSquared.indexOf(grid!);
          if (sIndex != -1 && clue.digitsMatch(grid)) {
            var s = twoDigitPrimesSquared[sIndex].sqrt().floor();
            if (s != d && s != l) {
              possibleValue.add(value);
              possibleGrid.add(grid);
              possibleD.add(d);
              possibleL.add(l);
              possibleS.add(s);
            }
          }
        }
      }
    }
    if (updatePrimes('D', possibleD)) updated = true;
    if (updatePrimes('L', possibleL)) updated = true;
    if (updatePrimes('S', possibleS)) updated = true;

    return updated;
  }

  // D6 - Value 5 digits palindrome, Removed prime S, Grid entry K*T
  bool solveD6(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var fiveDigitPalindromes = getFiveDigitPalindromes();
    var threeDigitPrimeMultiples = getThreeDigitPrimeMultiples();
    var possibleS = <int>{};
    var possibleK = <int>{};
    var possibleT = <int>{};
    for (var value in fiveDigitPalindromes) {
      for (var s in puzzle.primes['S']!) {
        for (var grid in GridIterator(value, s)) {
          if (threeDigitPrimeMultiples.containsKey(grid) &&
              clue.digitsMatch(grid!)) {
            var p1 = threeDigitPrimeMultiples[grid]!['p1']!;
            var p2 = threeDigitPrimeMultiples[grid]!['p2']!;
            if (p1 != s && p2 != s) {
              possibleValue.add(value);
              possibleGrid.add(grid);
              possibleS.add(s);
              possibleK.add(p1);
              possibleK.add(p2);
              possibleT.add(p1);
              possibleT.add(p2);
            }
          }
        }
      }
    }
    if (updatePrimes('S', possibleS)) updated = true;
    if (updatePrimes('K', possibleK)) updated = true;
    if (updatePrimes('T', possibleT)) updated = true;

    return updated;
  }

  // A17 - Value 4 digits square, Removed prime M = reverse C
  bool solveA17(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var fourDigitSquares = getFourDigitSquares();
    var possibleM = <int>{};
    var possibleC = <int>{};
    for (var value in fourDigitSquares) {
      for (var m
          in puzzle.primes['M']!.where((element) => primeHasReverse(element))) {
        for (var grid in GridIterator(value, m)) {
          if (clue.digitsMatch(grid!)) {
            possibleValue.add(value);
            possibleGrid.add(grid);
            possibleM.add(m);
            possibleC.add(reverse(m));
          }
        }
      }
    }
    if (updatePrimes('M', possibleM)) updated = true;
    if (updatePrimes('C', possibleC)) updated = true;

    return updated;
  }

  // D15 - Value 4 digits square, Removed prime Y = reverse Q
  bool solveD15(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var fourDigitSquares = getFourDigitSquares();
    var possibleY = <int>{};
    var possibleQ = <int>{};
    for (var value in fourDigitSquares) {
      for (var y
          in puzzle.primes['Y']!.where((element) => primeHasReverse(element))) {
        for (var grid in GridIterator(value, y)) {
          if (clue.digitsMatch(grid!)) {
            possibleValue.add(value);
            possibleGrid.add(grid);
            possibleY.add(y);
            possibleQ.add(reverse(y));
          }
        }
      }
    }
    if (updatePrimes('Y', possibleY)) updated = true;
    if (updatePrimes('Q', possibleQ)) updated = true;

    return updated;
  }

  // D3 - Value 4 digits square, Removed prime Q = reverse Y
  bool solveD3(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var fourDigitSquares = getFourDigitSquares();
    var possibleQ = <int>{};
    var possibleY = <int>{};
    for (var value in fourDigitSquares) {
      for (var q
          in puzzle.primes['Q']!.where((element) => primeHasReverse(element))) {
        for (var grid in GridIterator(value, q)) {
          if (clue.digitsMatch(grid!)) {
            possibleValue.add(value);
            possibleGrid.add(grid);
            possibleQ.add(q);
            possibleY.add(reverse(q));
          }
        }
      }
    }
    if (updatePrimes('Q', possibleQ)) updated = true;
    if (updatePrimes('Y', possibleY)) updated = true;

    return updated;
  }

  // A5 - Value 4 digits square, Removed prime C = reverse M
  bool solveA5(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var fourDigitSquares = getFourDigitSquares();
    var possibleC = <int>{};
    var possibleM = <int>{};
    for (var value in fourDigitSquares) {
      for (var c
          in puzzle.primes['C']!.where((element) => primeHasReverse(element))) {
        for (var grid in GridIterator(value, c)) {
          if (clue.digitsMatch(grid!)) {
            possibleValue.add(value);
            possibleGrid.add(grid);
            possibleC.add(c);
            possibleM.add(reverse(c));
          }
        }
      }
    }
    if (updatePrimes('C', possibleC)) updated = true;
    if (updatePrimes('M', possibleM)) updated = true;

    return updated;
  }

  // A13 - Value 4 digits prime, Removed prime J
  bool solveA13(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var fourDigitPrimes = getFourDigitPrimes();
    var possibleJ = <int>{};
    for (var value in fourDigitPrimes) {
      for (var j in puzzle.primes['J']!) {
        for (var grid in GridIterator(value, j)) {
          if (clue.digitsMatch(grid!)) {
            possibleValue.add(value);
            possibleGrid.add(grid);
            possibleJ.add(j);
          }
        }
      }
    }
    if (updatePrimes('J', possibleJ)) updated = true;

    return updated;
  }

  // D16 - Value 4 digits multiple of Z, Removed prime Z, grid square - D1
  bool solveD16(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;

    Set<int>? gridD1 = puzzle.clues['D1']!.grids;
    var possibleZ = <int>{};
    var possibleD1 = <int>{};
    for (var z in puzzle.primes['Z']!) {
      var multiples = multiple(z, requireMultiple: false);
      for (var grid in multiples) {
        if (clue.digitsMatch(grid)) {
          if (gridD1 == null) {
            possibleGrid.add(grid);
            possibleZ.add(z);
          } else {
            for (var d1 in gridD1) {
              if ((d1 + grid).sqrt().floor().pow(2) == (d1 + grid)) {
                possibleGrid.add(grid);
                possibleZ.add(z);
                possibleD1.add(d1);
              }
            }
          }
        }
      }
    }

    if (updatePrimes('Z', possibleZ)) updated = true;

    return updated;
  }

  // A7 - Value 5 digits multiple of D, Removed prime D, grid multiple of D
  bool solveA7(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var possibleD = <int>{};
    for (var d in puzzle.primes['D']!) {
      var multiples = multiple(d, digits: 5, requireMultiple: true);
      for (var grid in multiples) {
        if (clue.digitsMatch(grid)) {
          possibleGrid.add(grid);
          possibleD.add(d);
        }
      }
    }
    if (updatePrimes('D', possibleD)) updated = true;

    return updated;
  }

  // D1 - Value 4 digits multiple of P, Removed prime P = triangular - Z
  bool solveD1(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var triangleSumTwoPrimes = getPrimesInTriangleSumTwoPrimes();
    var possibleP = <int>{};
    var possibleZ = SplayTreeSet<int>();
    for (var p in puzzle.primes['P']!) {
      var updatedP = false;
      if (triangleSumTwoPrimes.containsKey(p) &&
          triangleSumTwoPrimes[p]!
              .any((element) => puzzle.primes['Z']!.contains(element))) {
        var multiples = multiple(p, requireMultiple: false);
        for (var grid in multiples) {
          if (clue.digitsMatch(grid)) {
            possibleGrid.add(grid);
            possibleP.add(p);
            updatedP = true;
          }
        }
      }
      if (updatedP) {
        triangleSumTwoPrimes[p]!.forEach((element) {
          if (puzzle.primes['Z']!.contains(element)) {
            possibleZ.add(element);
          }
        });
      }
    }
    if (updatePrimes('P', possibleP)) updated = true;
    if (updatePrimes('Z', possibleZ)) updated = true;

    return updated;
  }

  // A12 - 4 digit triangle, removed prime H, grid triangle
  bool solveA12(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var triangles = getTriangles();
    var fourDigitTriangles =
        triangles.where((element) => element > 999 && element < 10000);
    var twoDigitTriangles =
        triangles.where((element) => element > 9 && element < 100);
    var possibleH = <int>{};
    for (var value in fourDigitTriangles) {
      for (var h in puzzle.primes['H']!) {
        for (var grid in GridIterator(value, h)) {
          if (twoDigitTriangles.contains(grid!)) {
            if (clue.digitsMatch(grid)) {
              possibleValue.add(value);
              possibleGrid.add(grid);
              possibleH.add(h);
            }
          }
        }
      }
    }
    if (updatePrimes('H', possibleH)) updated = true;

    return updated;
  }

  // A14 - 4 digit triangle, removed prime K
  bool solveA14(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var triangles = getTriangles();
    var fourDigitTriangles =
        triangles.where((element) => element > 999 && element < 10000);
    var possibleK = <int>{};
    for (var value in fourDigitTriangles) {
      for (var k in puzzle.primes['K']!) {
        for (var grid in GridIterator(value, k)) {
          if (clue.digitsMatch(grid!)) {
            possibleValue.add(value);
            possibleGrid.add(grid);
            possibleK.add(k);
          }
        }
      }
    }
    if (updatePrimes('K', possibleK)) updated = true;

    return updated;
  }

  // D11 - Value 5 ascending digits, Removed prime W, Grid G+W
  bool solveD11(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var sumTwoPrimes = getSumTwoPrimes();
    var possibleG = <int>{};
    var possibleW = <int>{};
    for (var d1 in [1, 2, 3, 4, 5, 6, 7, 8, 9]) {
      for (var d2
          in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].where((element) => element > d1)) {
        for (var d3 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
            .where((element) => element > d2)) {
          for (var d4 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
              .where((element) => element > d3)) {
            for (var d5 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                .where((element) => element > d4)) {
              var value = d1 * 10000 + d2 * 1000 + d3 * 100 + d4 * 10 + d5;
              for (var w in puzzle.primes['W']!) {
                for (var grid in GridIterator(value, w)) {
                  if (sumTwoPrimes.containsKey(grid) &&
                      sumTwoPrimes[grid]!.contains(w) &&
                      puzzle.primes['G']!.contains(grid! - w) &&
                      clue.digitsMatch(grid)) {
                    possibleValue.add(value);
                    possibleGrid.add(grid);
                    possibleW.add(w);
                    possibleG.add(grid - w);
                  }
                }
              }
            }
          }
        }
      }
    }
    if (updatePrimes('W', possibleW)) updated = true;
    if (updatePrimes('G', possibleG)) updated = true;

    return updated;
  }

  // D10 - Value 5 ascending digits divisible by sum, Removed prime V
  bool solveD10(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var possibleV = <int>{};
    for (var d1 in [1, 2, 3, 4, 5, 6, 7, 8, 9]) {
      for (var d2
          in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].where((element) => element > d1)) {
        for (var d3 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
            .where((element) => element > d2)) {
          for (var d4 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
              .where((element) => element > d3)) {
            for (var d5 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                .where((element) => element > d4)) {
              var value = d1 * 10000 + d2 * 1000 + d3 * 100 + d4 * 10 + d5;
              var sum = d1 + d2 + d3 + d4 + d5;
              if (value % sum == 0) {
                for (var v in puzzle.primes['V']!) {
                  for (var grid in GridIterator(value, v)) {
                    if (clue.digitsMatch(grid!)) {
                      possibleValue.add(value);
                      possibleGrid.add(grid);
                      possibleV.add(v);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if (updatePrimes('V', possibleV)) updated = true;

    return updated;
  }

  // A2 - Value 5 digits multiple of grid, Removed prime B
  bool solveA2(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var possibleB = <int>{};
    for (var value = 10000; value < 100000; value++) {
      for (var b in puzzle.primes['B']!) {
        for (var grid in GridIterator(value, b)) {
          if (value % grid! == 0 && clue.digitsMatch(grid)) {
            possibleValue.add(value);
            possibleGrid.add(grid);
            possibleB.add(b);
          }
        }
      }
    }
    if (updatePrimes('B', possibleB)) updated = true;

    return updated;
  }

  // A11 - Value 4 ascending digits, Removed prime G, Grid factor of D11
  bool solveA11(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;

    // Need D11 grid to solve
    Set<int>? allD11 = puzzle.clues['D11']!.grids;
    if (allD11 == null) return false;

    var possibleG = <int>{};
    var possibleD11 = <int>{};
    for (var d1 in [1, 2, 3, 4, 5, 6, 7, 8, 9]) {
      for (var d2
          in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].where((element) => element > d1)) {
        for (var d3 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
            .where((element) => element > d2)) {
          for (var d4 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
              .where((element) => element > d3)) {
            var value = d1 * 1000 + d2 * 100 + d3 * 10 + d4;
            for (var g in puzzle.primes['G']!) {
              for (var grid in GridIterator(value, g)) {
                for (var d11 in allD11) {
                  if (d11 % grid! == 0 && clue.digitsMatch(grid)) {
                    possibleValue.add(value);
                    possibleGrid.add(grid);
                    possibleG.add(g);
                    possibleD11.add(d11);
                  }
                }
              }
            }
          }
        }
      }
    }
    if (updatePrimes('G', possibleG)) updated = true;
    // Not necessary to update D11

    return updated;
  }

  // A18 - Value 5 digits multiple of H, Removed prime N asc digits, Grid multiple W
  bool solveA18(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var possibleN = <int>{};
    var possibleH = <int>{};
    var possibleW = <int>{};
    for (var h in puzzle.primes['H']!) {
      var value = h;
      while (value < 100000) {
        if (value > 9999) {
          for (var n in puzzle.primes['N']!
              .where((element) => element != h && ascending(element))) {
            for (var grid in GridIterator(value, n)) {
              if (clue.digitsMatch(grid!)) {
                for (var w in puzzle.primes['W']!
                    .where((element) => element != h && element != n)) {
                  if (grid % w == 0) {
                    possibleValue.add(value);
                    possibleGrid.add(grid);
                    possibleN.add(n);
                    possibleH.add(h);
                    possibleW.add(w);
                  }
                }
              }
            }
          }
        }
        value += h;
      }
    }
    if (updatePrimes('N', possibleN)) updated = true;
    if (updatePrimes('H', possibleH)) updated = true;
    if (updatePrimes('W', possibleW)) updated = true;
    return updated;
  }

  // D12 - Value 5 digits same digit sum as A18, Prime X, Grid jumble gA18
  bool solveD12(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;

    // Require A18 value and grid, do not try if too many possibles
    var a18 = puzzle.clues['A18']!;
    Set<int>? gridA18 = a18.grids;
    Set<int>? valueA18 = a18.values;
    if (gridA18 == null ||
        valueA18 == null ||
        gridA18.length > 10 ||
        valueA18.length > 10) return false;

    var possibleX = <int>{};
    // Should process A18 value and grid in parallel, but not possible, and works OK
    // for (var index = 0; index < valueA18.length; index++) {
    //   var vA18 = valueA18[index];
    //   var gA18 = gridA18[index];
    for (var vA18 in valueA18) {
      for (var gA18 in gridA18) {
        var sum = sumDigits(vA18);
        var value = 10000;
        while (value < 100000) {
          if (sum == sumDigits(value)) {
            for (var x in puzzle.primes['X']!) {
              for (var grid in GridIterator(value, x)) {
                if (isJumble(gA18, grid!) && clue.digitsMatch(grid)) {
                  possibleValue.add(value);
                  possibleGrid.add(grid);
                  possibleX.add(x);
                }
              }
            }
          }
          value++;
        }
      }
    }
    if (updatePrimes('X', possibleX)) updated = true;
    return updated;
  }

  // D8 Value 5 descending digits, Prime T
  bool solveD8(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var possibleT = <int>{};
    for (var d5 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) {
      for (var d4
          in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].where((element) => element > d5)) {
        for (var d3 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
            .where((element) => element > d4)) {
          for (var d2 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
              .where((element) => element > d3)) {
            for (var d1 in [1, 2, 3, 4, 5, 6, 7, 8, 9]
                .where((element) => element > d2)) {
              var value = d1 * 10000 + d2 * 1000 + d3 * 100 + d4 * 10 + d5;
              for (var t in puzzle.primes['T']!) {
                for (var grid in GridIterator(value, t)) {
                  if (clue.digitsMatch(grid!)) {
                    possibleValue.add(value);
                    possibleGrid.add(grid);
                    possibleT.add(t);
                  }
                }
              }
            }
          }
        }
      }
    }
    if (updatePrimes('T', possibleT)) updated = true;
    return updated;
  }

  // D4 Value 5 digits multiple B, Prime R
  bool solveD4(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;
    var possibleR = <int>{};
    var possibleB = <int>{};
    for (var b in puzzle.primes['B']!) {
      var value = b;
      while (value < 100000) {
        if (value > 9999) {
          for (var r in puzzle.primes['R']!.where((element) => element != b)) {
            for (var grid in GridIterator(value, r)) {
              if (clue.digitsMatch(grid!)) {
                possibleValue.add(value);
                possibleGrid.add(grid);
                possibleR.add(r);
                possibleB.add(b);
              }
            }
          }
        }
        value += b;
      }
    }
    if (updatePrimes('B', possibleB)) updated = true;
    if (updatePrimes('R', possibleR)) updated = true;
    return updated;
  }

  // A9 Value 4 digits multiple R, Prime F, Grid reverse of another entry
  bool solveA9(Clue clue, Set<int> possibleValue, Set<int> possibleGrid) {
    var updated = false;

    var otherEntry = <int>{};
    for (var other in getTwoDigitCluesLessA9()) {
      // If any other unknown then cannot continue
      if (other.grids == null) return false;
      otherEntry.addAll(other.grids!);
    }

    var possibleR = <int>{};
    var possibleF = <int>{};
    for (var r in puzzle.primes['R']!) {
      var value = r;
      while (value < 10000) {
        if (value > 999) {
          for (var f in puzzle.primes['F']!.where((element) => element != r)) {
            for (var grid in GridIterator(value, f)) {
              if (otherEntry.contains(reverse(grid!)) &&
                  clue.digitsMatch(grid)) {
                possibleValue.add(value);
                possibleGrid.add(grid);
                possibleR.add(r);
                possibleF.add(f);
              }
            }
          }
        }
        value += r;
      }
    }
    if (updatePrimes('R', possibleR)) updated = true;
    if (updatePrimes('F', possibleF)) updated = true;
    return updated;
  }
  */
