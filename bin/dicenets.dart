import 'dart:io';

import 'package:args/command_runner.dart';

import 'package:dicenets/dicenets.dart';

const help = 'help';
const program = 'dicenets';

void main(List<String> arguments) async {
  exitCode = 0; // presume success

  var runner = CommandRunner('dicenets', 'Dice Nets helper.')
    ..addCommand(SolveCommand());
  try {
    await runner.run(arguments);
  } on UsageException catch (e) {
    // Arguments exception
    print('$program: ${e.message}');
    print('');
    print('${runner.usage}');
  } catch (e) {
    print('$program: $e');
  }
}

class SolveCommand extends Command {
  @override
  final name = 'solve';
  @override
  final description = 'solve hardcoded puzzle.';

  @override
  void run() {
    // Get and print solve
    final dn = dicenets();
    dn.solve();
  }
}
