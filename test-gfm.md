<img src="media/image1.jpg" style="width:8.70816in;height:11.58854in"
alt="A blue background with dots and lines AI-generated content may be incorrect." />**MATLAB
Coding Guidelines**

Version 1.0

# Contents

[The Purpose of this Document
[3](#the-purpose-of-this-document)](#the-purpose-of-this-document)

[Motivations for the Guidelines
[4](#motivations-for-the-guidelines)](#motivations-for-the-guidelines)

[Understanding the Coding Guidelines
[5](#understanding-the-coding-guidelines)](#understanding-the-coding-guidelines)

[How Guidelines are Documented
[5](#how-guidelines-are-documented)](#how-guidelines-are-documented)

[Rules [6](#rules)](#rules)

[Best Practices [7](#best-practices)](#best-practices)

[Definitions [8](#definitions)](#definitions)

[Naming Guidelines [9](#naming-guidelines)](#naming-guidelines)

[General [9](#general)](#general)

[Variables [11](#variables)](#variables)

[Functions [13](#functions)](#functions)

[Classes [15](#classes)](#classes)

[Namespaces [18](#namespaces)](#namespaces)

[Statements & Expressions Guidelines
[19](#statements-expressions-guidelines)](#statements-expressions-guidelines)

[General [19](#general-1)](#general-1)

[Variables [20](#variables-1)](#variables-1)

[MATLAB Types [21](#matlab-types)](#matlab-types)

[Expressions [22](#expressions)](#expressions)

[Loops and Conditionals
[24](#loops-and-conditionals)](#loops-and-conditionals)

[Making Calls to Functions
[27](#making-calls-to-functions)](#making-calls-to-functions)

[Functions to Avoid [29](#functions-to-avoid)](#functions-to-avoid)

[Formatting Guidelines
[32](#formatting-guidelines)](#formatting-guidelines)

[Use of Spaces [32](#use-of-spaces)](#use-of-spaces)

[Use of Blank Lines [37](#use-of-blank-lines)](#use-of-blank-lines)

[Lines in Code Files [42](#lines-in-code-files)](#lines-in-code-files)

[Code Comments Guidelines
[43](#code-comments-guidelines)](#code-comments-guidelines)

[General [43](#general-2)](#general-2)

[Placement and Indentation
[44](#placement-and-indentation)](#placement-and-indentation)

[Function Authoring Guidelines
[47](#function-authoring-guidelines)](#function-authoring-guidelines)

[General [47](#general-3)](#general-3)

[Inputs [51](#inputs)](#inputs)

[Outputs [53](#outputs)](#outputs)

[Class Authoring Guidelines
[55](#class-authoring-guidelines)](#class-authoring-guidelines)

[General [55](#general-4)](#general-4)

[Properties [58](#properties)](#properties)

[Methods [61](#methods)](#methods)

[Error Handling Guidelines
[65](#error-handling-guidelines)](#error-handling-guidelines)

[General [65](#general-5)](#general-5)

[Try/Catch [67](#trycatch)](#trycatch)

# The Purpose of this Document

As applications get larger and more complex, organizations are adopting
more formal coding practices including code reviews, automated builds,
and continuous integration. Organizations which develop applications
involving teams of people writing MATLAB code want to introduce
regularity and consistency in their code bases to enhance the quality of
their MATLAB code.

The purpose of this document is to describe a set of MATLAB coding
guidelines primarily targeted at teams of MATLAB developers contributing
to a large application or library. Adoption of the MATLAB Coding
Guidelines is optional. Individuals who write code for their own use
*may choose* to adopt these guidelines, but no one is compelled to do
so.

Several sources of information were used to develop these guidelines.
Those sources included

- Coding guidelines written by members of the MATLAB community

- MathWorks internal coding guidelines

- Internal and external MATLAB codebases

A guideline was favored if there was a broad consensus among these
sources.

We expect these guidelines to evolve over time. Changes to the
guidelines will be driven by feedback from the MATLAB community and will
be reflected in subsequent versions of this document.

# Motivations for the Guidelines

The purpose of the guidelines is to allow organizations to introduce
regularity and consistency in large MATLAB code bases. Beyond that,
there are several important motivations for using the guidelines. Each
of the guidelines is motivated by one or more of the following
objectives.

- **Readability:** The ease with which code can be read and understood
  by others, including proper naming, formatting, and structure.

- **Understandability:** The clarity of code in terms of logic, flow,
  and purpose, making it easy to grasp its function without extensive
  effort.

- **Maintainability:** The ease with which code can be modified,
  extended, or debugged over time without introducing errors or
  unintended behavior.

- **Reusability:** The ability to use code components across different
  projects or contexts without modification, thereby reducing redundancy
  and improving developer efficiency.

- **Portability:** The ability of code to run on different platforms or
  MATLAB versions with minimal or no modification.

- **Testability:** The ease with which code can be tested to verify
  correctness, including unit testing and automated test execution.

- **Performance:** The degree to which code executes optimally in terms
  of speed and resource usage, minimizing computation time and memory
  use.

- **Correctness**: The degree to which code performs its intended
  function without producing incorrect results.

# Understanding the Coding Guidelines

This document contains two types of guidelines – Rules and Best
Practices. *Rules* must be followed in order to comply with the
guidelines. Rule violations are detected by the MATLAB Code Analyzer and
identified in the MATLAB Editor and in the Code Analyzer report. Some
rule violations are not currently detected but may be detected in a
future version of MATLAB. Examples of Rules in the guidelines include:

- Limit variable name length to \<= 32 characters

- Limit nesting of loop and conditional statements to 5 levels.

*Best Practices* are guidelines that contain recommendations for
improving the quality of your MATLAB code. Following them is optional.
Most Best Practices cannot be reliably detected by the Code Analyzer.
Examples of Best Practices in the guidelines include:

- Avoid the use of the eval function. The eval function can lead to
  unexpected code execution especially when using the function with
  untrusted user input.

- Use the fileparts, fullfile, and filesep functions to create or parse
  filenames in a platform independent way.

The guidelines are organized into categories -- Naming, Statements &
Expressions, Formatting (use of white space), Code Comments, Function
Authoring, Class Authoring, and Error Handling.

## How Guidelines are Documented

The guidelines have been written to be concise, clear, and unambiguous
with the goal of making them easy to describe and apply. Every guideline
has a table of information like the example below.

<table>
<colgroup>
<col style="width: 24%" />
<col style="width: 75%" />
</colgroup>
<thead>
<tr>
<th><strong>Type</strong></th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Description</strong></td>
<td>Limit variable name length to &lt;= 32 characters</td>
</tr>
<tr>
<td><strong>Motivation</strong></td>
<td>Readability: Variable names should be descriptive but excessively
long names can reduce readability because they contribute to long lines
of code.</td>
</tr>
<tr>
<td><strong>Allowed</strong></td>
<td><p>totalReactivePowerLoss</p>
<p>actualRipplePassbandFirstBand</p>
<p>intervalBetweenLaserTransitions</p></td>
</tr>
<tr>
<td><strong>Not Allowed</strong></td>
<td><p>significancePearsonGravitationalCorrelation</p>
<p>percentROIAreaContainingPositivePixels</p></td>
</tr>
<tr>
<td><strong>Detection</strong></td>
<td>Code Analyzer check naming.variable.maxLength (R2025a)</td>
</tr>
<tr>
<td><strong>History</strong></td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

| Type | Rule |
| Description | Limit variable name length to <= 32 characters |

The table for each guideline has the following fields.

- **Type:** Whether the guideline is a Rule or Best Practice

- **Description:** A short description of the guideline. Rules are
  typically limited to a single sentence. Best Practices may be more
  detailed.

- **Motivation:** The reason(s) this guideline is included.

- **Allowed or Recommended:** Positive examples that obey the Rule or
  Best Practice.

- **Not Allowed or Not Recommended:** Negative examples that violate the
  Rule or Best Practice.

- **Detection:** For Rules, how detection is done and the version of
  MATLAB when detection first became available. For Best Practices, if
  optional detection is available and how it is done.

- **History:** The version of this document when the guideline was
  introduced.

## Rules

Rule violations are (or will be) detectable by the MATLAB Code Analyzer.
The Code Analyzer is a tool in MATLAB that examines code to identify
problems and make recommendations for improvement. It can identify
issues related to syntax errors, compatibility, performance, deprecated
functionality and much, much more. The Code Analyzer provides [over two
thousand
checks](https://www.mathworks.com/help/matlab/matlab_env/index-of-code-analyzer-checks.html)
for various potential code issues. Those checks can be enabled,
disabled, or customized by [creating a local
codeAnalyzerConfiguration.json
file](https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html)
similar to the example shown below.

<figure>
<img src="media/image2.png" style="width:4.39in;height:3.67in" />
<figcaption><p>: Defining custom Code Analyzer checks</p></figcaption>
</figure>

The MATLAB Code Analyzer can detect violations for a subset of the Rules
listed in this document. Note that some versions of MATLAB may not be
able to detect violations for all of the rules. When the Code Analyzer
detects a Rule violation, it identifies the issue in both the MATLAB
Editor and the Code Analyzer Report. Beginning in R2025a, violations in
the Editor are indicated on the right-hand side of the Editor panel as
shown in the following screenshot.

<figure>
<img src="media/image3.png" style="width:4.49in;height:2.25in"
alt="A screenshot of a computer AI-generated content may be incorrect." />
<figcaption><p>: Rule violations are flagged in the MATLAB
Editor</p></figcaption>
</figure>

This guidelines document is accompanied by a
codeAnalyzerConfiguration.json file which implements the checks for the
set of Rule violations that can be detected.

The Code Analyzer check for any Rule can be disabled. Consider the
example in Figure 2 above. There is a Rule that specifies that function
names must be lowercase or lowerCamelCase. You can disable this Rule if
you want to turn off checking for function name casing. Most Rules can
also be configured. In the case above, you could change the options for
function name casing to use a different convention (e.g.,
UpperCamelCase). The Detection field in the Rule information table
provides information about which Code Analyzer check is used to detect
violations of the Rule. You can then disable or modify the check in your
Code Analyzer Configuration file.

## Best Practices

Best Practices are simply recommendations for writing better MATLAB
code. The information provided for a Best Practice is similar to that
provided for a Rule. Below is an example Best Practice from the
Guidelines.

There are some Best Practices that can (optionally) be detected as Rules
by enabling a check in the Code Analyzer. Most of those checks are
disabled by default. Information on optional detection, when available,
is shown in the **Detection** field of the information for a Best
Practice.

<table>
<colgroup>
<col style="width: 24%" />
<col style="width: 75%" />
</colgroup>
<thead>
<tr>
<th><strong>Type</strong></th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Description</strong></td>
<td>Use cell arrays only to store data of varying classes and/or sizes.
Do not use cell arrays to store character vectors as text data. Use a
string array instead.</td>
</tr>
<tr>
<td><strong>Motivation</strong></td>
<td><p>Readability: Using string arrays instead of cell arrays of
character vectors improves the readability of the code.</p>
<p>Performance: String operations are more performant than operations on
cell arrays of character vectors.</p></td>
</tr>
<tr>
<td><strong>Recommended</strong></td>
<td><p>data = {datetime "abc" 123};</p>
<p>arrays = {rand(1,10) zeros(2,4) eye(5)};</p>
<p>missions = ["Mercury" "Gemini" "Apollo"];</p></td>
</tr>
<tr>
<td><strong>Not Recommended</strong></td>
<td>missions = {'Mercury' 'Gemini' 'Apollo'};</td>
</tr>
<tr>
<td><strong>Detection</strong></td>
<td>Optionally by enabling Code Analyzer check DAFCVC (R2024a)</td>
</tr>
<tr>
<td><strong>History</strong></td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## Definitions

Several important terms are used in the description of the guidelines.
Those terms are defined here.

- **Programming interface elements** refers to functions, classes,
  properties, methods, events, and enumeration members. Table variables
  and struct fields should be treated as elements of a programming
  interface if the table or struct is an input or output of a function
  or method. Otherwise, if a table or struct is used only inside of a
  single function, method, or script, the table variables and struct
  fields can be treated like ordinary variables.

- **lowercase** is a casing convention for identifiers (names) where the
  identifier starts with a lowercase letter (a-z) and all subsequent
  characters are either lowercase letters or numbers. Underscores and
  other special characters are not allowed. Examples include:

  - temperature

  - sortrows

  - trial27

- **lowerCamelCase** is a casing convention for identifiers (names)
  where the identifier starts with a lowercase letter (a-z) and uses an
  uppercase letter (A-Z) at the start of each subsequent word. Numbers
  are allowed after the first letter but underscores and other special
  characters are not. Examples include:

  - totalPowerLoss

  - inverseTransformDecompression

  - utf8Character

- **UpperCamelCase** is a casing convention for identifiers (names)
  where the identifier uses an uppercase letter (A-Z) at the start of
  each word. Numbers are allowed after the first letter but underscores
  and other special characters are not. Examples include:

  - KineticEnergy

  - Visible

  - Unicode16Text

- **Leadinguppercase** is a casing convention for identifiers (names)
  where the identifier starts with a single uppercase letter (A-Z) and
  is followed by zero or more lowercase letters (a-z) or numbers.
  Underscores and other special characters are not allowed. Examples
  include:

  - A

  - Binverse

  - C1

# Naming Guidelines

## General

**Language**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use a common language, like English, for MATLAB identifiers when
writing code that will be read or used by someone whose native language
is different than your own.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Globally, English is the most common language for
programming.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>initialValue = 4 % variable name</p>
<p>transmission = DriveTrain % class name</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>anfangswert = 4 % Variablenname</p>
<p>transmission = Transmisia % numele clasei</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Names as documentation**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Prefer precise and descriptive names for elements of a programming
interface including functions, classes, and methods. Do not use short
names for functions or methods unless the meaning is obvious.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Descriptive names make it easier to determine the
purpose of an element in a programming interface (e.g., a
function).</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>initializeTemperature</p>
<p>findCycles</p>
<p>rowWiseLast</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>calcVal</p>
<p>nextTemp</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Use of abbreviations**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid the use of abbreviated words in the names for elements in a
programming interface whenever possible. Use whole words instead. Only
use abbreviations that are unambiguous, commonly used within an
organization or domain, or easily determined from context. </td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Abbreviations can be ambiguous and prone to
misinterpretation. Whole words in names make code easier to read and
understand.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>nextIndex</p>
<p>printError</p>
<p>calculatePressure</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>nxIdx</p>
<p>prntErr</p>
<p>calcPres</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Use of acronyms**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>If an acronym is used in an identifier name, all the letters in that
acronym should have the same case. If the identifier’s casing Rule calls
for the first letter of a word to be lowercase, then all the letters in
the acronym should be lowercase. Similarly, if the identifier’s casing
Rule calls for the first letter of a word to be UPPERCASE, then all the
letters in the acronym should be UPPERCASE.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Mixed case acronyms are difficult to read and
understand.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>htmlwrite % for lowercase</p>
<p>createURL % for lowerCamelCase</p>
<p>DNAMatch % for UpperCamelCase</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>HTMLwrite % for lowercase</p>
<p>createUrl % for lowerCamelCase</p>
<p>DnaMatch % for UpperCamelCase</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Avoid shadowing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid naming variables, functions, and classes using the name of an
existing function or class on the MATLAB path. Name collisions can lead
to "shadowing" which may lead to unexpected or inconsistent
behavior.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Shadowing other functions on the path can lead to
unexpected results making code hard to maintain.</td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>rand</p>
<p>sin</p>
<p>sqrt</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## Variables

**Variable name length**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Limit variable name length to &lt;= 32 characters.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Variable names should be descriptive but excessively
long names can reduce readability because they contribute to long lines
of code.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>totalReactivePowerLoss</p>
<p>actualRipplePassbandFirstBand</p>
<p>intervalBetweenLaserTransitions</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>significancePearsonGravitationalCorrelation</p>
<p>percentROIAreaContainingPositivePixels</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check naming.variable.maxLength (R2025a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Variable name style**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td><p>Prefer descriptive names for variables. Short variables names are
permissible when the variable's meaning can be easily determined from
the context in which it is used. Such cases include:</p>
<ul>
<li><p>Mathematical expressions</p></li>
<li><p>Short blocks of contiguous code</p></li>
<li><p>Temporary variables or iterators in a loop</p></li>
<li><p>Values widely known to users in a particular domain, e.g.</p>
<ul>
<li><p>Mathematics: phi = golden ratio</p></li>
<li><p>Physics: h = Planck's constant</p></li>
</ul></li>
</ul>
<p>Do not mix singular and plural forms for variables (e.g., point and
points). Instead, consider using a suffix for pluralization.</p>
<p>Avoid negated variable names like "isNot" or "notFound".</p></td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Well-chosen variable names are unambiguous and
avoid confusion over what data the variable contains.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>apparentMagnitude = 1.2</p>
<p>initialTemperature = 100</p>
<p>x = A\b</p>
<p>e = m*c^2 % c = speed of light</p>
<p>color, colorGroup % pluralization</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Variable name casing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use lowerCamelCase for descriptive variable names consisting of
multiple words. Leadinguppercase can be used for short variable names
such as common mathematical symbols.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using a common casing standard can make it easier to
distinguish variables from other types of identifiers (e.g.,
classes).</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>temperature</p>
<p>gibbsFreeEnergy</p>
<p>x = A\b % A is a matrix</p>
<p>Binverse</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>KineticEnergy</p>
<p>BTransform</p>
<p>Greenwich_Mean_Time</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check naming.variable.regularExpression (R2025a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## Functions

**Name length for functions and other programming interface elements**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Limit the name length of functions, classes, methods, properties,
and other elements of a programming interface to &lt;= 32
characters.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Limiting identifier length will make it easier
for others to review and understand your code.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>reactivePowerLoss</p>
<p>inverseTransformDecompression</p>
<p>optimizeBresenhamConversion</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>validateBlockPathForModelBlockNormalModeVisibility</p>
<p>plotExactRectangularMembraneConstantLineLoad</p></td>
</tr>
<tr>
<td>Detection</td>
<td><p>Code Analyzer checks (R2025a)</p>
<ul>
<li><p>naming.class.maxLength</p></li>
<li><p>naming.function.maxLength</p></li>
<li><p>naming.localFunction.maxLength</p></li>
<li><p>naming.method.maxLength</p></li>
<li><p>naming.nestedFunction.maxLength</p></li>
<li><p>naming.property.maxLength</p></li>
<li><p>naming.event.maxLength</p></li>
<li><p>naming.enumeration.maxLength</p></li>
</ul></td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Function name style**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td><p>Name functions and methods using a verb or verb phrase to convey
the action performed. Alternatively, name functions and methods using a
noun or noun phrase if the noun describes the thing being created.</p>
<p>Use the numeral "2" in the name of a conversion function.</p>
<p>Use the prefix “is” or “has” for a function whose primary output is a
logical value.</p>
<p>Use complementary names for functions with complementary operations
(e.g., start/stop, create/destroy, etc.).</p></td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Well-chosen function names are unambiguous and avoid
confusion over what the function does.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>calculatePower % Verb phrase: action performed</p>
<p>sankeyPlot % Noun phrase: thing created</p>
<p>joule2Calorie % Conversion function</p>
<p>isConfigured, hasValue % Boolean output</p>
<p>readData, writeData % Symmetric functions</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Function name casing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use lowerCamelCase or lowercase for function names. For function
names that combine multiple words, prefer lowerCamelCase.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using a common casing standard can make it easier to
distinguish functions from other types of identifiers (e.g., class
methods).</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>initializePressure</p>
<p>inverseTransform</p>
<p>optimizeLayout</p>
<p>solarRadiation</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>QueryDB</p>
<p>PRINTALL</p>
<p>detect_features</p></td>
</tr>
<tr>
<td>Detection</td>
<td><p>Code Analyzer checks (R2025a)</p>
<ul>
<li><p>naming.function.casing</p></li>
<li><p>naming.localFunction.casing</p></li>
<li><p>naming.nestedFunction.casing</p></li>
</ul></td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Name-Value argument casing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use UpperCamelCase for the names in Name-Value arguments.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using a common casing standard can make it easier to
identify name-value arguments in a function declaration or in a function
call.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>plot(x, y, LineWidth=2)</p>
<p>surf(peaks, FaceColor="interp")</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## Classes

**Class name style**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td><p>If a class represents a thing, use a noun or noun phrase in the
name (e.g., PrintServer).</p>
<p>If a class implements a set of behaviors or capabilities that other
classes can obtain via inheritance, such as a mixin class, use an
adjective (e.g., Copyable).</p>
<p>Do not put "class" in a class name. Do not use special attributes of
the class (e.g., Abstract) in the name.</p></td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Well-chosen class names are unambiguous and gives
the reader an idea what the class represents.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>PrintQueue</p>
<p>imageAdapter</p>
<p>pickable</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Class name casing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use UpperCamelCase for the names of classes defined in a namespace.
If the class is defined in the MATLAB global name space, use the
"Function name casing" Rule above.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using a common casing standard can make it easier to
distinguish classes from other identifier types. Using function name
casing in the global name space allows users to call a class constructor
like an ordinary function.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>transmitter.OptionsBase % in a namespace</p>
<p>shapes.Polynomial % in a namespace</p>
<p>ecgSignal % in the global namespace</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Method name style**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Method names should be either a verb phrase or a noun phrase
following the same Best Practice as function names.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Well-chosen method names are unambiguous and
avoid confusion over what the method does.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>modulateSignal</p>
<p>setRollOff</p>
<p>receiveCode</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Method name casing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use lowerCamelCase or lowercase for method names. For method names
that combine multiple words, prefer lowerCamelCase.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using a common casing standard can make it easier to
identify methods and functions.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>gpsCoordinates</p>
<p>startRecording</p>
<p>registerDevice</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check naming.method.casing (R2025a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Property name style**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use a noun or noun phrase for most property names. Use a verb phrase
if a property is a logical value that indicates whether the object does
something, or can do something, or has something (e.g.,
HasOutputPort).</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Well-chosen property names are unambiguous and
tell the user of the class what information the property contains.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>TextBuffer</p>
<p>CodeTable</p>
<p>HasEncoder</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Property name casing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use UpperCamelCase for property names.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using a common casing standard can make it easier to
identify class properties and distinguish them from other identifier
types.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>StartTime</p>
<p>RelativeTolerance</p>
<p>Visible</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check naming.property.casing (R2025a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Event name casing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use UpperCamelCase for event names.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using a common casing standard can make it easier to
identify events of a class.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>RowSelected</p>
<p>DeviceAdded</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check naming.event.casing (R2025a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

##  ****Namespaces

**Namespace name casing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use short, lowercase names for namespaces.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Long namespace names can be hard to read especially
with inner namespaces.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>multivariate</p>
<p>clustering</p>
<p>astrometry.catalogue</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Namespace content names**

| Type | Best Practice |
|----|----|
| Description | Do not use the namespace name in the name of a function, class, enumeration, or inner namespace. |
| Motivation | Readability: Adding the namespace name to its contents doesn't provide any additional information and just makes namespace contents harder to read. |
| Recommended | learning.findClusters |
| Not Recommended | learning.learningFindClusters |
| Detection | Not detectable |
| History | Introduced in Version 1.0 |

# Statements & Expressions Guidelines

## General

**Statements per line**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not put multiple statements on a single line.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Understandability: Multiple statements on a single line makes
code more difficult to understand and review.</p>
<p>Maintainability: It is harder to debug code with multiple statements
on the same line.</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>fs = 1000; t = 0:1/fs:1; f = 9;</p>
<p>for k = 1:N; dStp(k) = (1/2)*Stp(k-2) + (-2/3)*Stp(k-1); end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Use of literal values**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid using literal values in expressions especially when those
values appear in multiple places. Similarly, avoid using literal values
in a function call. In both cases, use a variable instead.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Maintainability: Using the same literal value in multiple parts
of the code makes the code more difficult to maintain, especially when
the literal value needs to be changed.</p>
<p>Correctness: Failure to change a literal value in multiple locations
can lead to unexpected errors.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td><p>gasConstant = 8.314;</p>
<p>molarVolume = gasConstant*temperature/pressure;</p>
<p>employeeID = "ABF4578";</p>
<p>record = queryEmployees(employeeID);</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>molarVolume = 8.314*temperature/pressure;</p>
<p>record = queryEmployees("ABF4578");</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Writing numeric literals**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Write floating point literals with a digit (e.g., "0") before the
decimal point.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using a zero before the decimal point makes it easier
to distinguish "0.1" from "1".</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>x = 0.1;</p>
<p>x = 1.0e-1;</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td>x = .1;</td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## Variables

**Global variables**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid the use of global variables. Instead, pass variables as
arguments to a function.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Maintainability: Global variables may lead to potential errors
that are hard to diagnose.</p>
<p>Testability: If a global variable is changed in multiple functions,
calling those functions in a different order can lead to different
results.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td>gravity = 32;<br />
distance = falling((0:0.1:5)', gravity);<br />
<br />
function dist = falling(t, gravity)<br />
h = 0.5*gravity*t.^2;<br />
end</td>
</tr>
<tr>
<td>Not Recommended</td>
<td>global gravity<br />
gravity = 32;<br />
distance = falling((0:0.1:5)');<br />
<br />
function dist = falling(t)<br />
global gravity<br />
h = 0.5*gravity*t.^2;<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detected as a guideline. Is detected as a Code Analyzer warning
by check GVMIS (R2021b)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Persistent variables**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Minimize the use of persistent variables. Caching data as a
persistent variable between function calls <em>can be used</em> to avoid
reloading or recomputing a large amount of data on each function
call.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Extensive use of persistent variables can make
program logic more difficult to understand.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>function timeZone = getTimeZone(latitude, longitude)<br />
% GETTIMEZONE Determine the time zone for a given<br />
% latitude and longitude<br />
%<br />
% This function loads a mat file containing shapes<br />
% for 439 worldwide time zones. The shapes are used<br />
% to find the time zone that corresponds to a<br />
% specified latitude and longitude. The shapes are<br />
% persistent to avoid loading them on every call.</p>
<p>arguments<br />
latitude (1, 1) double {mustBeInRange(latitude, -90, 90)}<br />
longitude (1, 1) double {mustBeInRange(longitude, -180, 180)}<br />
end<br />
<br />
persistent timeZones<br />
if isempty(timeZones)<br />
load("timeZones.mat", "timeZones")<br />
end<br />
<br />
% Rest of calculations here<br />
<br />
end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally by enabling Code Analyzer check DAFPV (R2023a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## MATLAB Types

**Defining structs**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Define all fields in a struct in a single block of code. Do not add
or remove fields from an existing struct outside of the function in
which it was created.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Structs whose fields change across multiple
functions or methods are confusing, error-prone, and hard to
maintain.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>starData = struct(CatalogueNumber=[], IAUName="", ...</p>
<p>Magnitude=[], RightAscension=[], Declination=[]);</p>
<p>Experiment.Frequency = 1000;</p>
<p>Experiment.Range = [200 400];</p>
<p>Experiment.Harmonic = true;</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Use of cell arrays**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use cell arrays only to store data of varying classes and/or sizes.
Do not use cell arrays to store character vectors as text data. Use a
string array instead.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Readability: Using string arrays instead of cell arrays of
character vectors improves the readability of the code.</p>
<p>Performance: String operations are more performant than operations on
cell arrays of character vectors.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td><p>data = {datetime "abc" 123};</p>
<p>arrays = {rand(1,10) zeros(2,4) eye(5)};</p>
<p>missions = ["Mercury" "Gemini" "Apollo"];</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td>missions = {'Mercury' 'Gemini' 'Apollo'};</td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally by enabling Code Analyzer check DAFCVC (R2024a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## Expressions

**Use of command form**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not use command syntax in functions or methods. Use of command
syntax should be limited to the command line or in scripts.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Mixing command form and functional form makes code
harder to read and understand.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>save("catalogue.mat", "starData") % functional form</p>
<p>hold("on") % functional form</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>load catalogue.mat % command form</p>
<p>clear all % command form</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally by enabling Code Analyzer check DAFCF (R2023a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Parentheses in mathematical and logical expressions**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use parentheses in mathematical and logical expressions to improve
readability.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Judicious use of parentheses can make
mathematical and logical expressions easier to read and understand.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>w = (c*d)/(e^f);</p>
<p>y = -(2^2);</p>
<p>m = ((A &gt; 2) &amp;&amp; (B &lt; 10)) || (C == 2);</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>w = c*d/e^f;</p>
<p>y = -2^2; % Is this 4 or -4?</p>
<p>m = A &gt; 2 &amp;&amp; B &lt; 10 || C == 2;</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Floating point comparisons**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not use == or ~= to compare two floating point values.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Correctness: Use of == or ~= to compare floating point values can
lead to logical errors.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>areEqual = abs(a-b) &lt; 1.0e-4;</p>
<p>areEqual = isapprox(a, b); % introduced in R2024b</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td>areEqual = (a == b);</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Creating and parsing filenames**

| Type | Best Practice |
|----|----|
| Description | Use the fileparts, fullfile, and filesep functions to create or parse filenames in a platform independent way. |
| Motivation | Portability: These functions allow you to manage file and folder names consistently across any MATLAB supported platform (OS). |
| Recommended | fileName = fullfile("myfolder", "mysubfolder", "myfile.m"); |
| Not Recommended | fileName = "myfolder" + "\\ + "mysubfolder" + "\\ + "myfile.m"; |
| Detection | Not detectable |
| History | Introduced in Version 1.0 |

## Loops and Conditionals

**Nesting of control statements**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Limit nesting of loop and conditional statements to 5 levels.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Readability: Deep nesting adds to the visual complexity of the
code.</p>
<p>Maintainability: Deeply nested code can lead to subtle errors that
are difficult to identify and fix.</p></td>
</tr>
<tr>
<td>Allowed</td>
<td><p>% Find the indices of all primes in matrix A</p>
<p>% Requires 3 levels of nesting and works for matrices of any
dimension</p>
<p>index = false(size(A));</p>
<p>for m = 1:numel(A)</p>
<p>if (A(m) == 1)</p>
<p>continue</p>
<p>end</p>
<p>if (A(m) == 2) || (A(m) == 3)</p>
<p>index(m) = true;</p>
<p>continue</p>
<p>end</p>
<p>if (mod(A(m), 2) == 0) || (mod(A(m), 3) == 0)</p>
<p>continue</p>
<p>end</p>
<p>index(m) = true;</p>
<p>maxFactors = floor((sqrt(A(m))+1)/6);</p>
<p>for p = 1:maxFactors</p>
<p>if (mod(A(m), 6*p-1) == 0 || mod(A(m), 6*p+1) == 0)</p>
<p>index(m) = 0;</p>
<p>end</p>
<p>end</p>
<p>end</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>% Find the indices of all primes in matrix A</p>
<p>% Requires 6 levels of nesting</p>
<p>index = false(size(A));</p>
<p>for m = 1:size(A,1)</p>
<p>for n = 1:size(A,2)</p>
<p>if A(m, n) &gt; 1</p>
<p>if (A(m, n) == 2) || (A(m, n) == 3)</p>
<p>index(m, n) = true;</p>
<p>elseif (mod(A(m, n), 2) ~= 0) &amp;&amp; (mod(A(m, n), 3) ~= 0)</p>
<p>index(m, n) = true;</p>
<p>maxFactors = floor((sqrt(A(m, n))+1)/6);</p>
<p>for p = 1:maxFactors</p>
<p>if (mod(A(m, n), 6*p-1) == 0 || ...</p>
<p>mod(A(m, n), 6*p+1) == 0)</p>
<p>index(m, n) = false;</p>
<p>end</p>
<p>end</p>
<p>end</p>
<p>end</p>
<p>end</p>
<p>end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check MNCSN (R2023a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Growing arrays inside a loop**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid incrementally changing the size of an array inside a loop.
Whenever possible, pre-allocate the array immediately before the
loop.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Understandability: Pre-allocating an array makes it explicit how
much memory will be needed making the code’s behavior easier to
predict.</p>
<p>Performance: Preallocation of arrays provides better
performance.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td><p>x = zeros(1,1000); % double array<br />
for k = 2:1000<br />
x(k) = x(k-1) + 5;<br />
end</p>
<p>objs = createArray(1,5,"myClass"); % array of objects<br />
for k = 1:5<br />
objs(k).seed = rand;<br />
end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable as a guideline. Is detected as a Code Analyzer
warning by check AGROW (R2006b)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Iterator modification**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not modify a loop iterator inside a for loop.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: The logic of the loop is more predictable, less
prone to error, and easier to modify.</td>
</tr>
<tr>
<td>Not Allowed</td>
<td>data = [3 -1 4 -2 5 -3 6];<br />
n = length(data);<br />
<br />
% Try to remove negative values from the array<br />
for ii = 1:n<br />
if data(ii) &lt; 0<br />
data(ii) = []; % Remove the negative number<br />
ii = ii - 1; % Compensate for removed element<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check FXSET (R2007b)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Use of break, continue, & return**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Minimize the use of break, continue, and return inside a for or
while loop. Use break and continue only when it makes the loop more
concise or more readable.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: The unnecessary use of break, continue, and
return can introduce flow changes that make the intent of the loop more
difficult to understand.</td>
</tr>
<tr>
<td>Recommended</td>
<td>data = [4 -1 6 -3 2 8 -5];<br />
total = 0;<br />
for ii = 1:length(data) % Sum positive values<br />
if data(ii) &gt; 0<br />
total = total + data(ii);<br />
end<br />
end</td>
</tr>
<tr>
<td>Not Recommended</td>
<td>data = [4 -1 6 -3 2 8 -5];<br />
total = 0;<br />
for ii = 1:length(data) % Sum positive values<br />
if data(ii) &lt; 0<br />
continue<br />
end<br />
total = total + data(ii);<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally by enabling Code Analyzer checks DAFCO (continue), DAFBR
(break), and DAFRT (return)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Else as exceptional case**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>When using if-else, put the usual case in the if part and the
exceptional case in the else part.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Makes code logic easier to follow by preventing
special cases from obscuring the normal execution path.</td>
</tr>
<tr>
<td>Recommended</td>
<td>if size(A, 1) == size(b, 1)<br />
x = A\b;<br />
else<br />
error("Size mismatch between A and b");<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Otherwise in switch statements**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>A switch statement should always have an otherwise block. If the
otherwise block is empty, include a comment explaining why no other
cases can occur.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: An otherwise clause will allow you to capture and
handle any unexpected cases.</td>
</tr>
<tr>
<td>Recommended</td>
<td>switch state<br />
case "On"<br />
startDevice()<br />
case "Off"<br />
stopDevice()<br />
otherwise<br />
error("Unknown state " + state)<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## Making Calls to Functions

**Functions with no arguments**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use empty parentheses when calling functions or class methods with
no arguments. This will make it clear that a function is being used
rather than a variable. Reasonable exceptions include certain common
functions like pi, true, and false and certain graphics related
functions like gcf and gca.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using parentheses with no-argument functions makes it
easier to distinguish functions from ordinary variables.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>randomParameters = rng();</p>
<p>currentTime = datetime();</p>
<p>x = 2*pi;</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td>currentFolder = pwd;</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Ignore unused outputs**

| Type | Best Practice |
|----|----|
| Description | Use the tilde character (~) to ignore unused, leading outputs from a function. |
| Motivation | Understandability: Use of the tilde character is a clear sign to the reader that certain outputs will not be used subsequently. |
| Recommended | \[~, ~, V\] = svd(A); |
| Detection | Not detected as a guideline. Is detected as a Code Analyzer warning by check ASGLU (R2010b) |
| History | Introduced in Version 1.0 |

**Use of name-value arguments**

| Type | Best Practice |
|----|----|
| Description | Use Name=Value syntax (R2021a) when passing Name-Value arguments to a function. |
| Motivation | Readability: Name=Value syntax makes it easier to associate names with values in a long list of optional values. |
| Recommended | plot(x, y, Color="g", LineWidth=3, Marker="\*") |
| Not Recommended | plot(x, y, "Color", "g", "LineWidth", 3, "Marker", "\*") |
| Detection | Not detectable |
| History | Introduced in Version 1.0 |

##  

## Functions to Avoid

**eval function**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid the use of the eval function. The eval function can lead to
unexpected code execution especially when using the function with
untrusted user input.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Maintainability: Use of eval can lead to unintended behavior.</p>
<p>Reusability: A call to eval may be safe in a given context but can
create security or other concerns in a different context.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td>numArrays = 10;<br />
A = cell(numArrays,1);<br />
for ii = 1:numArrays<br />
A{ii} = magic(ii);<br />
end</td>
</tr>
<tr>
<td>Not Recommended</td>
<td>numArrays = 10;<br />
for ii = 1:numArrays<br />
eval("A" + int2str(ii) + " = magic(ii)");<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally using <a
href="https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html#mw_38519ef1-c176-4933-b2e6-bd17e641681d">custom
Code Analyzer check for existing functions</a></td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Workspace functions**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid the use of functions which manipulate a workspace outside the
current context. The evalin and assignin functions should not be used as
a replacement for function outputs. Variables in the base workspace
should not be used as if they are global variables.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Modifying variables in another context may lead to
subtle and unexpected errors.</td>
</tr>
<tr>
<td>Recommended</td>
<td>% Update configuration safely<br />
config = updateConfig(config, "simulationSpeed", 2.5);<br />
<br />
function config = updateConfig(config, param, value)<br />
if isfield(config, param)<br />
config.(param) = value; % Modify known parameters<br />
else<br />
error("Invalid config parameter: %s", param);<br />
end<br />
end</td>
</tr>
<tr>
<td>Not Recommended</td>
<td>% Update configuration unsafely<br />
updateConfig(config, "simulationSpeed", 2.5);<br />
<br />
function updateConfig(config, param, value)<br />
command = config + "." + param + " = " + num2str(value);<br />
evalin("base", command);<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally using <a
href="https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html#mw_38519ef1-c176-4933-b2e6-bd17e641681d">custom
Code Analyzer check for existing functions</a></td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Path functions**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Minimize the use of cd, addpath, and rmpath to modify the current
folder or the MATLAB search path within a function or method. If you
must use these functions, reset the current folder and path before
exiting the function.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Reusability: Functions that manipulate the current folder and
path may not work properly in other contexts.</p>
<p>Maintainability: Current folder and path changes may lead to subtle
changes in behavior.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td><p>function output = myFunction(input)</p>
<p>oldPath = path;</p>
<p>c = onCleanup(@()path(oldPath));</p>
<p>newFolder = "C:\MATLAB\mydir";</p>
<p>addpath(genpath(newFolder));</p>
<p>% Perform some calculations<br />
end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally using <a
href="https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html#mw_38519ef1-c176-4933-b2e6-bd17e641681d">custom
Code Analyzer check for existing functions</a></td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

# Formatting Guidelines 

## Use of Spaces

**Spaces vs. tabs**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use spaces rather than tabs to add white space.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: The tab character may be interpreted differently in
different editors or on different platforms.</td>
</tr>
<tr>
<td>Allowed</td>
<td>for ii = 1:m<br />
□□□□for jj = 1:n<br />
□□□□□□□□A(ii, jj) = ii + jj;<br />
□□□□end<br />
end</td>
</tr>
<tr>
<td>Not Allowed</td>
<td>for ii = 1:m<br />
&lt;tab&gt;for jj = 1:n<br />
&lt;tab&gt;&lt;tab&gt;A(ii, jj) = ii + jj;<br />
&lt;tab&gt;end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected. Applied by default Editor preference
setting.</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Indentation**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use 4 spaces per indent level.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: A consistent indent level makes code easier to
read.</td>
</tr>
<tr>
<td>Allowed</td>
<td>for ii = 1:m<br />
□□□□for jj = 1:n<br />
□□□□□□□□A(ii, jj) = ii + jj;<br />
□□□□end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected. Applied by default Editor preference
setting.</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Spaces inside grouping operators**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not add spaces immediately after an opening parenthesis, square
bracket, or curly brace. Do not add spaces immediately before a closing
parenthesis, square bracket, or curly brace.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: In most cases, extra spaces do not enhance readability.
They just make lines longer.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>a = sin(exp(1));</p>
<p>A = [1 0; 0 1];</p>
<p>B = {12 "def"};</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>a = sin(exp( 1) );</p>
<p>A = eig([ 2 3; 4 5 ]);</p>
<p>B = A( (A &gt; 2) &amp; (A &lt; 5) );</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Spaces after commas, & semicolons**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Put spaces after commas or semicolons except at the end of a
line.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Spaces after commas and semicolons make code lines
easier to read.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>A = [6 4 23 -3; 9 -10 4 11; 2 8 -5 1];</p>
<p>S = std(A, 2, "omitmissing");</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>B = [1 2 3;4 5 6];</p>
<p>T = rand(5,4,3,"single");</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Spaces at the end of lines**

| Type | Rule |
|----|----|
| Description | Do not put extra whitespace at the end of lines. |
| Motivation | Maintainability: Extra whitespace can create diff and merge conflicts. |
| Not Allowed | first = 1;□□ |
| Detection | Not currently detected |
| History | Introduced in Version 1.0 |

**Spaces around assignment operator**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use one space on either side of the assignment (=) operator in an
assignment statement. Do not use spaces around = when using Name=Value
syntax to specify optional arguments to a function.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Spaces around the assignment operator make statements
easier to read, especially when the left operand is a variable with a
long name and/or the right operand is a complex expression. No space
around = when using Name=Value syntax makes the grouping of named
argument pairs easier to identify.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>initialValue = 3.2;</p>
<p>plot(x, y, LineWidth=3);</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>apparentMagnitude=1.2;</p>
<p>plot(x, y, LineWidth = 3);</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Spaces around relational operators**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use one space on either side of the relational operators<br />
(&lt;, &lt;=, ==, ~=, &gt;, &gt;=).</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Spaces around a relational operator makes statements
easier to read, especially when the operands are long, complex
expressions.</td>
</tr>
<tr>
<td>Allowed</td>
<td>if (x &lt;= 3) || (x &gt;= 5)</td>
</tr>
<tr>
<td>Not Allowed</td>
<td>A(A&gt;2)</td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Spaces around logical operators**

| Type | Rule |
|----|----|
| Description | Use one space on either side of the logical (&, &&, \|, \|\|) operators. |
| Motivation | Readability: Spaces around a logical operator makes statements easier to read, especially when the operands are long, complex expressions. |
| Allowed | A(A & ~mod(A, 2)) |
| Not Allowed | C = A\|B |
| Detection | Not currently detected |
| History | Introduced in Version 1.0 |

**Spaces around colon operator**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not use spaces around the colon operator or in the operands on
either side of the colon operator.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Indexing expressions are easier to read without any
spaces.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>evenNumbers = 2:2:10;</p>
<p>B = A(2:end-1);</p>
<p>for ii = first+1:last-1</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>evenNumbers = 2 : 2 : 10;</p>
<p>B = A(2 : end – 1);</p>
<p>for ii = first + 1:last – 1</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Spaces around multiply, divide, & exponent operators**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not put spaces around the multiply, divide, or exponent
operators<br />
(* .* / ./ \ .\ ^ .^).</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: These operators are written without spaces around them
in mathematical expressions.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>sin(c)/exp(d)</p>
<p>A.^2</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>(a+b) * (c / d)</p>
<p>3 ^ 2</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Spaces around plus and minus operators**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>When an expression appears on the right-hand side of an assignment
statement, use spaces around the plus and minus operators that operate
on the main terms of that expression. Put no spaces around plus or minus
in other places, such as within grouped terms, as argument to functions,
or as indexing operands.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Judicious use of spacing around the plus and minus
operators make mathematical expressions more readable.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>x = 1 + sin(pi) – cos(pi);</p>
<p>z = (a+b) + exp(c+d);</p>
<p>r = xhex + mod(k-1, 2)*D + D*2*j – (radius+3)/2;</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>v = exp(a + b);</p>
<p>w = y &gt; x + 1;</p>
<p>du(np) = -upap(n, a(np), w)+meru(a(np), c0)+plterm;</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Spaces after unary operators**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not use spaces after the unary operators +, -, or ~.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Extra spaces after a unary operator makes code more
difficult to read.</td>
</tr>
<tr>
<td>Allowed</td>
<td>x = -1;</td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>A = [- 1 1];</p>
<p>y = ~ x;</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## Use of Blank Lines

**Around related blocks of code**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use a single blank line to separate sections of code that perform
distinct tasks or are logically related.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Breaking up logical sections of code with blank lines
can make logic and program flow easier to understand.</td>
</tr>
<tr>
<td>Recommended</td>
<td>idx = solarElevation &lt;= 0;<br />
solarElevation(idx) = [];<br />
solarAzimuth(idx) = [];<br />
<br />
airMass = calculateAirMass(solarElevation);<br />
solarRadiation = 1.353.*0.7.^(airMass.^0.678);<br />
<br />
t1 = cosd(solarElevation).*sind(panelTilt).* ...<br />
cosd(180-solarAzimuth);<br />
t2 = sind(solarElevation).*cosd(panelTilt);<br />
panelRadiation = solarRadiation.*max(0, t1+t2);</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Around local functions**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use one blank line to separate local function declarations.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Blank lines clearly mark where functions begin and
end.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>function Tc = centigrade2Fahrenheit(Tf)</p>
<p>Tc = 9*Tf/5 + 32;</p>
<p>end</p>
<p>function Tk = centigrade2Kelvin(Tc)</p>
<p>Tk = Tc + 273.15;</p>
<p>end</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>function Tc = centigrade2Fahrenheit(Tf)</p>
<p>Tc = 9*Tf/5 + 32;</p>
<p>end</p>
<p>function Tk = centigrade2Kelvin(Tc)</p>
<p>Tk = Tc + 273.15;</p>
<p>end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Around methods**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use one blank line to separate method declarations in a classdef
file.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Blank lines clearly mark where one method ends and the
next one begins.</td>
</tr>
<tr>
<td>Allowed</td>
<td>methods<br />
function signal = Signal(data, freq)<br />
signal.Frequency = freq;<br />
signal.Data = data;<br />
end<br />
<br />
function signal = removeTrend(signal, order)<br />
for ii = 1:numel(signal)<br />
signal(ii).Data = detrend(signal(ii).Data, order);<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Not Allowed</td>
<td>methods<br />
function signal = Signal(data, freq)<br />
signal.Frequency = freq;<br />
signal.Data = data;<br />
end<br />
function signal = removeTrend(signal, order)<br />
for ii = 1:numel(signal)<br />
signal(ii).Data = detrend(signal(ii).Data, order);<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Around method blocks**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use one blank line to separate method blocks in a classdef
file.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Blank lines clearly mark where method blocks with
specific attributes begin and end.</td>
</tr>
<tr>
<td>Allowed</td>
<td><blockquote>
<p>methods<br />
function signal = Signal(data, freq)<br />
signal.Frequency = freq;<br />
signal.Data = data;<br />
end<br />
end<br />
<br />
methods (Access = Protected)<br />
function signal = removeTrend(signal, order)<br />
for ii = 1:numel(signal)<br />
signal(ii).Data = detrend(signal(ii).Data, order);<br />
end<br />
end<br />
end</p>
</blockquote></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><blockquote>
<p>methods<br />
function signal = Signal(data, freq)<br />
signal.Frequency = freq;<br />
signal.Data = data;<br />
end<br />
end<br />
methods (Access = Protected)<br />
function signal = removeTrend(signal, order)<br />
for ii = 1:numel(signal)<br />
signal(ii).Data = detrend(signal(ii).Data, order);<br />
end<br />
end<br />
end</p>
</blockquote></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Around property blocks**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use one blank line to separate property blocks in a classdef
file.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Blank lines clearly mark where property blocks with
specific attributes begin and end.</td>
</tr>
<tr>
<td>Allowed</td>
<td>properties<br />
Frequency<br />
Data<br />
end<br />
<br />
properties (Dependent)<br />
Time<br />
end</td>
</tr>
<tr>
<td>Not Allowed</td>
<td>properties (Access = public)<br />
MinimumRadius = 1<br />
MaximumIterations = 1<br />
end<br />
properties (Access = private)<br />
SigmaXY<br />
end<br />
properties (Dependent)<br />
RegionOfInterest<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**At the beginning or end of a file**

| Type | Rule |
|----|----|
| Description | Do not put extra blank lines at the top or bottom of a script, function, or classdef file. |
| Motivation | Maintainability: Extra blank lines can create diff and merge conflicts. |
| Detection | Not currently detected |
| History | Introduced in Version 1.0 |

##  

## Lines in Code Files

**Line length**

<table>
<colgroup>
<col style="width: 22%" />
<col style="width: 73%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th colspan="2">Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td colspan="2">Code and comment lines should be &lt;= 120
characters.</td>
</tr>
<tr>
<td>Motivation</td>
<td colspan="2">Readability: Shorter code lines are easier to read and
minimize horizontal scrolling.</td>
</tr>
<tr>
<td>Allowed</td>
<td colspan="2"><p>solarAzimuth =
acos((sin(solarDeclination)*cos(latitude) - ...</p>
<p>cos(solarDeclination)*sin(latitude)*cos(angle))/cos(elevation));</p>
<p>term1 = sin(solarDeclination)*cos(latitude);</p>
<p>term2 = cos(solarDeclination)*sin(latitude)*cos(angle)</p>
<p>solarAzimuth = acos((term1 - term2)/cos(elevation));</p>
<p>% For each slice we will calculate a sequence of numbers by
repeated<br />
% application of the operator. We will stop looking when the<br />
% last element of the current slice is below the lower limit.</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check LLMNC (R2023a)</td>
<td></td>
</tr>
<tr>
<td>History</td>
<td colspan="2">Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Line breaks**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Split long lines to maximize readability. When breaking a long line,
consider breaking the line after a comma, after a space, or at a binary
operator.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Using a consistent strategy for splitting long lines
will make them easier to read and make the logic easier to
understand.</td>
</tr>
<tr>
<td>Recommended</td>
<td>planetTemperature = estimateTemperature(starTemperature, ...<br />
starSolarRadii, planetEarthRadii, planetOrbitalAxis);<br />
<br />
index = (im(:,:,1) &gt; h &amp; (im(:,:,2)+im(:,:,3)) &lt; l) |
...<br />
(im(:,:,2) &gt; h &amp; (im(:,:,3)+im(:,:,1)) &lt; l) | ...<br />
(im(:,:,3) &gt; h &amp; (im(:,:,1)+im(:,:,2)) &lt; l);</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

# Code Comments Guidelines

## General

**Language**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use a common language, like English, for comments in code that will
be read or used by someone whose native language is different than your
own.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Use of English allows MATLAB users outside your home
country to read and understand code comments.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>% Get the exponentiated values for nDigit numbers</p>
<p>% Initialize the first number of the first slice</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>% nDigit の数値のべき乗された値を取得します</p>
<p>% Inizializza il primo numero della prima fetta</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Comment symbol**

| Type | Rule |
|----|----|
| Description | Use at least one space after the comment symbol "%". Use "%%" to define a new section. |
| Motivation | Readability: The extra space after the comment symbol increases readability. |
| Allowed | % Find increasing, decreasing edge line indices |
| Detection | Not currently detected |
| History | Introduced in Version 1.0 |

##  

## Placement and Indentation

**H1 and help content and placement**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Place the function H1 line immediately after the function
declaration and before the arguments block. The H1 line should provide a
brief description of what the function does. Help text that follows the
H1 line should provide the information the user needs to use the
function including the syntax, a description of inputs and outputs, and
any side effects.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Well written function help makes functions easier
to use and modify as needed.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>function b = rowWiseLast(A)<br />
% rowWiseLast finds the last non-zero element in each row</p>
<p>% Syntax:</p>
<p>% rowWiseLast(A)<br />
% Inputs:<br />
% A Input matrix<br />
% Outputs<br />
% b Vector containing the last non-zero value in each row<br />
% of A. Note that b(i) = 0 if A(i,:) is all zeros.<br />
arguments<br />
A (:, :) double<br />
end<br />
<br />
m = size(A, 2);<br />
[~, loc] = max(fliplr(logical(A)), [], 2);<br />
idx = m + 1 – loc;<br />
b = A(sub2ind(size(A), 1:size(A,1), idx'))';<br />
end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Internal comment placement**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Comments should be placed just before the code they are meant to
explain. Short comments can be placed at the end of a line.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Putting comments close to code makes the code
easier to understand and modify as needed.</td>
</tr>
<tr>
<td>Recommended</td>
<td>function test = isprime(n)<br />
% isprime(n) returns true if n is prime and false otherwise.<br />
test = true;<br />
<br />
% Test special cases for small values of n<br />
if (n == 2 || n == 3)<br />
return<br />
end<br />
<br />
% Handle non-positive numbers and multiples of 2 or 3<br />
if (n &lt;= 1 || mod(n, 2) == 0 || mod(n, 3) == 0)<br />
test = false;<br />
return<br />
end<br />
<br />
% Limit potential factors to numbers less than sqrt(n).<br />
limit = floor(sqrt(n));<br />
<br />
% Iterate through numbers of the form 6k ± 1<br />
for ii = 5:6:limit<br />
if (mod(n, ii) == 0 || mod(n, ii+2) == 0)<br />
test = false;<br />
return<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Comment indentation**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Indent H1 and help lines at the beginning of a function using the
same indent level as the function declaration. Otherwise, indent comment
lines at the same level as the lines of code that immediately
follow.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Consistent indentation makes it easier to associate
comments with related code.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>function factors = primeFactors(n)</p>
<p>% primeFactors(n) returns all prime factors</p>
<p>% Inputs</p>
<p>% n: Number to factorize</p>
<p>% Outputs</p>
<p>% factors: List of prime factors</p>
<p>arguments</p>
<p>n (1, 1) double {mustBeInteger, mustBeGreaterThan(n, 1)}</p>
<p>end</p>
<p>% Return the number if it is prime or 1</p>
<p>if isprime(n) || n == 1</p>
<p>factors = n;</p>
<p>return</p>
<p>end</p>
<p>% Find all the prime numbers up to number/2</p>
<p>allPrimes = [];</p>
<p>for ii = 2:floor(n/2)</p>
<p>if isprime(ii)</p>
<p>% Add the new prime number to the list</p>
<p>allPrimes = [allPrimes ii];</p>
<p>end</p>
<p>end</p>
<p>nPrimes = numel(allPrimes);</p>
<p>% Loop through all the primes</p>
<p>factors = [];</p>
<p>quotient = n;</p>
<p>for ii = 1:nPrimes</p>
<p>currentPrime = allPrimes(ii);</p>
<p>% Divide by the current prime until remainder is not zero</p>
<p>while mod(quotient, currentPrime) == 0</p>
<p>% Add the current prime to the list of factors</p>
<p>factors = [factors currentPrime];</p>
<p>quotient = quotient/currentPrime;</p>
<p>end</p>
<p>end</p>
<p>end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

# Function Authoring Guidelines

## General

**File name**

| Type | Rule |
|----|----|
| Description | A function file name should be the same as the name of the top-level function. |
| Motivation | Understandability: It is confusing if the function name listed in the file does not match the name used to call that function. |
| Detection | Code Analyzer check FNDEF (R14) |
| History | Introduced in Version 1.0 |

**Terminate functions with the end keyword**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>End all functions with the end keyword</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Explicitly marking the end of a function makes the code
easier to read, especially in files with multiple functions or nested
functions.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>function Tc = centigrade2Fahrenheit(Tf)</p>
<p>Tc = 9*Tf/5 + 32;<br />
end</p>
<p>function Tk = centigrade2Kelvin(Tc)</p>
<p>Tk = Tc + 273.15;<br />
end</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>function Tc = centigrade2Fahrenheit(Tf)</p>
<p>Tc = 9*Tf/5 + 32;</p>
<p>function Tk = centigrade2Kelvin(Tc)</p>
<p>Tk = Tc + 273.15;</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not currently detected</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  
Reset global state**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use caution when changing MATLAB global or system state. Restore the
state when a function or method exits. If the modified state is not
reset to the original values, subsequent code may behave
incorrectly.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Reusability: Functions should be self-contained and not depend on
or leave behind external state changes.</p>
<p>Testability: Functions that reset their state are easier to test in
isolation when they start and end with a clean slate.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td><p>newFolder = fullfile("C:\", "MATLAB", "mydir");</p>
<p>oldPath = path();</p>
<p>c = onCleanup(@()path(oldPath));</p>
<p>addpath(genpath(newFolder));</p>
<p>% Perform some calculations</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Local functions**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>A function used by only one other function or script should be
written as a local function in the same file. Keep local functions
simple. If a function needs to be independently tested, put it in its
own file.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: A local function can keep related functionality in
a single file, making it easier to read and maintain.</td>
</tr>
<tr>
<td>Recommended</td>
<td>function factor = equationOfState(gas, temperature, pressure)<br />
% Look up critical properties for gas<br />
[criticalTemperature, criticalPressure] = lookupCritical(gas);<br />
<br />
% Calculate compressibility factor<br />
factor = vanDerWaals(temperature, pressure, ...<br />
criticalTemperature, criticalPressure);<br />
end<br />
<br />
function Z = vanDerWaals(T, P, Tcritical, Pcritical)<br />
R = 8.3145; % gas constant<br />
a = 27*(R*Tcritical)^2/(64*Pcritical);<br />
b = R*Tcritical/(8*Pcritical);<br />
<br />
coefficients = [1 -(b + R*T/P) a/P -a*b/P];<br />
zeros = roots(coefficients);<br />
V = max(zeros(logical(imag(zeros) == 0))) % molar volume<br />
Z = P*V/(R*T); % compressibility<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Nested functions**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Limit the use of nested functions. Nested functions can almost
always be replaced by a local function.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Maintainability: Nested functions have access to variables in
their parent function, which can lead to unintended side effects.</p>
<p>Readability: Nested functions are defined inside another function
making the main function harder to read</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td>function factor = equationOfState(gas, temperature, pressure)<br />
% Look up critical properties for gas<br />
[Tcritical, Pcritical] = lookupCritical(gas);<br />
<br />
% Calculate compressibility factor<br />
factor = vanDerWaals(temperature, pressure);<br />
<br />
function Z = vanDerWaals(T, P)<br />
R = 8.3145; % gas constant<br />
a = 27*(R*Tcritical)^2/(64*Pcritical);<br />
b = R*Tcritical/(8*Pcritical);<br />
<br />
coefficients = [1 -(b + R*T/P) a/P -a*b/P];<br />
zeros = roots(coefficients);<br />
V = max(zeros(logical(imag(zeros) == 0))) % molar volume<br />
Z = P*V/(R*T); % compressibility<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally by enabling Code Analyzer check DAFNF</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Anonymous functions**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Keep anonymous functions simple and readable. When possible, keep
the definition and use of the anonymous function together in the
code.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Code is easier to maintain if anonymous functions
are simple and defined where they are used. If a function becomes too
long or is used multiple times, it can be converted into a local
function.</td>
</tr>
<tr>
<td>Recommended</td>
<td>equation = @(x) x^2 + log(x);<br />
root = fzero(equation, 1);</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Refactoring**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not repeat blocks of code in a function. Refactor those
statements into a new function or local function.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Maintainability: Code changes can be made in a single place.</p>
<p>Reusability: A new function can be used in other parts of an
application.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td>function dS = entropyChange(process, gas, Vi, Vf, Ti, Tf)<br />
R = 8.314; % Gas constant in J/(mol·K)<br />
[Cp, Cv] = heatCapacity(gas); % Heat capacities for gas<br />
<br />
% Compute entropy for process type<br />
switch process<br />
case "isothermal"<br />
dS = computeEntropy(R, Vi, Vf);<br />
case "constant-volume"<br />
dS = computeEntropy(Cv, Ti, Tf);<br />
case "constant-pressure"<br />
dS = computeEntropy(Cp, Ti, Tf);<br />
otherwise<br />
error("Invalid process type.");<br />
end<br />
end<br />
<br />
% Common code is factored out into a separate function<br />
function dS_val = computeEntropy(coeff, Yi, Yf)<br />
if (Yi &lt;= 0) || (Yf &lt;= 0)<br />
error("Inputs must be positive.");<br />
end<br />
dS_val = coeff*log(Yf/Yi);<br />
end</td>
</tr>
<tr>
<td>Not Recommended</td>
<td>function dS = entropyChange(process, gas, Vi, Vf, Ti, Tf)<br />
R = 8.314; % Gas constant in J/(mol·K)<br />
[Cp, Cv] = heatCapacity(gas); % Heat capacities for gas<br />
<br />
% Common code is repeated 3 times<br />
switch process<br />
case "isothermal"<br />
if (Vi &lt;= 0) || (Vf &lt;= 0)<br />
error("Volumes must be positive.");<br />
end<br />
dS = R*log(Vf/Vi);<br />
case "constant-volume"<br />
if (Ti &lt;= 0) || (Tf &lt;= 0)<br />
error("Temperatures must be positive.");<br />
end<br />
dS = Cv*log(Tf/Ti);<br />
case "constant-pressure"<br />
if (Ti &lt;= 0) || (Tf &lt;= 0)<br />
error("Temperatures must be positive.");<br />
end<br />
dS = Cp*log(Tf/Ti);<br />
otherwise<br />
error("Invalid process type.");<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

## Inputs

**Number of function inputs**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Limit the number of input arguments in a function declaration to 6.
Use name-value arguments for optional information. Multiple name-value
arguments can be represented as a single argument in the function
declaration.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Readability: Functions with fewer arguments are easier to read,
understand, and use.</td>
</tr>
<tr>
<td>Allowed</td>
<td><p>function p = calculatePotential(x, y, z, dx, dy, dz)</p>
<p>function A = getSamples(interval, data, opt)</p>
<p>arguments</p>
<p>interval (1, 1) double {mustBePositive}</p>
<p>data (1, :) double</p>
<p>opt.Port (1, 1) double</p>
<p>opt.Rate (1, 1) double</p>
<p>opt.Type (1, 1) string {mustBeMember(opts.Type, ["A","D"])}</p>
<p>end</p></td>
</tr>
<tr>
<td>Not Allowed</td>
<td><p>function dP = dipPotential(xy, Q, D, R, r0, a, b, Dx, Dy,
Nxy)</p>
<p>function readBonay(T, diam, rh, phi, S, phi, visc, zr, kn)</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check FCNIL (R2023a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Argument validation**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Validate input arguments for functions that are intended to be part
of an external, user-facing programming interface. Use an arguments
block to do validation.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Argument validation ensures that future developers
understand the function’s requirements.</td>
</tr>
<tr>
<td>Recommended</td>
<td>function [elevation, azimuth] = position(latitude, longitude,
date)<br />
arguments<br />
latitude (1, 1) double {mustBeInRange(latitude, -90, 90)}<br />
longitude (1, 1) double {mustBeInRange(longitude, -180, 180)}<br />
date (1, 1) datetime = datetime("today")<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Name-Value arguments**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid the use of varargin to handle name-value arguments. Instead
use an arguments block with optional arguments and name/value
pairs.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Readability: An arguments block explicitly defines the expected
input types, sizes, and constraints, making the function’s behavior
clearer.</p>
<p>Maintainability: Extending and modifying the function is simpler with
structured input handling.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td>function sankey = sankeyPlot(data, options)<br />
arguments<br />
data (:, :) double<br />
options.ColorOrder (:, 3) double = colororder<br />
options.Transparency (1, 1) double = 0.5<br />
options.TextSize (1, 1) double = 10<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detected as a guideline. Use of varargin may be detected by
enabling Code Analyzer check DAFVI (R2023b)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Element-wise functions**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Write element-wise functions so that they work with any array shape.
Outputs which correspond to an input of a particular shape should have
the same shape.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Ensures consistent behavior across element-wise
functions.</td>
</tr>
<tr>
<td>Recommended</td>
<td>function squaredArray = squared(array)<br />
squaredArray = zeros(size(array));<br />
for ii = 1:numel(array)<br />
squaredArray(ii) = array(ii)^2;<br />
end<br />
squaredArray = reshape(squaredArray, size(array));<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

##  

## Outputs

**Number of function outputs**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Rule</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Limit the number of output arguments in a function declaration to
4.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Readability: Too many outputs can make it difficult to understand
what the function is supposed to do.</p>
<p>Reusability: A function with few, well-defined outputs is more
flexible and reusable.</p></td>
</tr>
<tr>
<td>Allowed</td>
<td>function [tone, left, right] = psdTone(Pxx, F, rbw, freq)</td>
</tr>
<tr>
<td>Not Allowed</td>
<td>function [msg, nfft, Fs, w, p, flag, rtf] = psdchk(P, x, y)</td>
</tr>
<tr>
<td>Detection</td>
<td>Code Analyzer check FCNOL (R2023a)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Behavior changes with varargout**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Do not change the meaning of an output when the number of outputs
change.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Maintainability: With additional outputs, the logic for nargout
becomes more complicated making it difficult to modify the function's
behavior.</p>
<p>Testability: Testing becomes more complicated as test cases will have
to be written for multiple scenarios.</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>function varargout = computeStatistics(data)</p>
<p>nargoutchk(1,2);<br />
<br />
if (nargout == 1)<br />
varargout{1} = mean(data);<br />
else<br />
varargout{1} = std(data); % First output is different<br />
varargout{2} = mean(data);<br />
end<br />
end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Comma separated outputs**

| Type | Rule |
|----|----|
| Description | Use commas to separate outputs in a function declaration. |
| Motivation | Readability: Using commas to separate outputs in a function call clearly indicates each distinct output. |
| Allowed | function \[tone, left, right\] = psdTone(Pxx, F, rbw, freq) |
| Detection | Code Analyzer check NCOMMA (R2012b) |
| History | Introduced in Version 1.0 |

# Class Authoring Guidelines

## General

**File name**

| Type | Rule |
|----|----|
| Description | A classdef file name should be the same as the name of the class. |
| Motivation | Maintainability: Matching the class name and file name makes it easier to locate the class definition when debugging or modifying code. |
| Detection | Code Analyzer check MCFIL (R2008a) |
| History | Introduced in Version 1.0 |

**Handle vs value classes**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td><p>Prefer value classes to handle classes. Use handle classes to
represent an object whose state can change without changing its
identity.</p>
<p>Consider using handle for classes that</p>
<ul>
<li><p>represent physical or unique objects like hardware devices or
files</p></li>
<li><p>represent visible objects like graphics components</p></li>
<li><p>define objects in a relational data structure like a list or a
tree</p></li>
</ul></td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Understandability: Value classes are easier to understand because
different parts of the program cannot change the same data.</p>
<p>Maintainability: The state of handle classes can be changed in
multiple parts of the code making it harder to maintain the
code.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td><p>classdef EarthquakeData</p>
<p>classdef quaternion</p>
<p>classdef BluetoothReceiver &lt; handle % hardware device</p>
<p>classdef SankeyPlot &lt; handle % graphics object</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Combine property blocks**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid multiple property blocks with the same attributes unless they
are used to logically group related class properties.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Redundant property blocks make code harder to
maintain. Changing an attribute means editing multiple property
blocks.</td>
</tr>
<tr>
<td>Recommended</td>
<td>classdef OpticFlow<br />
properties (Access = public)<br />
MinimumRadius = 1<br />
MaximumIterations = 1<br />
end<br />
<br />
properties (Access = private)<br />
SigmaXY<br />
end<br />
<br />
properties (Dependent)<br />
RegionOfInterest<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Combine method blocks**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid multiple method blocks with the same attributes unless they
are used to logically group related class methods.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Redundant method blocks make code harder to
maintain. Changing an attribute means editing multiple method
blocks.</td>
</tr>
<tr>
<td>Recommended</td>
<td>classdef OpticFlow<br />
methods (Access = public)<br />
function obj = OpticFlow(varargin)<br />
% Code for OpticFlow<br />
end<br />
<br />
function obj = advanceFlow(obj)<br />
% Code for advanceFlow<br />
end<br />
end<br />
<br />
methods (Static)<br />
function [r, w] = logCoordinates(region)<br />
% Code for logCoordinates<br />
end<br />
<br />
function array = getRegion(region)<br />
% Code for getRegion<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Sealed classes**

| Type | Best Practice |
|----|----|
| Description | Use the Sealed class attribute if you do not intend people to use your class as a superclass. Only leave classes unsealed when the class is designed to be extended by others. |
| Motivation | Maintainability: Sealed classes can be modified over time without risk of becoming incompatible with subclasses. |
| Recommended | classdef (Sealed) DontSubclass |
| Detection | Not detectable |
| History | Introduced in Version 1.0 |

##  

## Properties

**Property Access Control**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Make property access as restrictive as necessary to support the
needs of the user of the class. This can make it easier to evolve the
design of the class over time. For example, only allow set access when a
property need to be set by a user of the class.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Understandability: By limiting how a property can be accessed,
you make the behavior and intent of the class more explicit.</p>
<p>Maintainability: Changing the internal structure of the class is less
likely to affect users of the class because they interact with the class
through a public interface.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td><p>classdef OpticFlow<br />
properties (Access = public)</p>
<p>maximumIterations = 1<br />
end</p>
<p>properties (SetAccess = private)</p>
<p>MinimumRadius = 1</p>
<p>end<br />
<br />
properties (Access = private)<br />
SigmaXY<br />
end<br />
end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Validation**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid using set methods purely for validation. Use property
validation syntax instead. If you have a situation where the property
needs to be validated and transformed it may be more efficient to use a
set method.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Property validation ensures that future developers
and users understand the requirements for the class properties.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>classdef Rectangle</p>
<p>properties<br />
Origin (1,2) double {mustBeReal}<br />
Width (1,1) double {mustBeReal, mustBeNonnegative}<br />
Height (1,1) double {mustBeReal, mustBeNonnegative}<br />
end</p>
<p>end</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>classdef Rectangle</p>
<p>properties<br />
Origin<br />
Width<br />
Height<br />
end<br />
<br />
methods<br />
function obj = set.Origin(obj, point)<br />
validateattributes(point, {'double'}, ...<br />
{'size', [1 2], 'real'});<br />
obj.Origin = point;<br />
end<br />
<br />
function obj = set.Width(obj, value)<br />
validateattributes(value, {'double'}, ...<br />
{'size' [1 1], 'real', 'nonnegative'});<br />
obj.Width = value;<br />
end<br />
<br />
function obj = set.Height(obj, value)<br />
validateattributes(value, {'double'}, ...<br />
{'size' [1 1], 'real', 'nonnegative'});<br />
obj.Height = value;<br />
end<br />
end<br />
end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Use of dependent properties**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td><p>Use dependent properties only when one or more of the following
is true:</p>
<ul>
<li><p>Its value is computed solely from the value of other
properties</p></li>
<li><p>Compatibility mandates the property be available to users of the
class even if the property is no longer used in the
implementation</p></li>
<li><p>A property change needs to cause a side effect on other
properties</p></li>
</ul>
<p>Otherwise use a non-dependent property.</p></td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Understandability: Non-dependent properties are easier to
understand.</p>
<p>Testability: Dependent properties can complicate unit testing because
they can automatically change when related properties are
modified.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td>classdef Rectangle<br />
properties<br />
Origin (1,2) double {mustBeReal}<br />
Width (1,1) double {mustBeReal, mustBeNonnegative}<br />
Height (1,1) double {mustBeReal, mustBeNonnegative}<br />
end<br />
<br />
properties (Dependent)<br />
Area<br />
end<br />
<br />
methods<br />
% Area calculated from Width and Height<br />
function area = get.Area(obj)<br />
area = obj.Width*obj.Height;<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

##  

## Methods

**Argument validation**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Validate input arguments for those methods that are intended to be
part of an external, user-facing programming interface (public methods).
Use an arguments block, introduced in R2019b, to do validation.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Method argument validation ensures that future
developers and users understand the requirements for the public methods
of the class.</td>
</tr>
<tr>
<td>Recommended</td>
<td>classdef Rectangle<br />
properties<br />
Origin (1, 2) double = [0 0]<br />
Width (1, 1) double {mustBeNonnegative} = 1<br />
Height (1, 1) double {mustBeNonnegative} = 1<br />
end<br />
<br />
methods (Access = public)<br />
function R = enlarge(R, x, y)<br />
arguments (Input)<br />
R (1, 1) Rectangle<br />
x (1, 1) {mustBeNonnegative}<br />
y (1, 1) {mustBeNonnegative}<br />
end<br />
R.Width = R.Width + x;<br />
R.Height = R.Height + y;<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Class constructor**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid writing class constructors that return more than one argument.
A class constructor must return a valid object or an array of objects of
the class.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: The constructor is designed only to instantiate
the object. Returning multiple outputs increases the complexity of the
constructor.</td>
</tr>
<tr>
<td>Recommended</td>
<td>classdef SquareMatrix<br />
% Custom validator mustBeSquare not shown<br />
properties<br />
Data (:,:) double {mustBeMatrix, mustBeSquare} = eye(2)<br />
end<br />
<br />
methods<br />
% Constructor returns an object of class SquareMatrix<br />
function obj = SquareMatrix(varargin)<br />
if nargin == 1<br />
obj.Data = varargin{1};<br />
end<br />
end<br />
<br />
function c = conditionNumber(obj)<br />
c = cond(obj.Data);<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Not Recommended</td>
<td>classdef SquareMatrix<br />
% Custom validator mustBeSquare not shown<br />
properties<br />
Data (:,:) double {mustBeMatrix, mustBeSquare} = eye(2)<br />
end<br />
<br />
methods<br />
% Constructor returns object and another value<br />
function [obj, condNum] = SquareMatrix(varargin)<br />
if nargin == 1<br />
obj.Data = varargin{1};<br />
end<br />
condNum = cond(obj.Data);<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Private methods**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Make methods private or protected unless they are intended to be
called by users of the class.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Maintainability: Making methods private reduces the risk of those
methods being used incorrectly by external code and private methods can
be modified without impacting users of the class.</td>
</tr>
<tr>
<td>Recommended</td>
<td>classdef SquareMatrix<br />
% Custom validator mustBeSquare not shown<br />
properties<br />
Data (:,:) double {mustBeMatrix, mustBeSquare} = eye(2)<br />
end<br />
<br />
methods<br />
function obj = SquareMatrix(varargin)<br />
if nargin == 1<br />
obj.Data = varargin{1};<br />
end<br />
end<br />
<br />
function c = conditionNumber(obj)<br />
c = cond(obj.Data);<br />
end<br />
end<br />
<br />
methods (Access = private) % Internal calculation<br />
function d = determinant(obj)<br />
d = det(obj.Data);<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Get methods**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid the use of get methods for non-dependent properties.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Performance: Get methods can add unnecessary overhead.</td>
</tr>
<tr>
<td>Recommended</td>
<td>classdef Rectangle<br />
properties<br />
Origin (1,2) double {mustBeReal}<br />
Width (1,1) double {mustBeReal, mustBeNonnegative}<br />
Height (1,1) double {mustBeReal, mustBeNonnegative}<br />
end<br />
<br />
properties (Dependent)<br />
Area<br />
end<br />
<br />
methods<br />
% get method for dependent property Width<br />
function area = get.Area(obj)<br />
area = obj.Width*obj.Height;<br />
end<br />
end<br />
end</td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Overloaded indexing**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Use modular indexing when creating a class with custom indexing.
Avoid overloading subsref and subsasgn whenever possible.</td>
</tr>
<tr>
<td>Motivation</td>
<td><p>Maintainability: Modular indexing allows different indexing
operations (e.g., paren, brace, and dot) to be customized
individually.</p>
<p>Performance: Modular indexing is more performant than subsref and
subsasgn.</p></td>
</tr>
<tr>
<td>Recommended</td>
<td><p>See documentation on Modular Indexing for detailed examples</p>
<ul>
<li><p><a
href="https://www.mathworks.com/help/releases/R2024b/matlab/ref/matlab.mixin.indexing.redefinesparen-class.html">matlab.mixin.indexing.RedefinesParen</a></p></li>
<li><p><a
href="https://www.mathworks.com/help/releases/R2024b/matlab/ref/matlab.mixin.indexing.redefinesbrace-class.html">matlab.mixin.indexing.RedefinesBrace</a></p></li>
<li><p><a
href="https://www.mathworks.com/help/releases/R2024b/matlab/ref/matlab.mixin.indexing.redefinesdot-class.html">matlab.mixin.indexing.RedefinesDot</a></p></li>
</ul></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

# Error Handling Guidelines

## General

**Code Analyzer warnings**

| Type | Best Practice |
|----|----|
| Description | Fix all Code Analyzer warnings before submitting code to source control or when making code available for use by others. |
| Motivation | Readability: Fixing Code Analyzer warnings ensures that code is free of potential issues like unused variables, unreachable code, or poor formatting resulting in cleaner and more readable code. |
| Detection | Not detectable |
| History | Introduced in Version 1.0 |

**Informative error messages**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td><p>Write error messages that provide specific information to help
the user understand the issue and what to do about it. Error messages
should take one of three forms:</p>
<ul>
<li><p><em>Problem and solution form:</em> The first sentence of the
message states the problem. The next sentence explains ways to fix
it.</p></li>
<li><p><em>Solution form:</em> The error message is a statement of what
the user could do or what must be true to fix the problem.</p></li>
<li><p><em>Problem form:</em> The error message is a <u>statement</u> of
the problem. Used when it is not possible to state a specific solution
to the problem.</p></li>
</ul></td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Clear, specific error messages help users
understand what to do when an error occurs and help future developers
know what conditions in the code trigger specific messages.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>Problem and Solution Form:</p>
<ul>
<li><p>Too many figure objects. Print 1 figure at a time. </p></li>
<li><p>Sparse matrices not supported. Use eigs instead.</p></li>
</ul>
<p>Solution Form:</p>
<ul>
<li><p>Matrices must be the same size. </p></li>
<li><p>"RelTol" value must be a nonnegative scalar.</p></li>
</ul>
<p>Problem Form:</p>
<ul>
<li><p>Matrix contains NaN or Inf. </p></li>
<li><p>Invalid option combination. </p></li>
</ul></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**Reset state on error**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Reset global state or settings to their original values when
handling errors. Consider using a try-catch block or an onCleanup object
to reset the state.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Reusability: Errors should not leave behind external state
changes.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>function output = myFunction(input)</p>
<p>oldPath = path;</p>
<p>c = onCleanup(@()path(oldPath));</p>
<p>newFolder = "C:\MATLAB\mydir";</p>
<p>addpath(genpath(newFolder));</p>
<p>% Perform some calculations which might error<br />
end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Not detectable</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

##  

## Try/Catch

**Use try/catch with the exception object**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td><p>Use try/catch blocks for error handling or to process exceptional
conditions. Do not use try/catch for normal flow control.</p>
<p>Include a matching catch block for every try block. If a catch block
is empty, include a comment explaining why no further processing is
required.</p>
<p>Use the MException object when a catch block tries to recover from a
specific error. Do not assume which error has occurred.</p></td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Using try/catch allows readers to quickly find
the place in the code where specific errors or events are handled.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>function manageGlobalState()<br />
% Store original path and current folder<br />
originalPath = path();<br />
originalDir = pwd();<br />
<br />
try<br />
% Modify global state<br />
addpath("tempFolder");<br />
cd("C:\Temp");<br />
<br />
% Perform some operations that might error<br />
<br />
catch exception<br />
% Restore path and current folder</p>
<p>cd(originalDir);<br />
path(originalPath);</p>
<p>% Rethrow the error to inform the caller<br />
rethrow(exception);<br />
end<br />
end</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally by enabling Code Analyzer check CTCH (R2010b)</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>

**  **

**Avoid throwAsCaller**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Best Practice</th>
</tr>
</thead>
<tbody>
<tr>
<td>Description</td>
<td>Avoid the use of throwAsCaller.</td>
</tr>
<tr>
<td>Motivation</td>
<td>Understandability: Using throwAsCaller requires that the error
originates exactly one level below the function that calls it. It can
give misleading error traces if the error is deeper in the call
stack.</td>
</tr>
<tr>
<td>Recommended</td>
<td><p>function numRepos = queryGitHubRepos()<br />
try<br />
numRepos = getMatlabRepoCount();<br />
catch exception<br />
throw(exception); % Preserves the full error stack<br />
end<br />
end<br />
<br />
function numRepos = getMatlabRepoCount()<br />
prefix = "https://api.github.com/search/";<br />
url = prefix + "repositories?q=language:matlab";<br />
try<br />
response = webread(url);<br />
numRepos = response.total_count;<br />
catch exception<br />
error("getMatlabRepoCount:RequestFailed", ...<br />
"GitHub API request failed: %s", exception.message);<br />
end<br />
end<br />
<br />
&gt;&gt; queryGitHubRepos()<br />
Error using queryGitHubRepos (line 7)</p>
<p>GitHub API request failed: Could not access server.</p>
<p>https://api.github.com/search/repositories?q=language:matlab.</p></td>
</tr>
<tr>
<td>Not Recommended</td>
<td><p>function numRepos = queryGitHubRepos()<br />
try<br />
numRepos = getMatlabRepoCount();<br />
catch exception<br />
throwAsCaller(exception); % Hides true source of the error<br />
end<br />
end<br />
<br />
function numRepos = getMatlabRepoCount()<br />
prefix = "https://api.github.com/search/";<br />
url = prefix + "repositories?q=language:matlab";<br />
try<br />
response = webread(url);<br />
numRepos = response.total_count;<br />
catch exception<br />
error("getMatlabRepoCount:RequestFailed", ...<br />
"GitHub API request failed: %s", exception.message);<br />
end<br />
end<br />
<br />
&gt;&gt; queryGitHubRepos()<br />
GitHub API request failed: Could not access server.</p>
<p>https://api.github.com/search/repositories?q=language:matlab.</p></td>
</tr>
<tr>
<td>Detection</td>
<td>Optionally using <a
href="https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html#mw_38519ef1-c176-4933-b2e6-bd17e641681d">custom
Code Analyzer check for existing functions</a>.</td>
</tr>
<tr>
<td>History</td>
<td>Introduced in Version 1.0</td>
</tr>
</tbody>
</table>
