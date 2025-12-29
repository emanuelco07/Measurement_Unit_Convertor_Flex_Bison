# Measurement Unit Converter (Flex & Bison)

This project is a specialized tool designed to parse and convert various measurement units using Flex for lexical analysis and Bison for syntactic parsing. It provides an automated way to process conversion queries by identifying values, source units, and target units through a formal grammar.

## Description
The application functions as a domain-specific language processor. It scans input strings (e.g., "50 kilometers to miles"), validates the syntax against defined grammatical rules, and performs the mathematical transformation between different measurement systems. This project demonstrates the practical application of compiler construction techniques in solving real-world data processing tasks.

## Key Features
- Lexical identification of numerical values and unit identifiers (metric and imperial systems).
- Syntactic parsing of conversion expressions using Context-Free Grammar (CFG).
- Automated unit transformation logic based on predefined conversion factors.
- Support for multiple categories of measurements (length, mass, temperature, etc.).
- Robust error handling for unrecognized units or invalid syntax.

## Tech Stack
- Tools: Flex (Lexical Analyzer), Bison (Parser Generator)
- Languages: C / C++
- Build System: Makefile

## Technical Concepts Applied
- Compiler Front-End: Implementation of the scanning and parsing phases.
- Formal Grammar Design: Creating rules to handle natural language-like conversion queries.
- Semantic Actions: Embedding conversion logic directly into the parsing rules.

## How to Build and Run
1. Ensure you have Flex and Bison installed on your system.
2. Compile the project using the Makefile: `make`
3. Run the converter: `./unit_converter < input.txt`
4. 
---

**For more information, please refer to the Romanian [documentation](https://github.com/emanuelco07/Measurement_Unit_Convertor_Flex_Bison/blob/main/Cosereanu_Emanuel_Convertor.pdf).**
