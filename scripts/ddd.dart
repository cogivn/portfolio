import 'dart:async';
import 'dart:io';
import 'package:mason/mason.dart';
import 'package:args/args.dart';

// To start please runscript:
// dart run scripts/ddd.dart -d filename

Future<void> main(List<String> args) async {
  final parser = ArgParser()..addOption('dddFolder', abbr: 'd');
  var result = parser.parse(args);
  var folderList = result['dddFolder'];
  await generateFile(folderList);
  exit(9);
}

//  url: https://gitlab.legato.co/Legato.bellamy.nguyen/abc.git
//       path: bricks/ddd

Future<void> generateFile(String dddFolderNames) async {
  final brick = Brick.git(const GitPath(
      'https://gitlab.legato.co/Legato.bellamy.nguyen/abc.git',
      path: 'bricks/ddd')
  );
  final generator = await MasonGenerator.fromBrick(brick);
  final target = DirectoryGeneratorTarget(Directory.current);
  await generator.generate(target, vars: {'filename': dddFolderNames});
  await generator.hooks.postGen();
}