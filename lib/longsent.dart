import 'dart:io';

void main() {
  // Take input from the user
  print("Enter a long sentence:");
  String? sentence = stdin.readLineSync();

  if (sentence != null && sentence.isNotEmpty) {
    printNumberOfCharacters(sentence);
    printNumberOfWords(sentence);
    printReversedSentence(sentence);
  } else {
    print("You entered an empty sentence.");
  }
}

// Function to count and print number of characters
void printNumberOfCharacters(String sentence) {
  print("Number of characters: ${sentence.length}");
}

// Function to count and print number of words
void printNumberOfWords(String sentence) {
  List<String> words = sentence.trim().split(RegExp(r'\s+'));
  print("Number of words: ${words.length}");
}

// Function to reverse and print the sentence
void printReversedSentence(String sentence) {
  String reversed = sentence.split('').reversed.join();
  print("Reversed sentence: $reversed");
}
