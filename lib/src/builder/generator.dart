import 'dart:async';

import 'package:analyzer/analyzer.dart';
import 'package:build/build.dart';

import 'package:over_react/src/builder/generation/declaration_parsing.dart';
import 'package:over_react/src/builder/generation/impl_generation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_span/source_span.dart';

import './util.dart';

class OverReactGenerator extends Generator {
  String _generateForFile(AssetId inputId, String primaryInputContents, CompilationUnit resolvedUnit) {
    final sourceFile = new SourceFile.fromString(
        primaryInputContents, url: idToPackageUri(inputId));

    ImplGenerator generator;
    if (ParsedDeclarations.mightContainDeclarations(primaryInputContents)) {
      final declarations = new ParsedDeclarations(resolvedUnit, sourceFile, log);

      if (declarations.hasErrors) {
        log.severe('There was an error parsing the file declarations for file: $inputId');
        return '';
      }
      generator = new ImplGenerator(log, sourceFile)..generate(declarations);
    } else {
      log.fine('There were no declarations found for file: $inputId');
    }
    return generator?.outputContentsBuffer?.toString() ?? '';
  }

  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    // Don't build on non-library files
    if (!await buildStep.resolver.isLibrary(buildStep.inputId)) {
      log.fine('No output generated for non-library file: ${buildStep.inputId}');
      return '';
    }

    final inputId = await buildStep.inputId;
    final entryLib = await buildStep.inputLibrary;

    // Get list of compilation units for each part in this library, as well
    // as the base library file itself
    final compUnits = List.from(entryLib.parts)..add(entryLib.definingCompilationUnit);

    final contentBuffer = new StringBuffer();
    for (final unit in compUnits) {
      log.fine('Generating implementations for file: ${unit.name}');
      // unit.uri is needed for part files, but is null for the parent file.
      // In the case of a parent file, unit.name will suffice.
      // TODO: Make this play nice with analyzer ^0.33.0 (unit.uri and name are both null in some cases): <https://jira.atl.workiva.net/browse/CPLAT-4003>
      final assetId = AssetId.resolve(unit.uri ?? unit.name, from: inputId);

      // Only generate on part files which were not generated by this builder and
      // which can be read.
      if (!assetId.toString().contains(outputExtension) && await buildStep.canRead(assetId)) {
        final resolvedUnit = unit.computeNode();
        final inputContents = await buildStep.readAsString(assetId);
        contentBuffer.write(_generateForFile(assetId, inputContents, resolvedUnit));
      }
    }

    if (contentBuffer.isNotEmpty) {
      return contentBuffer.toString();
    } else {
      log.fine('No output generated for file: $inputId');
    }
    return '';
  }
}

