import 'dart:io';

void main() {
  print("Enter a list of integers separated by spaces:");
  String? input = stdin.readLineSync();

  if (input != null && input.trim().isNotEmpty) {
    // Convert input string into a list of integers
    List<int> numbers = input
        .trim()
        .split(RegExp(r'\s+'))
        .map(int.parse)
        .toList();

    printTotal(numbers);
    printHighest(numbers);
    printLowest(numbers);
    printAverage(numbers);
    printMedian(numbers);
  } else {
    print("You entered an empty list.");
  }
}

void printTotal(List<int> nums) {
  int sum = nums.reduce((a, b) => a + b);
  print("Total: $sum");
}

void printHighest(List<int> nums) {
  int maxNum = nums.reduce((a, b) => a > b ? a : b);
  print("Highest number: $maxNum");
}

void printLowest(List<int> nums) {
  int minNum = nums.reduce((a, b) => a < b ? a : b);
  print("Lowest number: $minNum");
}

void printAverage(List<int> nums) {
  double avg = nums.reduce((a, b) => a + b) / nums.length;
  print("Average: ${avg.toStringAsFixed(2)}");
}

void printMedian(List<int> nums) {
  List<int> sorted = List.from(nums)..sort();
  double median;

  int mid = sorted.length ~/ 2;
  if (sorted.length % 2 == 1) {
    median = sorted[mid].toDouble();
  } else {
    median = (sorted[mid - 1] + sorted[mid]) / 2;
  }

  print("Median: ${median.toStringAsFixed(2)}");
}
