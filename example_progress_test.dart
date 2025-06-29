import 'dart:async';
import 'package:gobabel/src/core/loading_indicator.dart';

void main() async {
  print('Testing LoadingIndicator with progress bar...\n');
  
  // Example 1: Simple loading without progress bar
  print('1. Simple loading indicator:');
  LoadingIndicator.instance.setLoadingState(
    message: 'Processing files...',
    totalCount: 10,
    step: 5,
    barProgressInfo: null,
  );
  
  await Future.delayed(Duration(seconds: 2));
  LoadingIndicator.instance.dispose();
  print('\nDone!\n');
  
  // Example 2: Loading with progress bar
  print('2. Loading with progress bar:');
  for (int i = 1; i <= 10; i++) {
    LoadingIndicator.instance.setLoadingState(
      message: 'Processing large dataset...',
      totalCount: 10,
      step: i,
      barProgressInfo: BarProgressInfo(
        message: 'Analyzing strings in file $i of 10...',
        totalSteps: 10,
        currentStep: i,
      ),
    );
    await Future.delayed(Duration(milliseconds: 500));
  }
  
  LoadingIndicator.instance.dispose();
  print('\nCompleted!\n');
  
  // Example 3: Different progress stages
  print('3. Multi-stage processing:');
  final stages = [
    'Extracting strings...',
    'Analyzing labels...',
    'Creating ARB keys...',
    'Generating translations...',
  ];
  
  for (int stage = 0; stage < stages.length; stage++) {
    for (int i = 1; i <= 5; i++) {
      LoadingIndicator.instance.setLoadingState(
        message: 'Stage ${stage + 1} of ${stages.length}',
        totalCount: stages.length,
        step: stage + 1,
        barProgressInfo: BarProgressInfo(
          message: stages[stage],
          totalSteps: 5,
          currentStep: i,
        ),
      );
      await Future.delayed(Duration(milliseconds: 300));
    }
  }
  
  LoadingIndicator.instance.dispose();
  print('\nAll stages completed!');
}