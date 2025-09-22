# MATLAB Coding Guidelines

## Table of Contents

- [このドキュメントの目的](#このドキュメントの目的)
- [コーディングガイドラインの理解](#コーディングガイドラインの理解)
  - [ガイドラインの記載方法](#ガイドラインの記載方法)
  - [ルール](#ルール)
  - [ベストプラクティス](#ベストプラクティス)
  - [定義](#定義)
- [命名ガイドライン](#命名ガイドライン)
  - [一般](#一般)
  - [変数](#変数)
  - [関数](#関数)
  - [クラス](#クラス)
  - [名前空間](#名前空間)
- [文と式のガイドライン](#文と式のガイドライン)
  - [一般](#一般)
  - [変数](#変数)
  - [MATLAB の型](#matlab-の型)
  - [式](#式)
  - [ループと条件分岐](#ループと条件分岐)
  - [関数呼び出し](#関数呼び出し)
  - [使用を避ける関数](#使用を避ける関数)
- [整形ガイドライン](#整形ガイドライン)
  - [スペースの使用](#スペースの使用)
  - [空行の使用](#空行の使用)
  - [コードファイルの行](#コードファイルの行)
- [コードコメントのガイドライン](#コードコメントのガイドライン)
  - [一般](#一般)
  - [配置とインデント](#配置とインデント)
- [関数作成ガイドライン](#関数作成ガイドライン)
  - [一般](#一般)
  - [入力](#入力)
  - [出力](#出力)
- [クラス作成ガイドライン](#クラス作成ガイドライン)
  - [一般](#一般)
  - [プロパティ](#プロパティ)
  - [メソッド](#メソッド)
- [エラー処理ガイドライン](#エラー処理ガイドライン)
  - [一般](#一般)
  - [Try-Catch](#try-catch)

# このドキュメントの目的

アプリケーションが大規模かつ複雑になるにつれて、組織ではコードレビュー、自動ビルド、継続的インテグレーションなど、より形式的なコーディング手法を採用するようになっています。MATLAB コードを複数人で開発する組織では、コードベースに規則性と一貫性を持たせることで、MATLAB コードの品質向上を図りたいと考えています。

このドキュメントの目的は、大規模なアプリケーションやライブラリに貢献する MATLAB 開発チームを主な対象として、MATLAB コーディングガイドラインのセットを提示することです。MATLAB コーディングガイドラインの採用は任意です。個人でコードを書く方も、希望すればこれらのガイドラインを採用できますが、強制されるものではありません。

このガイドラインの作成には、以下の情報源が活用されました：

- MATLAB コミュニティのメンバーによって作成されたコーディングガイドライン

- MathWorks 社内のコーディングガイドライン

- 社内外の MATLAB コードベース

これらの情報源の間で広く合意が得られているガイドラインが優先されました。

このガイドラインは今後も進化していくことが期待されています。変更は MATLAB コミュニティからのフィードバックによって行われ、次回以降のバージョンに反映される予定です。

# ガイドラインの動機

このガイドラインの目的は、組織が大規模な MATLAB コードベースに規則性と一貫性を導入できるようにすることです。それに加えて、ガイドラインを使用することにはいくつかの重要な動機があります。各ガイドラインは、以下の目的のいずれかまたは複数に基づいています。

- **可読性（Readability）：** 他者がコードを読み、理解しやすくすること。適切な命名、フォーマット、構造を含みます。

- **理解しやすさ（Understandability）：** コードの論理、流れ、目的が明確であり、詳細な努力なしにその機能を把握できること。

- **保守性（Maintainability）：** コードを時間の経過とともに修正、拡張、デバッグしやすく、エラーや予期しない動作を引き起こさないこと。

- **再利用性（Reusability）：** コードのコンポーネントを、異なるプロジェクトや文脈で修正なしに使用できること。これにより、冗長性が減り、開発者の効率が向上します。

- **移植性（Portability）：** コードが異なるプラットフォームや MATLAB のバージョンで、最小限または無修正で動作すること。

- **テスト容易性（Testability）：** コードの正しさを検証するために、ユニットテストや自動テスト実行などが容易に行えること。

- **パフォーマンス（Performance）：** コードが速度やリソース使用の面で最適に実行され、計算時間やメモリ使用量を最小限に抑えること。

- **正確性（Correctness）：** コードが意図された機能を正しく実行し、誤った結果を出さないこと。


# コーディングガイドラインの理解

このドキュメントには「ルール」と「ベストプラクティス」の2種類のガイドラインが含まれています。*ルール*: ガイドラインに準拠するために必ず守るべき事項です。ルール違反はMATLAB Code Analyzerによって検出され、MATLABエディタやCode Analyzerレポートで識別されます。一部のルール違反は現時点では検出されませんが、将来のMATLABバージョンで検出される可能性があります。例：

- 変数名の長さは32文字以下に制限する
- ループや条件文のネストは5レベルまでに制限する

*ベストプラクティス*: MATLABコードの品質向上のための推奨事項です。守ることは任意です。ほとんどのベストプラクティスはCode Analyzerでは確実に検出できません。例：

- `eval`関数の使用を避ける。`eval`は予期しないコード実行につながる可能性がある（特に信頼できないユーザー入力と組み合わせる場合）。
- ファイル名の作成や解析には `fileparts`、`fullfile`、`filesep` 関数を使い、プラットフォームに依存しない方法を推奨する。

ガイドラインは「命名」「記述・表現」「フォーマット（空白の使い方）」「コードコメント」「関数作成」「クラス作成」「エラーハンドリング」などのカテゴリに整理されています。


## ガイドラインの記載方法

ガイドラインは簡潔・明確・曖昧さのない形で記述されており、適用しやすいことを目指しています。各ガイドラインには以下のような情報が表形式でまとめられています。

**Type**: ルール  

**Description**: 変数名の長さは32文字以下に制限する  

**Motivation**: 

- 可読性：変数名は説明的であるべきだが、長すぎる名前は可読性を損ない、コード行が長くなる原因となる  

**Allowed**:

```matlab
totalReactivePowerLoss
actualRipplePassbandFirstBand
intervalBetweenLaserTransitions
```

**Not Allowed**:

```matlab
significancePearsonGravitationalCorrelation
percentROIAreaContainingPositivePixels
```

**Detection:** Code Analyzer チェック `naming.variable.maxLength`（R2025a）

**History:** バージョン1.0で導入

各ガイドラインには以下の項目が含まれます。

- **Type:** ガイドラインが「ルール」か「ベストプラクティス」か

- **Description:** ガイドラインの簡単な説明。ルールは通常1文で記載されます。ベストプラクティスはより詳細な場合があります。

- **Motivation:** このガイドラインが含まれている理由

- **Allowed:** ルールやベストプラクティスに従った良い例

- **Not Allowed:** ルールやベストプラクティスに違反する悪い例

- **Detection:** ルールの場合は検出方法とMATLABで検出が可能になったバージョン。ベストプラクティスの場合はオプション検出方法とその内容。

- **History:** ガイドラインがこのドキュメントに導入されたバージョン


## ルール

ルール違反は MATLAB Code Analyzer によって（あるいは今後）検出可能です。Code Analyzer は MATLAB に搭載されたツールで、コードを解析して問題を特定し、改善のための提案を行います。構文エラー、互換性、パフォーマンス、非推奨機能など、数多くの問題を特定できます。Code Analyzer は、さまざまな潜在的なコード問題に対して[2000 を超えるチェック](https://www.mathworks.com/help/matlab/matlab_env/index-of-code-analyzer-checks.html)を提供します。これらのチェックは、以下の例に示すような[ローカルの codeAnalyzerConfiguration.json ファイルの作成](https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html)によって、有効化、無効化、またはカスタマイズできます。

<img title="" src="../images/codeAnalyzerConfiguration.png" alt="" width="439">

MATLAB Code Analyzer は、本ドキュメントに記載されたルールのサブセットに対する違反を検出できます。MATLAB の一部のバージョンでは、すべてのルール違反を検出できない場合がある点に注意してください。Code Analyzer がルール違反を検出すると、MATLAB Editor と Code Analyzer Report の両方で問題を特定します。R2025a 以降、Editor 内の違反は、以下のスクリーンショットに示すように Editor パネル右側に表示されます。

<img title="" src="../images/Editor%20Checks.png" alt="" width="356">

このガイドライン文書には、検出可能なルール違反のチェックを実装する `codeAnalyzerConfiguration.json` ファイルが付属しています。

任意のルールに対する Code Analyzer のチェックは無効化できます。上のスクリーンショットの例を考えてみましょう。関数名は lowercase もしくは lowerCamelCase にすべきだと指定するルールがあります。関数名の大文字小文字チェックをオフにしたい場合は、このルールを無効化できます。ほとんどのルールは設定変更も可能です。上記のケースでは、関数名の大文字小文字のオプションを変更して、別の規約（例: UpperCamelCase）を用いることもできます。ルール情報表の Detection フィールドには、そのルール違反の検出に使用される Code Analyzer チェックに関する情報が示されています。その情報をもとに、Code Analyzer Configuration ファイルで当該チェックを無効化または変更できます。


## ベストプラクティス

ベストプラクティスは、より良い MATLAB コードを書くための推奨事項にすぎません。ベストプラクティスに関して提供される情報は、ルールに対して提供される情報と同様です。以下はガイドラインからのベストプラクティスの例です。

Code Analyzer のチェックを有効にすることで、ベストプラクティスの一部は（オプションで）ルールとして検出できます。これらのチェックの多くはデフォルトでは無効になっています。オプションの検出に関する情報が利用可能な場合、ベストプラクティスの情報内の「Detection」フィールドに示されます。

**Type**: Best Practice

**Description**: セル配列は、クラスやサイズが異なるデータを格納する場合にのみ使用してください。文字ベクトルをテキストデータとして格納するためにセル配列を使用しないでください。代わりに string 配列を使用してください。

**Motivation**: 

- 可読性: 文字ベクトルのセル配列ではなく string 配列を使用することで、コードの可読性が向上します。

- パフォーマンス: string の操作は、文字ベクトルのセル配列に対する操作よりも高性能です。

**Allowed**:

```matlab
data = {datetime "abc" 123};
arrays = {rand(1,10) zeros(2,4) eye(5)};
missions = ["Mercury" "Gemini" "Apollo"];
```

**Not Allowed**:

```matlab
missions = {'Mercury' 'Gemini' 'Apollo'};
```

**Detection**: オプションで Code Analyzer チェック `DAFCVC` を有効化することで検出 (R2024a)

**History**: Version 1.0 で導入


## 定義

ガイドラインの説明ではいくつかの重要な用語が使用されています。ここではそれらの用語を定義します。

**Programming interface elements** とは、functions、classes、properties、methods、events、および enumeration members を指します。table variables と struct fields は、table または struct が関数やメソッドの入力または出力である場合、プログラミングインターフェイスの要素として扱うべきです。そうでなく、table または struct が単一の関数、メソッド、またはスクリプト内でのみ使用される場合、table variables と struct fields は通常の変数のように扱うことができます。

**lowercase** は識別子（名前）に関する大文字小文字の規約で、識別子は小文字（a-z）で始まり、その後のすべての文字は小文字または数字です。アンダースコアやその他の特殊文字は使用できません。例:

- `temperature`

- `sortrows`

- `trial27`

**lowerCamelCase** は識別子（名前）に関する大文字小文字の規約で、識別子は小文字（a-z）で始まり、その後の各単語の先頭に大文字（A-Z）を使用します。最初の文字以降は数字を使用できますが、アンダースコアやその他の特殊文字は使用できません。例:

- `totalPowerLoss`

- `inverseTransformDecompression`

- `utf8Character`

**UpperCamelCase** は識別子（名前）に関する大文字小文字の規約で、各単語の先頭に大文字（A-Z）を使用します。最初の文字以降は数字を使用できますが、アンダースコアやその他の特殊文字は使用できません。例:

- `KineticEnergy`

- `Visible`

- `Unicode16Text`

**Leadinguppercase** は識別子（名前）に関する大文字小文字の規約で、識別子は単一の大文字（A-Z）で始まり、0 個以上の小文字（a-z）または数字が続きます。アンダースコアやその他の特殊文字は使用できません。例:

- `A`

- `Binverse`

- `C1`


# 命名ガイドライン

## 一般

### 言語

**Type:** Best Practice

**Description:** 自分とは母語が異なる人が読む、または使用するコードを書く場合、MATLAB の識別子には英語のような共通言語を使用してください。

**Motivation:**

- 可読性: 世界的に、英語はプログラミングで最も一般的な言語です。

**Recommended:**

```matlab
initialValue = 4           % variable name
transmission = DriveTrain  % class name
```

**Not Recommended:**

```matlab
anfangswert = 4            % Variablenname
transmission = Transmisia  % numele clasei
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### ドキュメントとしての名前

**Type:** Best Practice

**Description:** functions、classes、methods を含むプログラミングインターフェイスの要素には、正確で記述的な名前を優先してください。意味が自明でない限り、functions や methods に短い名前を使用しないでください。

**Motivation:**

- 理解容易性: 記述的な名前は、プログラミングインターフェイスの要素（例: function）の目的を判断しやすくします。

**Recommended:**

```matlab
initializeTemperature
findCycles
rowWiseLast
```

**Not Recommended:**

```matlab
calcVal
nextTemp
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### 省略形の使用

**Type:** Best Practice

**Description:** 可能な限り、プログラミングインターフェイスの要素名で省略語の使用は避けてください。代わりに完全な単語を使用してください。省略語は、曖昧さがなく、組織やドメイン内で一般的に使用されている、または文脈から容易に判断できるものに限って使用してください。

**Motivation:**

- 可読性: 省略語は曖昧で誤解を招きやすいことがあります。名前に完全な単語を用いると、コードは読みやすく理解しやすくなります。

**Recommended:**

```matlab
nextIndex
printError
calculatePressure
```

**Not Recommended:**

```matlab
nxIdx
prntErr
calcPres
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---


### 頭字語の使用

**Type**: Best Practice

**Description**: 識別子名で頭字語を使用する場合、その頭字語内のすべての文字は同じ大文字小文字であるべきです。識別子の大文字小文字規約が単語の最初の文字を小文字とする場合、頭字語のすべての文字は小文字にします。同様に、識別子の大文字小文字規約が単語の最初の文字を大文字とする場合、頭字語のすべての文字は大文字にします。

**Motivation**:

- 可読性: 大文字小文字が混在する頭字語は読みづらく、理解しにくいです。

**Recommended**:

```matlab
htmlwrite    % for lowercase
createURL    % for lowerCamelCase
DNAMatch     % for UpperCamelCase 
```

**Not Recommended**:

```matlab
HTMLwrite    % for lowercase
createUrl    % for lowerCamelCase
DnaMatch     % for UpperCamelCase
```

**Detection**: Not detectable

**History**: Introduced in Version 1.0

---

### シャドーイングを避ける

**Type:** Best Practice

**Description:** MATLAB のパス上に既存の function や class がある名前を、variables、functions、classes の命名に使用することは避けてください。名前の衝突は「シャドーイング」を引き起こし、予期しないまたは一貫しない動作につながる可能性があります。

**Motivation:**

- 保守性: パス上の他の functions をシャドーイングすると予期しない結果を招き、コードの保守が難しくなります。

**Not Recommended:**

```matlab
rand
sin
sqrt
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

## 変数

### 変数名の長さ

**Type:** Rule

**Description:** 変数名の長さを <= 32 文字に制限します。

**Motivation:**

- 可読性: 変数名は記述的であるべきですが、過度に長い名前は行を長くして可読性を下げる可能性があります。

**Allowed:**

```matlab
totalReactivePowerLoss
actualRipplePassbandFirstBand
intervalBetweenLaserTransitions
```

**Not Allowed:**

```matlab
significancePearsonGravitationalCorrelation
percentROIAreaContainingPositivePixels
```

**Detection:** Code Analyzer check `naming.variable.maxLength` (R2025a)

**History:** Introduced in Version 1.0

---

### 変数名のスタイル

**Type:** Best Practice

**Description:** 変数には記述的な名前を推奨します。変数が使用される文脈から意味を容易に判断できる場合は、短い変数名も許容されます。そのようなケースには、以下が含まれます:

- 数学的な式

- 連続した短いコードブロック

- ループ内の一時変数やイテレータ

- 特定ドメインでユーザーに広く知られている値（数学: phi = 黄金比、物理: h = プランク定数）

変数に単数形と複数形を混在させないでください（例: point と points）。代わりに、複数形化にはサフィックスの使用を検討してください。"isNot" や "notFound" のような否定形の変数名は避けてください。 

**Motivation:**

- 理解容易性: 適切に選ばれた変数名は曖昧さがなく、その変数が含むデータについての混乱を避けられます。

**Recommended:** 

```matlab
apparentMagnitude = 1.2
initialTemperature = 100
x = A\b
e = m*c^2            % c = speed of light
color, colorGroup    % pluralization
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---
### 変数名の大文字小文字

**Type:** Rule

**Description:** 複数語からなる記述的な変数名には lowerCamelCase を使用してください。一般的な数学記号のような短い変数名には Leadinguppercase を使用できます。

**Motivation:** 

- 可読性: 共通の大文字小文字規約を用いることで、変数を他の種類の識別子（例: classes）と区別しやすくなります。

**Allowed:** 

```matlab
temperature
gibbsFreeEnergy
x = A\b            % A is a matrix
Binverse
```

**Not Allowed:** 

```matlab
KineticEnergy
BTransform
Greenwich_Mean_Time
```

**Detection:** Code Analyzer check `naming.variable.regularExpression` (R2025a)

**History:** Introduced in Version 1.0

---

## 関数

### 関数およびその他のプログラミングインターフェイス要素の名前の長さ

**Type:** Rule

**Description:** functions、classes、methods、properties、およびプログラミングインターフェイスのその他の要素の名前の長さを <= 32 文字に制限します。

**Motivation:**

- 理解容易性: 識別子の長さを制限することで、他者がコードをレビューし理解しやすくなります。

**Allowed:**

```matlab
reactivePowerLoss
inverseTransformDecompression
optimizeBresenhamConversion
```

**Not Allowed:**

```matlab
validateBlockPathForModelBlockNormalModeVisibility
plotExactRectangularMembraneConstantLineLoad
```

**Detection:** Code Analyzer checks (R2025a)

- `naming.class.maxLength`

- `naming.function.maxLength`

- `naming.localFunction.maxLength`

- `naming.method.maxLength`

- `naming.nestedFunction.maxLength`

- `naming.property.maxLength`

- `naming.event.maxLength`

- `naming.enumeration.maxLength`

**History:** Introduced in Version 1.0

---

### 関数名のスタイル

**Type:** Best Practice

**Description:** 実行されるアクションを伝えるために、functions や methods には動詞または動詞句を用いて命名してください。あるいは、作成される対象を表す場合には名詞または名詞句で命名してください。変換関数の名前には数値の「2」を使用してください。主出力が logical 値である関数には、接頭辞 "is" または "has" を使用してください。相補的な操作を行う関数には、対応する名前（例: start/stop、create/destroy など）を使用してください。

**Motivation:**

- 可読性: 適切に選ばれた関数名は曖昧さがなく、関数が何をするのかについての混乱を避けられます。

**Recommended:**

```matlab
calculatePower            % Verb phrase: action performed         
sankeyPlot                % Noun phrase: thing created
joule2Calorie             % Conversion function
isConfigured, hasValue    % Boolean output
readData, writeData       % Symmetric functions
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### 関数名の大文字小文字

**Type:** Rule

**Description:** 関数名には lowerCamelCase または lowercase を使用してください。複数語を組み合わせた関数名には、lowerCamelCase を推奨します。

**Motivation:**

- 可読性: 共通の大文字小文字規約を用いることで、functions を他の種類の識別子（例: class methods）と区別しやすくなります。

**Allowed:**

```matlab
initializePressure
inverseTransform
optimizeLayout
solarRadiation
```

**Not Allowed:**

```matlab
QueryDB
PRINTALL
detect_features
```

**Detection:** Code Analyzer checks (R2025a)

- `naming.function.casing`

- `naming.localFunction.casing`

- `naming.nestedFunction.casing`

**History:** Introduced in Version 1.0

---

### Name-Value 引数の大文字小文字

**Type:** Best Practice

**Description:** Name-Value 引数の name には UpperCamelCase を使用してください。

**Motivation:**

- 可読性: 共通の大文字小文字規約を用いることで、関数定義や関数呼び出しにおいて name-value 引数を識別しやすくなります。

**Recommended:** 

```matlab
plot(x, y, LineWidth=2)
surf(peaks, FaceColor="interp")
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

## クラス

### クラス名のスタイル

**Type:** Best Practice

**Description:** クラスが何かを表す場合、名前には名詞または名詞句を使用してください（例: PrintServer）。クラスが、他のクラスが継承によって取得できる一連の振る舞いや機能（mixin クラスなど）を実装する場合は、形容詞を使用してください（例: Copyable）。クラス名に「class」を含めないでください。クラスの特殊な属性（例: Abstract）を名前に含めないでください。

**Motivation:**

- 理解容易性: 適切に選ばれたクラス名は曖昧さがなく、そのクラスが何を表すかを読者に伝えます。

**Recommended:**

```matlab
PrintQueue
imageAdapter
pickable
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### クラス名の大文字小文字

**Type:** Rule

**Description:** namespace 内で定義されるクラスの名前には UpperCamelCase を使用してください。クラスが MATLAB のグローバル名前空間で定義される場合は、上記の「Function name casing」ルールを使用してください。

**Motivation:**

- 可読性: 共通の大文字小文字規約を用いることで、classes を他の識別子タイプと区別しやすくなります。グローバル名前空間で関数名の大文字小文字規約を使用することで、ユーザーはクラスコンストラクタを通常の関数のように呼び出せます。

**Allowed:**

```matlab
transmitter.OptionsBase    % in a namespace
shapes.Polynomial          % in a namespace
ecgSignal                  % in the global namespace
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

### メソッド名のスタイル

**Type:** Best Practice

**Description:** メソッド名は、関数名と同じベストプラクティスに従い、動詞句または名詞句にしてください。

**Motivation:** 

- 理解容易性: 適切に選ばれたメソッド名は曖昧さがなく、そのメソッドが何をするのかについての混乱を避けられます。

**Recommended:**

```matlab
modulateSignal
setRollOff
receiveCode
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### メソッド名の大文字小文字

**Type:** Rule

**Description:** メソッド名には lowerCamelCase または lowercase を使用してください。複数語を組み合わせたメソッド名には、lowerCamelCase を推奨します。

**Motivation:**

- 可読性: 共通の大文字小文字規約を用いることで、methods と functions を識別しやすくなります。

**Allowed:**

```matlab
gpsCoordinates
startRecording
registerDevice
```

**Detection:** Code Analyzer check `naming.method.casing` (R2025a)

**History:** Introduced in Version 1.0

---

### プロパティ名のスタイル

**Type:** Best Practice

**Description:** ほとんどのプロパティ名には名詞または名詞句を用いてください。オブジェクトが何かを行うか、行えるか、または何かを持つかどうかを示す logical 値であるプロパティの場合は、動詞句を使用してください（例: `HasOutputPort`）。

**Motivation:**

- 理解容易性: 適切に選ばれたプロパティ名は曖昧さがなく、そのクラスのユーザーにプロパティがどのような情報を含むかを伝えます。

**Recommended:**

```matlab
TextBuffer
CodeTable
HasEncoder
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### プロパティ名の大文字小文字

**Type:** Rule

**Description:** プロパティ名には UpperCamelCase を使用してください。

**Motivation:**

- 可読性: 共通の大文字小文字規約を用いることで、クラスのプロパティを識別しやすくし、他の識別子タイプと区別しやすくなります。

**Allowed:**

```matlab
StartTime
RelativeTolerance
Visible
```

**Detection:** Code Analyzer check `naming.property.casing` (R2025a)

**History:** Introduced in Version 1.0

---

### イベント名の大文字小文字

**Type:** Rule

**Description:** イベント名には UpperCamelCase を使用してください。

**Motivation:**

- 可読性: 共通の大文字小文字規約を用いることで、クラスの events を識別しやすくなります。

**Allowed:**

```matlab
RowSelected
DeviceAdded
```

**Detection:** Code Analyzer check `naming.event.casing` (R2025a)

**History:** Introduced in Version 1.0

---

## 名前空間

### 名前空間名の大文字小文字

**Type:** Best Practice

**Description:** 名前空間には短い lowercase の名前を使用してください。

**Motivation:**

- 可読性: 特に内側の名前空間がある場合、長い名前空間名は読みにくくなります。

**Recommended:**

```matlab
multivariate
clustering
astrometry.catalogue
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### 名前空間の内容の名前

**Type:** Best Practice

**Description:** 関数、クラス、列挙、または内側の名前空間の名前に、名前空間名を使用しないでください。

**Motivation:**

- 可読性: 名前空間名をその内容に追加しても付加情報は得られず、名前空間の内容が読みにくくなるだけです。

**Recommended:**

```matlab
learning.findClusters
```

**Not Recommended:**

```matlab
learning.learningFindClusters
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

# ステートメントと式のガイドライン

## 一般

### 1 行あたりのステートメント数

**Type:** Rule

**Description:** 1 行に複数のステートメントを記述しないでください。

**Motivation:**

- 理解容易性: 1 行に複数のステートメントがあると、コードの理解とレビューが難しくなります。

- 保守性: 同じ行に複数のステートメントがあるコードはデバッグが難しくなります。

**Not Allowed:**

```matlab
fs = 1000; t = 0:1/fs:1; f = 9;
for k = 1:N; dStp(k) = (1/2)*Stp(k-2) + (-2/3)*Stp(k-1); end
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

### リテラル値の使用

**Type:** Best Practice

**Description:** 特に同じ値が複数箇所に現れる場合、式の中でリテラル値を使用するのは避けてください。同様に、関数呼び出しでもリテラル値の使用は避けてください。どちらの場合も代わりに変数を使用してください。

**Motivation:**

- 保守性: 同じリテラル値をコードの複数箇所で使用すると、特にその値を変更する必要がある場合に、コードの保守が難しくなります。

- 正しさ: 複数箇所でリテラル値の変更漏れがあると、予期しないエラーにつながる可能性があります。

**Recommended:**

```matlab
gasConstant = 8.314;
molarVolume = gasConstant*temperature/pressure;

employeeID = "ABF4578";
record = queryEmployees(employeeID);
```

**Not Recommended:**

```matlab
molarVolume = 8.314*temperature/pressure;

record = queryEmployees("ABF4578");
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### 数値リテラルの書き方

**Type:** Best Practice

**Description:** 浮動小数点のリテラルは、小数点の前に数字（例: "0"）を付けて書いてください。

**Motivation:**

- 可読性: 小数点の前に 0 を付けることで、「0.1」と「1」を見分けやすくなります。

**Recommended:**

```matlab
x = 0.1;
x = 1.0e-1;
```

**Not Recommended:**

```matlab
x = .1;
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

## 変数

### グローバル変数

**Type:** Best Practice

**Description:** グローバル変数の使用は避けてください。代わりに、変数は関数への引数として渡してください。

**Motivation:**

- 保守性: グローバル変数は、診断が難しい潜在的なエラーを引き起こす可能性があります。

- テスト容易性: 複数の関数でグローバル変数が変更される場合、それらの関数を異なる順序で呼び出すと異なる結果になる可能性があります。

**Recommended:**

```matlab
gravity = 32;
distance = falling((0:0.1:5)', gravity);

function dist = falling(t, gravity)
h = 0.5*gravity*t.^2;
end
```

**Not Recommended:**

```matlab
global gravity
gravity = 32;
distance = falling((0:0.1:5)');

function dist = falling(t)
global gravity
h = 0.5*gravity*t.^2;
end
```

**Detection:** ガイドラインとしては検出されません。Code Analyzer のチェック `GVMIS` により警告として検出されます (R2021b)

**History:** Introduced in Version 1.0

---

### 永続変数

**Type:** Best Practice

**Description:** 永続変数の使用は最小限にしてください。関数呼び出し間でデータをキャッシュするために永続変数を使用することは、各関数呼び出しで大量のデータを再読み込みまたは再計算することを避けるために使用できます。

**Motivation:**

- 理解容易性: 永続変数を多用すると、プログラムロジックの理解が難しくなります。

**Recommended:**

```matlab
function timeZone = getTimeZone(latitude, longitude)
% GETTIMEZONE Determine the time zone for a given
% latitude and longitude
%
% This function loads a mat file containing shapes
% for 439 worldwide time zones. The shapes are used
% to find the time zone that corresponds to a
% specified latitude and longitude. The shapes are
% persistent to avoid loading them on every call.
arguments
    latitude  (1, 1) double {mustBeInRange(latitude, -90, 90)}
    longitude (1, 1) double {mustBeInRange(longitude, -180, 180)}
end  

persistent timeZones
if isempty(timeZones)
    load("timeZones.mat", "timeZones")
end

% Rest of calculations here

end
```

**Detection:** オプションで Code Analyzer チェック `DAFPV` を有効化することで検出 (R2023a)

**History:** Introduced in Version 1.0

---

## MATLAB の型

### struct の定義

**Type:** Best Practice

**Description:** struct のすべてのフィールドは、1 つのコードブロック内で定義してください。作成された関数の外で、既存の struct にフィールドを追加または削除しないでください。

**Motivation:**

- 保守性: 複数の関数やメソッド間でフィールドが変化する struct は、混乱を招き、エラーが起きやすく、保守が困難です。

**Recommended:**

```matlab
starData = struct(CatalogueNumber=[], IAUName="", ...
    Magnitude=[], RightAscension=[], Declination=[]);

Experiment.Frequency = 1000;
Experiment.Range = [200 400];
Experiment.Harmonic = true;
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### cell 配列の使用

**Type:** Best Practice

**Description:** cell 配列は、クラスやサイズが異なるデータを格納する場合にのみ使用してください。文字ベクトルをテキストデータとして格納するために cell 配列を使用しないでください。代わりに `string` 配列を使用してください。

**Motivation:**

- 可読性: 文字ベクトルの cell 配列ではなく string 配列を使用することで、コードの可読性が向上します。

- パフォーマンス: string の操作は、文字ベクトルの cell 配列に対する操作よりも高性能です。

**Recommended:**

```matlab
data = {datetime "abc" 123};
arrays = {rand(1,10) zeros(2,4) eye(5)};
missions = ["Mercury" "Gemini" "Apollo"];
```

**Not Recommended:**

```matlab
missions = {'Mercury' 'Gemini' 'Apollo'};
```

**Detection:** オプションで Code Analyzer チェック `DAFCVC` を有効化することで検出 (R2024a)

**History:** Introduced in Version 1.0

---

## 式

### コマンド形式の使用

**Type:** Best Practice

**Description:** functions や methods ではコマンド構文を使用しないでください。コマンド構文の使用は、コマンドラインまたはスクリプト内に限定してください。

**Motivation:**

- 可読性: コマンド形式と関数形式が混在すると、コードが読みにくく理解しにくくなります。

**Recommended:**

```matlab
save("catalogue.mat", "starData")   % functional form
hold("on")                          % functional form
```

**Not Recommended:**

```matlab
load catalogue.mat                  % command form
clear all                           % command form
```

**Detection:** オプションで Code Analyzer チェック `DAFCF` を有効化することで検出 (R2023a)

**History:** Introduced in Version 1.0

---

### 数学・論理式における括弧

**Type:** Best Practice

**Description:** 可読性を高めるために、数学式や論理式では括弧を使用してください。

**Motivation:**

- 理解容易性: 適切に括弧を用いることで、数学式や論理式が読みやすく理解しやすくなります。

**Recommended:**

```matlab
w = (c*d)/(e^f);
y = -(2^2);
m = ((A > 2) && (B < 10)) || (C == 2);
```

**Not Recommended:**

```matlab
w = c*d/e^f;
y = -2^2;                    % Is this 4 or -4?
m = A > 2 && B < 10 || C == 2;
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### 浮動小数点の比較

**Type:** Best Practice

**Description:** 2 つの浮動小数点値の比較に `==` や `~=` を使用しないでください。

**Motivation:**

- 正しさ: 浮動小数点値の比較に `==` や `~=` を用いると、論理エラーにつながる可能性があります。

**Recommended:**

```matlab
areEqual = abs(a-b) < 1.0e-4;
areEqual = isapprox(a, b);     % introduced in R2024b
```

**Not Recommended:**

```matlab
areEqual = (a == b);
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### ファイル名の作成と解析

**Type:** Best Practice

**Description:** プラットフォームに依存しない方法でファイル名を作成・解析するには、`fileparts`、`fullfile`、`filesep` 関数を使用してください。

**Motivation:**

- 移植性: これらの関数を用いることで、MATLAB がサポートするあらゆるプラットフォーム（OS）でファイル名とフォルダー名を一貫して扱えます。

**Recommended:**

```matlab
fileName = fullfile("myfolder", "mysubfolder", "myfile.m");
```

**Not Recommended:**

```matlab
fileName = "myfolder" + "\" + "mysubfolder" + "\" + "myfile.m";
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

## ループと条件分岐

### 制御文のネスト

**Type:** Rule

**Description:** ループや条件分岐のネストは 5 レベルまでに制限してください。

**Motivation:**

- 可読性: 深いネストはコードの視覚的な複雑さを増します。

- 保守性: 深くネストしたコードは、特定しにくく修正しにくい微妙なエラーにつながる可能性があります。

**Allowed:**

```matlab
% Find the indices of all primes in matrix A
% Requires 3 levels of nesting and works for matrices of any dimension
index = false(size(A));
for m = 1:numel(A)
    if (A(m) == 1)
        continue
    end
    if (A(m) == 2) || (A(m) == 3)
        index(m) = true;
        continue
    end
    if (mod(A(m), 2) == 0) || (mod(A(m), 3) == 0)
        continue
    end
    index(m) = true;
    maxFactors = floor((sqrt(A(m))+1)/6);
    for p = 1:maxFactors
        if (mod(A(m), 6*p-1) == 0 || mod(A(m), 6*p+1) == 0)
            index(m) = 0;
        end
    end
end
```

**Not Allowed:**

```matlab
% Find the indices of all primes in matrix A
% Requires 6 levels of nesting
index = false(size(A));
for m = 1:size(A,1)
    for n = 1:size(A,2)
        if A(m, n) > 1
            if (A(m, n) == 2) || (A(m, n) == 3)
                index(m, n) = true;
            elseif (mod(A(m, n), 2) ~= 0) && (mod(A(m, n), 3) ~= 0)
                index(m, n) = true;
                maxFactors = floor((sqrt(A(m, n))+1)/6);
                for p = 1:maxFactors
                    if (mod(A(m, n), 6*p-1) == 0 || ...
                        mod(A(m, n), 6*p+1) == 0)
                        index(m, n) = false;
                    end
                end
            end
        end
    end
end
```

**Detection:** Code Analyzer check `MNCSN` (R2023a)

**History:** Introduced in Version 1.0

---

### ループ内での配列の拡張

**Type:** Best Practice

**Description:** ループ内で配列サイズを段階的に変更するのは避けてください。可能な限り、ループの直前に配列を事前割り当てしてください。

**Motivation:**

- 理解容易性: 配列を事前割り当てすることで必要なメモリ量が明示され、コードの挙動を予測しやすくなります。

- パフォーマンス: 配列の事前割り当てによりパフォーマンスが向上します。

**Recommended:**

```matlab
x = zeros(1,1000);                 % double array
for k = 2:1000
   x(k) = x(k-1) + 5;
end

objs = createArray(1,5,"myClass"); % array of objects
for k = 1:5
    objs(k).seed = rand;
end
```

**Detection:** ガイドラインとしては検出されません。Code Analyzer のチェック `AGROW` により警告として検出されます (R2006b)

**History:** Introduced in Version 1.0

---

### 反復子の変更

**Type:** Rule

**Description:** for ループ内でループの反復子を変更しないでください。

**Motivation:**

- 保守性: ループのロジックがより予測可能になり、エラーが起きにくく、変更もしやすくなります。

**Not Allowed:** 

```matlab
data = [3 -1 4 -2 5 -3 6];
n = length(data);

% Try to remove negative values from the array
for ii = 1:n
    if data(ii) < 0
        data(ii) = [];  % Remove the negative number
        ii = ii - 1;    % Compensate for removed element
    end
end
```

**Detection:** Code Analyzer check `FXSET` (R2007b)

**History:** Introduced in Version 1.0

---

### break・continue・return の使用

**Type:** Best Practice

**Description:** `for` や `while` ループ内での `break`、`continue`、`return` の使用は最小限にしてください。`break` と `continue` は、ループをより簡潔または読みやすくする場合にのみ使用してください。

**Motivation:**

- 理解容易性: 不要な `break`、`continue`、`return` の使用は、フローの変化を招き、ループの意図を理解しにくくします。

**Recommended:**

```matlab
data = [4 -1 6 -3 2 8 -5];
total = 0;
for ii = 1:length(data)          % Sum positive values
    if data(ii) > 0
        total = total + data(ii);
    end
end
```

**Not Recommended:**

```matlab
data = [4 -1 6 -3 2 8 -5];
total = 0;
for ii = 1:length(data)          % Sum positive values
    if data(ii) < 0
        continue               
    end
    total = total + data(ii);
end
```

**Detection:** オプションで Code Analyzer チェック `DAFCO`（continue）、`DAFBR`（break）、`DAFRT`（return）を有効化することで検出

**History:** Introduced in Version 1.0

---

### 例外ケースとしての else

**Type:** Best Practice

**Description:** `if-else` を使用する場合、通常のケースを `if` 部分に、例外的なケースを `else` 部分に置いてください。

**Motivation:**

- 理解容易性: 通常の実行経路を特別なケースが覆い隠すのを防ぎ、コードロジックが追いやすくなります。

**Recommended:**

```matlab
if size(A, 1) == size(b, 1)
    x = A\b;
else
    error("Size mismatch between A and b");
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### switch 文における otherwise

**Type:** Best Practice

**Description:** `switch` 文には常に `otherwise` ブロックを含めてください。`otherwise` ブロックが空の場合は、他のケースが起こりえない理由をコメントで説明してください。

**Motivation:**

保守性: `otherwise` 句により、想定外のケースを捕捉して適切に処理できます。

**Recommended:**

```matlab
switch state
    case "On"
        startDevice()
    case "Off"
        stopDevice()
    otherwise
        error("Unknown state " + state)
end
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

## 関数呼び出し

### 引数のない関数

**Type:** Best Practice

**Description:** 引数のない関数やクラスメソッドを呼び出すときは、空の丸括弧を使用してください。これにより、変数ではなく関数が使用されていることが明確になります。合理的な例外として、`pi`、`true`、`false` のような一部の一般的な関数や、`gcf`、`gca` のようなグラフィックス関連の関数が含まれます。

**Motivation:**

- 可読性: 引数なし関数に括弧を付けることで、通常の変数と関数を区別しやすくなります。

**Recommended:**

```matlab
randomParameters = rng();
currentTime = datetime();
x = 2*pi;
```

**Not Recommended:**

```matlab
currentFolder = pwd;
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### 未使用の出力を無視する

**Type:** Best Practice

**Description:** 関数からの未使用の先頭出力を無視するには、チルダ文字（`~`）を使用してください。

**Motivation:**

- 理解容易性: チルダ文字の使用は、特定の出力が以後使用されないことを読者に明確に示します。

**Recommended:**

```matlab
[~, ~, V] = svd(A);
```

**Detection:** ガイドラインとしては検出されません。Code Analyzer のチェック `ASGLU` により警告として検出されます (R2010b)

**History:** Introduced in Version 1.0

---

### Name-Value 引数の使用

**Type:** Best Practice

**Description:** 関数に Name-Value 引数を渡すときは、`Name=Value` 構文（R2021a）を使用してください。

**Motivation:**

- 可読性: `Name=Value` 構文により、多数のオプション値の一覧でも、名前と値の対応を把握しやすくなります。

**Recommended:**

```matlab
plot(x, y, Color="g", LineWidth=3, Marker="*")
```

**Not Recommended:**

```matlab
plot(x, y, "Color", "g", "LineWidth", 3, "Marker", "*")
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

## 避けるべき関数

### eval 関数

**Type:** Best Practice

**Description:** `eval` 関数の使用は避けてください。`eval` は、特に信頼できないユーザー入力と併用した場合に、予期しないコード実行につながる可能性があります。

**Motivation:**

- 保守性: `eval` の使用は意図しない動作を招く可能性があります。

- 再利用性: ある文脈では `eval` の呼び出しが安全でも、別の文脈ではセキュリティやその他の問題を引き起こす可能性があります。

**Recommended:**

```matlab
numArrays = 10;
A = cell(numArrays,1);
for ii = 1:numArrays
    A{ii} = magic(ii);
end
```

**Not Recommended:**

```matlab
numArrays = 10;
for ii = 1:numArrays
    eval("A" + int2str(ii) + " = magic(ii)");
end
```

**Detection:** [既存関数に対するカスタム Code Analyzer チェック](https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html#mw_38519ef1-c176-4933-b2e6-bd17e641681d)を使用してオプションで検出

**History:** Introduced in Version 1.0

---

### ワークスペース関数

**Type:** Best Practice

**Description:** 現在のコンテキスト外のワークスペースを操作する関数の使用は避けてください。`evalin` および `assignin` 関数を関数出力の代替として使用しないでください。ベースワークスペースの変数をグローバル変数のように扱わないでください。

**Motivation:**

- 保守性: 別のコンテキストの変数を変更すると、微妙で予期しないエラーにつながる可能性があります。

**Recommended:**

```matlab
% Update configuration safely
config = updateConfig(config, "simulationSpeed", 2.5);

function config = updateConfig(config, param, value)
if isfield(config, param)
    config.(param) = value;  % Modify known parameters
else
    error("Invalid config parameter: %s", param);
end
end
```

**Not Recommended:**

```matlab
% Update configuration unsafely
updateConfig(config, "simulationSpeed", 2.5);

function updateConfig(config, param, value)
command = config + "." + param + " = "  + num2str(value);
evalin("base", command);
end
```

**Detection:** [既存関数に対するカスタム Code Analyzer チェック](https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html#mw_38519ef1-c176-4933-b2e6-bd17e641681d)を使用してオプションで検出

**History:** Introduced in Version 1.0

---

### パス関連の関数

**Type:** Best Practice

**Description:** 関数やメソッド内で現在のフォルダーや MATLAB の検索パスを変更するために `cd`、`addpath`、`rmpath` を使用するのは最小限にしてください。これらの関数を使用する必要がある場合は、関数を終了する前に現在のフォルダーとパスを元に戻してください。

**Motivation:**

- 再利用性: 現在のフォルダーやパスを操作する関数は、他の文脈で正しく動作しない可能性があります。

- 保守性: 現在のフォルダーやパスの変更は、挙動に微妙な変化をもたらす可能性があります。

**Recommended:**

```matlab
function output = myFunction(input)
oldPath = path;
c = onCleanup(@()path(oldPath));

newFolder = "C:\MATLAB\mydir";
addpath(genpath(newFolder));

% Perform some calculations
end
```

**Detection:** [既存関数に対するカスタム Code Analyzer チェック](https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html#mw_38519ef1-c176-4933-b2e6-bd17e641681d)を使用してオプションで検出

**History:** Introduced in Version 1.0

---

# フォーマットに関するガイドライン

## スペースの使用

### スペース vs. タブ

**Type:** Rule

**Description:** ホワイトスペースを追加するには、タブではなくスペースを使用してください。

**Motivation:**

- 可読性: タブ文字は、エディターやプラットフォームによって解釈が異なる場合があります。

**Allowed:**

```matlab
for ii = 1:m
□□□□for jj = 1:n
□□□□□□□□A(ii, jj) = ii + jj;
□□□□end
end
```

**Not Allowed:**

```matlab
for ii = 1:m
<tab>for jj = 1:n
<tab><tab>A(ii, jj) = ii + jj;
<tab>end
end
```

**Detection:** 現時点では未検出。デフォルトのエディター設定で適用。

**History:** Introduced in Version 1.0

---

### インデント

**Type:** Rule

**Description:** インデントレベルごとに 4 つのスペースを使用してください。

**Motivation:**

- 可読性: 一貫したインデント幅はコードを読みやすくします。

**Allowed:**

```matlab
for ii = 1:m
□□□□for jj = 1:n
□□□□□□□□A(ii, jj) = ii + jj;
□□□□end
end
```

**Detection:** 現時点では未検出。デフォルトのエディター設定で適用。

**History:** Introduced in Version 1.0

---

### グルーピング演算子内のスペース

**Type:** Rule

**Description:** 開き丸括弧、角括弧、波括弧の直後にスペースを入れないでください。閉じ丸括弧、角括弧、波括弧の直前にスペースを入れないでください。

**Motivation:**

- 可読性: ほとんどのケースで、余分なスペースは可読性を高めません。行が長くなるだけです。

**Allowed:**

```matlab
a = sin(exp(1));
A = [1 0; 0 1];
B = {12 "def"};
```

**Not Allowed:**

```matlab
a = sin(exp( 1) );
A = eig([ 2 3; 4 5 ]);
B = A( (A > 2) & (A < 5) );
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

### カンマ・セミコロン後のスペース

**Type:** Rule

**Description:** 行末を除き、カンマやセミコロンの後にはスペースを入れてください。

**Motivation:**

- 可読性: カンマやセミコロンの後にスペースを入れると、コード行が読みやすくなります。

**Allowed:**

```matlab
A = [6 4 23 -3; 9 -10 4 11; 2 8 -5 1];
S = std(A, 2, "omitmissing");
```

**Not Allowed:**

```matlab
B = [1 2 3;4 5 6];
T = rand(5,4,3,"single");
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

### 行末のスペース

**Type:** Rule

**Description:** 行末に余分なホワイトスペースを入れないでください。

**Motivation:**

- 保守性: 余分なホワイトスペースは差分やマージの競合を引き起こす可能性があります。

**Not Allowed:**

```matlab
first = 1;□□
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

### 代入演算子の前後のスペース

**Type:** Rule

**Description:** 代入文における代入演算子（`=`）の両側には 1 つのスペースを入れてください。関数のオプション引数を指定する `Name=Value` 構文を使用する場合は、`=` の前後にスペースを入れないでください。

**Motivation:**

- 可読性: 代入演算子の周りにスペースを入れると、特に左オペランドが長い変数名であったり右オペランドが複雑な式であったりする場合に、文が読みやすくなります。`Name=Value` 構文で `=` の周りにスペースを入れないことで、名前付き引数のペアのまとまりを識別しやすくなります。

**Allowed:**

```matlab
initialValue = 3.2;
plot(x, y, LineWidth=3);
```

**Not Allowed:**

```matlab
apparentMagnitude=1.2;
plot(x, y, LineWidth = 3);
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

### 関係演算子の前後のスペース

**Type:** Rule

**Description:** 関係演算子（`<`、`<=`、`==`、`~=`、`>`、`>=`）の両側に 1 つのスペースを入れてください。

**Motivation:**

- 可読性: 関係演算子の周りにスペースを入れることで、特にオペランドが長く複雑な式である場合に、文が読みやすくなります。

**Allowed:**

```matlab
if (x <= 3) || (x >= 5)
```

**Not Allowed:**

```matlab
A(A>2)
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

### 論理演算子の前後のスペース

**Type:** Rule

**Description:** 論理演算子（`&`、`&&`、`|`、`||`）の両側に 1 つのスペースを入れてください。

**Motivation:**

- 可読性: 論理演算子の周りにスペースを入れることで、特にオペランドが長く複雑な式である場合に、文が読みやすくなります。

**Allowed:**

```matlab
A(A & ~mod(A, 2))
```

**Not Allowed:**

```matlab
C = A|B
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

### コロン演算子の前後のスペース

**Type:** Rule

**Description:** コロン演算子の前後や、その両側のオペランド内にスペースを入れないでください。

**Motivation:**

- 可読性: インデックス式はスペースがないほうが読みやすくなります。

**Allowed:**

```matlab
evenNumbers = 2:2:10;
B = A(2:end-1);
for ii = first+1:last-1
```

**Not Allowed:**

```matlab
evenNumbers = 2 : 2 : 10;
B = A(2 : end – 1);
for ii = first + 1:last – 1
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

### 乗算・除算・べき乗演算子の前後のスペース

**Type:** Rule

**Description:** 乗算、除算、べき乗の各演算子（`*` `.*` `/` `./` `\` `.\` `^` `.^`）の前後にスペースを入れないでください。

**Motivation:**

- 可読性: これらの演算子は、数式ではスペースなしで書かれるのが一般的です。

**Allowed:**

```matlab
sin(c)/exp(d)
A.^2
```

**Not Allowed:**

```matlab
(a+b) * (c / d)
3 ^ 2
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

### 加算・減算演算子の前後のスペース

**Type:** Rule

**Description:** 代入文の右辺に式が現れる場合、その式の主要な項に作用する加算・減算演算子の周りにはスペースを入れてください。その他の場所、例えばグループ化された項の内部、関数の引数、インデックスのオペランドとして使用する場合などでは、プラスやマイナスの周りにスペースを入れないでください。

**Motivation:**

- 可読性: 加算・減算演算子の周りに適切にスペースを入れることで、数式の可読性が向上します。

**Allowed:**

```matlab
x = 1 + sin(pi) – cos(pi);
z = (a+b) + exp(c+d);
r = xhex + mod(k-1, 2)*D + D*2*j – (radius+3)/2;
```

**Not Allowed:**

```matlab
v = exp(a + b);
w = y > x + 1;
du(np) = -upap(n, a(np), w)+meru(a(np), c0)+plterm;
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

### 単項演算子の後のスペース

**Type:** Rule

**Description:** 単項演算子 `+`、`-`、`~` の後にスペースを入れないでください。

**Motivation:**

- 可読性: 単項演算子の後に余分なスペースがあると、コードが読みづらくなります。

**Allowed:**

```matlab
x = -1;
```

**Not Allowed:**

```matlab
A = [- 1 1];
y = ~ x;
```

**Detection:** 現時点では未検出

**History:** Introduced in Version 1.0

---

## 空行の使用

### 関連するコードブロックの前後

**Type:** Best Practice

**Description:** 異なるタスクを実行する、または論理的に関係するコードのセクションを区切るために、1 行の空行を使用してください。

**Motivation:**

- 可読性: 論理的なセクションを空行で区切ることで、ロジックやプログラムのフローが理解しやすくなります。

**Recommended:**

```matlab
idx = solarElevation <= 0;
solarElevation(idx) = [];
solarAzimuth(idx) = [];

airMass = calculateAirMass(solarElevation);
solarRadiation = 1.353.*0.7.^(airMass.^0.678);

t1 = cosd(solarElevation).*sind(panelTilt).* ...
     cosd(180-solarAzimuth);
t2 = sind(solarElevation).*cosd(panelTilt);
panelRadiation = solarRadiation.*max(0, t1+t2);
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### ローカル関数の前後

**Type:** Rule

**Description:** ローカル関数の宣言同士は 1 行の空行で区切ってください。

**Motivation:**

- 可読性: 空行により、関数の開始と終了が明確になります。

**Allowed:**

```matlab
function Tc = centigrade2Fahrenheit(Tf)
Tc = 9*Tf/5 + 32;
end

function Tk = centigrade2Kelvin(Tc)
Tk = Tc + 273.15;
end
```

**Not Allowed:**

```matlab
function Tc = centigrade2Fahrenheit(Tf)
Tc = 9*Tf/5 + 32;
end
function Tk = centigrade2Kelvin(Tc)
Tk = Tc + 273.15;
end
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

### メソッドの前後

**Type:** Rule

**Description:** `classdef` ファイルでは、`method` 宣言同士を 1 行の空行で区切ってください。

**Motivation:**

- 可読性: 空行により、あるメソッドの終了と次のメソッドの開始が明確になります。

**Allowed:**

```matlab
methods
    function signal = Signal(data, freq)
        signal.Frequency = freq;
        signal.Data = data;
    end

    function signal = removeTrend(signal, order)
        for ii = 1:numel(signal)
            signal(ii).Data = detrend(signal(ii).Data, order);
        end
    end
end
```

**Not Allowed:**

```matlab
methods
    function signal = Signal(data, freq)
        signal.Frequency = freq;
        signal.Data = data;
    end
    function signal = removeTrend(signal, order)
        for ii = 1:numel(signal)
            signal(ii).Data = detrend(signal(ii).Data, order);
        end
    end
end
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

### method ブロックの前後

**Type:** Rule

**Description:** `classdef` ファイルでは、`method` ブロック同士を 1 行の空行で区切ってください。

**Motivation:**

- 可読性: 空行により、特定の属性を持つ `method` ブロックの開始と終了が明確になります。

**Allowed:**

```matlab
methods
    function signal = Signal(data, freq)
        signal.Frequency = freq;
        signal.Data = data;
    end
end

methods (Access = Protected)
    function signal = removeTrend(signal, order)
        for ii = 1:numel(signal)
            signal(ii).Data = detrend(signal(ii).Data, order);
        end
    end
end
```

**Not Allowed:**

```matlab
methods
    function signal = Signal(data, freq)
        signal.Frequency = freq;
        signal.Data = data;
    end
end
methods (Access = Protected)
    function signal = removeTrend(signal, order)
        for ii = 1:numel(signal)
            signal(ii).Data = detrend(signal(ii).Data, order);
        end
    end
end
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

### property ブロックの前後

**Type:** Rule

**Description:** `classdef` ファイルでは、`property` ブロック同士を 1 行の空行で区切ってください。

**Motivation:**

- 可読性: 空行により、特定の属性を持つ `property` ブロックの開始と終了が明確になります。

**Allowed:**

```matlab
properties
    Frequency
    Data
end

properties (Dependent)
    Time
end
```

**Not Allowed:**

```matlab
properties (Access = public)
    MinimumRadius = 1
    MaximumIterations = 1
end
properties (Access = private)
    SigmaXY
end
properties (Dependent)
    RegionOfInterest
end
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

### ファイルの先頭または末尾

**Type:** Rule

**Description:** スクリプト、関数、または classdef ファイルの先頭や末尾に余分な空行を入れないでください。

**Motivation:** 

- 保守性: 余分な空行は差分やマージの競合を引き起こす可能性があります。

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

## コードファイル内の行

### 行の長さ

**Type:** Rule

**Description:** コードおよびコメントの行は 120 文字以下にしてください。

**Motivation:**

- 可読性: 短いコード行は読みやすく、横スクロールを最小限に抑えます。

**Allowed:**

```matlab
solarAzimuth = acos((sin(solarDeclination)*cos(latitude) - ...
   cos(solarDeclination)*sin(latitude)*cos(angle))/cos(elevation));

term1 = sin(solarDeclination)*cos(latitude);
term2 = cos(solarDeclination)*sin(latitude)*cos(angle)
solarAzimuth = acos((term1 - term2)/cos(elevation));

% For each slice we will calculate a sequence of numbers by repeated
% application of the operator. We will stop looking when the
% last element of the current slice is below the lower limit.
```

**Detection:** Code Analyzer check `LLMNC` (R2023a)

**History:** Introduced in Version 1.0

---

### 行の分割

**Type:** Best Practice

**Description:** 可読性を最大化するために、長い行は分割してください。行を分割する際は、カンマの後、スペースの後、または二項演算子の位置での分割を検討してください。

**Motivation:**

- 可読性: 一貫した方針で長い行を分割することで、読みやすくなり、ロジックも理解しやすくなります。

**Recommended:**

```matlab
planetTemperature = estimateTemperature(starTemperature, ...
    starSolarRadii, planetEarthRadii, planetOrbitalAxis);

index = (im(:,:,1) > h & (im(:,:,2)+im(:,:,3)) < l) | ...
    (im(:,:,2) > h & (im(:,:,3)+im(:,:,1)) < l) | ...
    (im(:,:,3) > h & (im(:,:,1)+im(:,:,2)) < l);
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

# コードコメントのガイドライン

## 一般

### 言語

**Type:** Best Practice

**Description:** 自分とは母国語が異なる人が読み使うコードでは、英語のような共通言語でコメントを書いてください。

**Motivation:**

- 可読性: 英語を使用することで、自国以外の MATLAB ユーザーもコードコメントを読み理解できるようになります。

**Recommended:**

```matlab
% Get the exponentiated values for nDigit numbers
% Initialize the first number of the first slice
```

**Not Recommended:**

```matlab
% nDigit の数値のべき乗された値を取得します
% Inizializza il primo numero della prima fetta
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### コメント記号

**Type:** Rule

**Description:** コメント記号「%」の後には少なくとも 1 つのスペースを入れてください。新しいセクションを定義するには「%%」を使用してください。

**Motivation:**

- 可読性: コメント記号の後にスペースを入れることで可読性が向上します。

**Allowed:**

```matlab
% Find increasing, decreasing edge line indices 
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

## 配置とインデント

### H1 行とヘルプ内容および配置

**Type:** Best Practice

**Description:** 関数の H1 行は、関数宣言の直後、arguments ブロックの前に配置してください。H1 行には、その関数が何をするのかを簡潔に記述します。H1 行に続くヘルプテキストには、関数の使い方に必要な情報（構文、入力と出力の説明、副作用など）を記載してください。

**Motivation:**

- 保守性: しっかり書かれた関数ヘルプは、関数の利用と必要に応じた修正を容易にします。

**Recommended:**

```matlab
function b = rowWiseLast(A)
% rowWiseLast finds the last non-zero element in each row
% Syntax:
%   rowWiseLast(A)
% Inputs:
%   A  Input matrix
% Outputs
%   b  Vector containing the last non-zero value in each row 
%      of A. Note that b(i) = 0 if A(i,:) is all zeros. 
arguments
    A (:, :) double
end

m = size(A, 2);
[~, loc] = max(fliplr(logical(A)), [], 2);
idx = m + 1 – loc;
b = A(sub2ind(size(A), 1:size(A,1), idx'))';
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### 内部コメントの配置

**Type:** Best Practice

**Description:** コメントは、説明対象のコードの直前に配置してください。短いコメントは行末に置いても構いません。

**Motivation:**

- 保守性: コメントをコードの近くに置くことで、理解しやすくなり、必要な変更もしやすくなります。

**Recommended:**

```matlab
function test = isprime(n)
% isprime(n) returns true if n is prime and false otherwise.
test = true;

% Test special cases for small values of n
if (n == 2 || n == 3)
    return
end

% Handle non-positive numbers and multiples of 2 or 3
if (n <= 1 || mod(n, 2) == 0 || mod(n, 3) == 0)
    test = false;
    return
end

% Limit potential factors to numbers less than sqrt(n).
limit = floor(sqrt(n));

% Iterate through numbers of the form 6k ± 1
for ii = 5:6:limit
    if (mod(n, ii) == 0 || mod(n, ii+2) == 0)
        test = false;
        return
    end
end
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### コメントのインデント

**Type:** Rule

**Description:** 関数冒頭の H1 行とヘルプ行は、関数宣言と同じインデントレベルにしてください。その他のコメント行は、直後に続くコード行と同じレベルにインデントしてください。

**Motivation:**

- 可読性: 一貫したインデントにより、コメントと関連コードの対応付けが容易になります。

**Allowed:**

```matlab
function factors = primeFactors(n)
% primeFactors(n) returns all prime factors
% Inputs
%   n:  Number to factorize 
% Outputs
%   factors: List of prime factors
arguments
    n (1, 1) double {mustBeInteger, mustBeGreaterThan(n, 1)}
end

% Return the number if it is prime or 1
if isprime(n) || n == 1
    factors = n;
    return
end

% Find all the prime numbers up to number/2
allPrimes = [];
for ii = 2:floor(n/2)
    if isprime(ii)
        % Add the new prime number to the list
        allPrimes = [allPrimes ii];
    end
end
nPrimes = numel(allPrimes);

% Loop through all the primes
factors = [];
quotient = n;
for ii = 1:nPrimes
    currentPrime = allPrimes(ii);
    % Divide by the current prime until remainder is not zero
    while mod(quotient, currentPrime) == 0
        % Add the current prime to the list of factors
        factors = [factors currentPrime];
        quotient = quotient/currentPrime;
    end
end
end
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---


# 関数作成ガイドライン

## 一般

### ファイル名

**Type:** Rule

**Description:** 関数ファイル名は、最上位関数の名前と同じにしてください。

**Motivation:**

- 理解容易性: ファイル内に記載された関数名と、その関数を呼び出す際に使用する名前が一致しないと混乱を招きます。

**Detection:** Code Analyzer check `FNDEF` (R14)

**History:** Introduced in Version 1.0

---

### 関数を end キーワードで終了する

**Type:** Rule

**Description:** すべての関数は `end` キーワードで終了してください。

**Motivation:**

- 可読性: 関数の終わりを明示することで、特に複数の関数や入れ子関数があるファイルではコードを読みやすくします。

**Allowed:**

```matlab
function Tc = centigrade2Fahrenheit(Tf)
Tc = 9*Tf/5 + 32;
end

function Tk = centigrade2Kelvin(Tc)
Tk = Tc + 273.15;
end
```

**Not Allowed:**

```matlab
function Tc = centigrade2Fahrenheit(Tf)
Tc = 9*Tf/5 + 32;
function Tk = centigrade2Kelvin(Tc)
Tk = Tc + 273.15;
```

**Detection:** Not currently detected

**History:** Introduced in Version 1.0

---

### グローバル状態のリセット

**Type:** Best Practice

**Description:** MATLAB のグローバルまたはシステム状態を変更するときは注意してください。関数やメソッドを抜ける際に状態を元に戻します。変更した状態が元の値にリセットされないと、後続のコードが誤動作する可能性があります。

**Motivation:**

- 再利用性: 関数は自己完結であるべきで、外部の状態変更に依存したり変更を残したりすべきではありません。

- テスト容易性: 状態をリセットする関数は、クリーンな状態で開始・終了するため単体テストが容易です。

**Recommended:**

```matlab
newFolder = fullfile("C:\", "MATLAB", "mydir");
oldPath = path();
c = onCleanup(@()path(oldPath));
addpath(genpath(newFolder));

% Perform some calculations
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### ローカル関数

**Type:** Best Practice

**Description:** 1 つの関数またはスクリプトからのみ使用される関数は、同じファイル内のローカル関数として記述してください。ローカル関数はシンプルに保ちます。独立してテストする必要がある関数は、別ファイルに置いてください。

**Motivation:**

- 保守性: ローカル関数により、関連する機能を 1 つのファイルにまとめられ、読みやすく保守しやすくなります。

**Recommended:**

```matlab
function factor = equationOfState(gas, temperature, pressure)
% Look up critical properties for gas
[criticalTemperature, criticalPressure] = lookupCritical(gas);

% Calculate compressibility factor
factor = vanDerWaals(temperature, pressure, ...
    criticalTemperature, criticalPressure);
end

function Z = vanDerWaals(T, P, Tcritical, Pcritical)
R = 8.3145;                                      % gas constant
a = 27*(R*Tcritical)^2/(64*Pcritical);
b = R*Tcritical/(8*Pcritical);

coefficients = [1 -(b + R*T/P) a/P -a*b/P];
zeros = roots(coefficients);
V = max(zeros(logical(imag(zeros) == 0)))        % molar volume
Z = P*V/(R*T);                                   % compressibility
end 
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### ネスト関数

**Type:** Best Practice

**Description:** ネスト関数の使用は最小限にしてください。ネスト関数はほとんど常にローカル関数で置き換えられます。

**Motivation:**

- 保守性: ネスト関数は親関数の変数へアクセスでき、意図しない副作用を引き起こす可能性があります。

- 可読性: ネスト関数は他の関数の内部に定義されるため、メイン関数が読みにくくなります。

**Not Recommended:**

```matlab
function factor = equationOfState(gas, temperature, pressure)
% Look up critical properties for gas
[Tcritical, Pcritical] = lookupCritical(gas);

% Calculate compressibility factor
factor = vanDerWaals(temperature, pressure);

    function Z = vanDerWaals(T, P)
        R = 8.3145;                                % gas constant
        a = 27*(R*Tcritical)^2/(64*Pcritical);
        b = R*Tcritical/(8*Pcritical);

        coefficients = [1 -(b + R*T/P) a/P -a*b/P];
        zeros = roots(coefficients);
        V = max(zeros(logical(imag(zeros) == 0)))  % molar volume
        Z = P*V/(R*T);                             % compressibility
    end

end
```

**Detection:** Optionally by enabling Code Analyzer check `DAFNF`

**History:** Introduced in Version 1.0

---

### 無名関数

**Type:** Best Practice

**Description:** 無名関数はシンプルで読みやすく保ってください。可能であれば、無名関数の定義と使用箇所をコード中で近接させてください。

**Motivation:**

- 保守性: 無名関数がシンプルで使用箇所の近くに定義されていると、保守が容易です。関数が長くなったり複数回使われるようになったら、ローカル関数に変換できます。

**Recommended:**

```matlab
equation = @(x) x^2 + log(x);
root = fzero(equation, 1);
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### リファクタリング

**Type:** Best Practice

**Description:** 関数内で同じコードブロックを繰り返さないでください。それらの文は新しい関数またはローカル関数へ切り出してください。

**Motivation:**

- 保守性: 変更を 1 か所で行えるようになります。

- 再利用性: 新しい関数はアプリケーションの他の部分でも使用できます。

**Recommended:**

```matlab
function dS = entropyChange(process, gas, Vi, Vf, Ti, Tf)
R = 8.314;                        % Gas constant in J/(mol·K)
[Cp, Cv] = heatCapacity(gas);     % Heat capacities for gas

% Compute entropy for process type
switch process
    case "isothermal"
        dS = computeEntropy(R, Vi, Vf);
    case "constant-volume"
        dS = computeEntropy(Cv, Ti, Tf);
    case "constant-pressure"
        dS = computeEntropy(Cp, Ti, Tf);
    otherwise
        error("Invalid process type.");
end
end

% Common code is factored out into a separate function
function dS_val = computeEntropy(coeff, Yi, Yf)
if (Yi <= 0) || (Yf <= 0)
    error("Inputs must be positive.");
end
dS_val = coeff*log(Yf/Yi);
end
```

**Not Recommended:**

```matlab
function dS = entropyChange(process, gas, Vi, Vf, Ti, Tf)
R = 8.314;                        % Gas constant in J/(mol·K)
[Cp, Cv] = heatCapacity(gas);     % Heat capacities for gas

% Common code is repeated 3 times
switch process
    case "isothermal"
        if (Vi <= 0) || (Vf <= 0)
            error("Volumes must be positive.");
        end
        dS = R*log(Vf/Vi);
    case "constant-volume"
        if (Ti <= 0) || (Tf <= 0)
            error("Temperatures must be positive.");
        end
        dS = Cv*log(Tf/Ti);
    case "constant-pressure"
        if (Ti <= 0) || (Tf <= 0)
            error("Temperatures must be positive.");
        end
        dS = Cp*log(Tf/Ti);
    otherwise
        error("Invalid process type.");
end
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

## 入力

### 関数入力の数

**Type:** Rule

**Description:** 関数宣言における入力引数の数は 6 までに制限してください。省略可能な情報には name-value 引数を使用します。複数の name-value 引数は、関数宣言上は 1 つの引数として表現できます。

**Motivation:**

- 可読性: 引数が少ない関数は読みやすく、理解しやすく、使いやすくなります。

**Allowed:**

```matlab
function p = calculatePotential(x, y, z, dx, dy, dz)

function A = getSamples(interval, data, opt)
arguments
    interval (1, 1) double {mustBePositive}
    data     (1, :) double
    opt.Port (1, 1) double
    opt.Rate (1, 1) double
    opt.Type (1, 1) string {mustBeMember(opts.Type, ["A","D"])}
end
```

**Not Allowed:**

```matlab
function dP = dipPotential(xy, Q, D, R, r0, a, b, Dx, Dy, Nxy)

function readBonay(T, diam, rh, phi, S, phi, visc, zr, kn)    
```

**Detection:** Code Analyzer check `FCNIL` (R2023a)

**History:** Introduced in Version 1.0

---

### 引数のバリデーション

**Type:** Best Practice

**Description:** 外部向けの公開プログラミングインターフェースの一部となる関数では、入力引数をバリデートしてください。バリデーションには arguments ブロックを使用します。

**Motivation:**

- 保守性: 引数のバリデーションにより、将来の開発者が関数の要件を理解できるようになります。

**Recommended:**

```matlab
function [elevation, azimuth] = position(latitude, longitude, date)
arguments
    latitude  (1, 1) double   {mustBeInRange(latitude, -90, 90)}
    longitude (1, 1) double   {mustBeInRange(longitude, -180, 180)}
    date      (1, 1) datetime = datetime("today")
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### Name-Value 引数

**Type:** Best Practice

**Description:** name-value 引数の処理に `varargin` を使うのは避けてください。代わりに、optional 引数と name/value ペアを備えた arguments ブロックを使用してください。

**Motivation:**

- 可読性: arguments ブロックは、期待される入力の型・サイズ・制約を明示的に定義し、関数の動作を明確にします。

- 保守性: 構造化された入力処理により、関数の拡張や変更が容易になります。

**Recommended:**

```matlab
function sankey = sankeyPlot(data, options)
arguments
    data                 (:, :) double
    options.ColorOrder   (:, 3) double = colororder
    options.Transparency (1, 1) double = 0.5
    options.TextSize     (1, 1) double = 10
end
```

**Detection:** Not detected as a guideline. Use of `varargin` may be detected by enabling Code Analyzer check `DAFVI` (R2023b)

**History:** Introduced in Version 1.0

---

### 要素単位関数

**Type:** Best Practice

**Description:** 要素単位の関数は、任意の配列形状で動作するように記述してください。特定の形状の入力に対応する出力は、同じ形状を持つべきです。

**Motivation:**

- 保守性: 要素単位関数間で一貫した動作を保証します。

**Recommended:**

```matlab
function squaredArray = squared(array)
squaredArray = zeros(size(array));
for ii = 1:numel(array)
    squaredArray(ii) = array(ii)^2;
end
squaredArray = reshape(squaredArray, size(array));
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

## 出力

### 関数出力の数

**Type:** Rule

**Description:** 関数宣言における出力引数の数は 4 までに制限してください。

**Motivation:**

- 可読性: 出力が多すぎると、関数が何をするのか理解しづらくなります。

- 再利用性: 出力が少なく明確に定義された関数は、より柔軟で再利用しやすくなります。

**Allowed:**

```matlab
function [tone, left, right] = psdTone(Pxx, F, rbw, freq)
```

**Not Allowed:**

```matlab
function [msg, nfft, Fs, w, p, flag, rtf] = psdchk(P, x, y)       
```

**Detection:** Code Analyzer check `FCNOL` (R2023a)

**History:** Introduced in Version 1.0

---

### varargout による動作変更

**Type:** Best Practice

**Description:** 出力の数が変わっても、各出力の意味を変更しないでください。

**Motivation:**

- 保守性: 追加の出力があると nargout のロジックが複雑になり、関数の動作変更が難しくなります。

- テスト容易性: 複数のシナリオに対してテストケースを作成する必要があり、テストが複雑化します。

**Not Recommended:**

```matlab
function varargout = computeStatistics(data)
nargoutchk(1,2);

if (nargout == 1)
    varargout[1} = mean(data);
else
    varargout{1} = std(data);     % First output is different
    varargout{2} = mean(data);
end
end  
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### 出力のカンマ区切り

**Type:** Rule

**Description:** 関数宣言では、出力はカンマで区切ってください。

**Motivation:**

- 可読性: 関数呼び出しにおいて、出力をカンマで区切ると、それぞれの出力が明確に区別されます。

**Allowed:**

```matlab
function [tone, left, right] = psdTone(Pxx, F, rbw, freq)  
```

**Detection:** Code Analyzer check `NCOMMA` (R2012b)

**History:** Introduced in Version 1.0

---

# クラス作成ガイドライン

## 一般

### ファイル名

**Type:** Rule

**Description:** `classdef` ファイル名はクラス名と同じにしてください。

**Motivation:**

- 保守性: クラス名とファイル名が一致していると、デバッグや修正の際にクラス定義を探しやすくなります。

**Detection:** Code Analyzer check `MCFIL` (R2008a)

**History:** Introduced in Version 1.0

---

### ハンドルクラス vs 値クラス

**Type:** Best Practice

**Description:** 値クラスをハンドルクラスより優先して使用してください。ハンドルクラスは、同一性を変えずに状態が変化するオブジェクトを表現する場合に使用を検討します。以下のようなクラスではハンドルの使用を検討してください

- ハードウェアデバイスやファイルのような物理的または一意なオブジェクトを表す

- グラフィックスコンポーネントのような可視オブジェクトを表す

- リストや木構造のようなリレーショナルデータ構造でオブジェクトを定義する

**Motivation:**

- 理解容易性: 値クラスは、プログラムの別の部分から同じデータを変更できないため、理解しやすいです。

- 保守性: ハンドルクラスの状態はコードの複数箇所で変更され得るため、保守が難しくなります。

**Recommended:**

```matlab
classdef EarthquakeData
classdef quaternion

classdef BluetoothReceiver < handle    % hardware device
classdef SankeyPlot < handle           % graphics object
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### property ブロックの統合

**Type:** Best Practice

**Description:** 関連するクラスプロパティを論理的にグループ化する目的でない限り、同じ属性を持つ複数の `property` ブロックは避けてください。

**Motivation:**

- 保守性: 冗長な `property` ブロックはコードの保守を難しくします。属性の変更には複数の `property` ブロックを編集する必要が生じます。

**Recommended:**

```matlab
classdef OpticFlow
    properties (Access = public)
        MinimumRadius = 1
        MaximumIterations = 1
    end

    properties (Access = private)
        SigmaXY
    end

    properties (Dependent)
        RegionOfInterest
    end
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### method ブロックの統合

**Type:** Best Practice

**Description:** 関連するクラスメソッドを論理的にグループ化する目的でない限り、同じ属性を持つ複数の `method` ブロックは避けてください。

**Motivation:**

- 保守性: 冗長な `method` ブロックはコードの保守を難しくします。属性の変更には複数の `method` ブロックを編集する必要が生じます。

**Recommended:**

```matlab
classdef OpticFlow
    methods (Access = public)
        function obj = OpticFlow(varargin)
            % Code for OpticFlow
        end

        function obj = advanceFlow(obj)
            % Code for advanceFlow
        end
    end

    methods (Static)
        function [r, w] = logCoordinates(region)
            % Code for logCoordinates
        end

        function array = getRegion(region)
            % Code for getRegion
        end
    end
end 
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### Sealed クラス

**Type:** Best Practice

**Description:** クラスをスーパークラスとして使ってほしくない場合は、`Sealed` クラス属性を使用してください。クラスを他者に拡張してもらう設計である場合のみ、クラスを非 Sealed のままにします。

**Motivation:**

- 保守性: Sealed クラスは、サブクラスとの非互換性のリスクなしに、時間の経過とともに変更できます。

**Recommended:**

```matlab
classdef (Sealed) DontSubclass
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

## プロパティ

### プロパティのアクセス制御

**Type:** Best Practice

**Description:** クラスの利用者のニーズを満たすために、プロパティのアクセスは必要な範囲でできるだけ制限してください。これにより、時間の経過とともにクラス設計を進化させやすくなります。例えば、クラス利用者がプロパティを設定する必要がある場合にのみ、set アクセスを許可します。

**Motivation:**

- 理解容易性: プロパティのアクセス方法を制限することで、クラスの挙動と意図がより明確になります。

- 保守性: クラスの内部構造を変更しても、ユーザーは公開インターフェースを通じてクラスとやり取りするため、影響を受けにくくなります。

**Recommended:**

```matlab
classdef OpticFlow
    properties (Access = public)
        maximumIterations = 1
    end

    properties (SetAccess = private)
        MinimumRadius = 1
    end

    properties (Access = private)
        SigmaXY
    end
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### バリデーション

**Type:** Best Practice

**Description:** バリデーションのみを目的として set メソッドを使うのは避けてください。代わりにプロパティのバリデーション構文を使用します。プロパティをバリデートした上で変換する必要が��る場合には、set メソッドを使う方が効率的なことがあります。

**Motivation:**

- 保守性: プロパティのバリデーションにより、将来の開発者やユーザーがクラスプロパティの要件を理解できるようになります。

**Recommended:**

```matlab
classdef Rectangle
    properties
        Origin (1,2) double {mustBeReal}
        Width  (1,1) double {mustBeReal, mustBeNonnegative}
        Height (1,1) double {mustBeReal, mustBeNonnegative}
    end
end
```

**Not Recommended:**

```matlab
classdef Rectangle
    properties
        Origin
        Width
        Height
    end

    methods
        function obj = set.Origin(obj, point)
            validateattributes(point, {'double'}, ...
                {'size', [1 2], 'real'});
            obj.Origin = point;
        end

        function obj = set.Width(obj, value)
            validateattributes(value, {'double'}, ...
                {'size' [1 1], 'real', 'nonnegative'});
            obj.Width = value;
        end

        function obj = set.Height(obj, value)
            validateattributes(value, {'double'}, ...
                {'size' [1 1], 'real', 'nonnegative'});
            obj.Height = value;
        end
    end
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### 依存プロパティの使用

**Type:** Best Practice

**Description:** 次のいずれかに該当する場合にのみ、依存プロパティを使用してください。

- その値が他のプロパティの値のみから計算される

- 実装ではもはや使用されていなくても、互換性のためにそのプロパティをクラス利用者に提供する必要がある

- プロパティの変更が他のプロパティに副作用を引き起こす必要がある

それ以外の場合は非依存プロパティを使用してください。

**Motivation:**

- 理解容易性: 非依存プロパティの方が理解しやすいです。

- テスト容易性: 依存プロパティは、関連プロパティの変更により自動的に変化する可能性があるため、単体テストを複雑にします。

**Recommended:**

```matlab
classdef Rectangle
    properties
        Origin (1,2) double {mustBeReal}
        Width  (1,1) double {mustBeReal, mustBeNonnegative}
        Height (1,1) double {mustBeReal, mustBeNonnegative}
    end

    properties (Dependent)
        Area
    end

    methods
        % Area calculated from Width and Height
        function area = get.Area(obj)  
            area = obj.Width*obj.Height;
        end
    end
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

## メソッド

### 引数のバリデーション

**Type:** Best Practice

**Description:** 外部公開のユーザー向けプログラミングインターフェース（public メソッド）の一部となるメソッドでは、入力引数をバリデートしてください。バリデーションには、R2019b で導入された `arguments` ブロックを使用します。

**Motivation:**

- 保守性: メソッドの引数バリデーションにより、将来の開発者やユーザーがクラスの public メソッドの要件を理解できるようになります。

**Recommended:**

```matlab
classdef Rectangle
    properties
        Origin (1, 2) double = [0 0]
        Width  (1, 1) double {mustBeNonnegative} = 1
        Height (1, 1) double {mustBeNonnegative} = 1
    end

    methods (Access = public)
        function R = enlarge(R, x, y)
            arguments (Input)
                R (1, 1) Rectangle
                x (1, 1) {mustBeNonnegative}
                y (1, 1) {mustBeNonnegative}
            end
            R.Width = R.Width + x;
            R.Height = R.Height + y;
        end
    end
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### クラスコンストラクター

**Type:** Best Practice

**Description:** 複数の引数を返すクラスコンストラクターの作成は避けてください。クラスコンストラクターは、そのクラスの有効なオブジェクト、またはオブジェクト配列を返す必要があります。

**Motivation:**

- 理解容易性: コンストラクターはオブジェクトのインスタンス化のみを目的としています。複数の出力を返すとコンストラクターの複雑さが増します。

**Recommended:**

```matlab
classdef SquareMatrix
    % Custom validator mustBeSquare not shown
    properties
        Data (:,:) double {mustBeMatrix, mustBeSquare} = eye(2)
    end

    methods
        % Constructor returns an object of class SquareMatrix
        function obj = SquareMatrix(varargin)
            if nargin == 1
                obj.Data = varargin{1};
            end
        end

        function c = conditionNumber(obj)
            c = cond(obj.Data);
        end
    end
end
```

**Not Recommended:**

```matlab
classdef SquareMatrix
    % Custom validator mustBeSquare not shown
    properties
        Data (:,:) double {mustBeMatrix, mustBeSquare} = eye(2)
    end

    methods
        % Constructor returns object and another value
        function [obj, condNum] = SquareMatrix(varargin)
            if nargin == 1
                obj.Data = varargin{1};
            end
            condNum = cond(obj.Data);
        end
    end
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### プライベートメソッド

**Type:** Best Practice

**Description:** クラスの利用者が呼び出すことを意図していないメソッドは、`private` または `protected` にしてください。

**Motivation:**

- 保守性: メソッドを private にすることで、外部コードによる誤用のリスクを減らせ、かつユーザーに影響を与えずに変更できます。

**Recommended:**

```matlab
classdef SquareMatrix
    % Custom validator mustBeSquare not shown
    properties
        Data (:,:) double {mustBeMatrix, mustBeSquare} = eye(2)
    end

    methods
        function obj = SquareMatrix(varargin)
            if nargin == 1
                obj.Data = varargin{1};
            end
        end

        function c = conditionNumber(obj)
            c = cond(obj.Data);
        end
    end

    methods (Access = private)     % Internal calculation 
        function d = determinant(obj)
            d = det(obj.Data); 
        end
    end
end  
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### Get メソッド

**Type:** Best Practice

**Description:** 非依存プロパティに対する get メソッドの使用は避けてください。

**Motivation:**

- パフォーマンス: get メソッドは不必要なオーバーヘッドを追加する可能性があります。

**Recommended:**

```matlab
classdef Rectangle
    properties
        Origin (1,2) double {mustBeReal}
        Width  (1,1) double {mustBeReal, mustBeNonnegative}
        Height (1,1) double {mustBeReal, mustBeNonnegative}
    end

    properties (Dependent)
        Area
    end

    methods
        % get method for dependent property Width
        function area = get.Area(obj)
            area = obj.Width*obj.Height;
        end
    end
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### インデクシングのオーバーロード

**Type:** Best Practice

**Description:** 独自のインデクシングを持つクラスを作成する場合は、モジュラーインデクシングを使用してください。可能であれば `subsref` と `subsasgn` のオーバーロードは避けてください。

**Motivation:**

- 保守性: モジュラーインデクシングにより、かっこ、波かっこ、ドットなどの異なるインデクシング操作を個別にカスタマイズできます。

- パフォーマンス: モジュラーインデクシングは `subsref` および `subsasgn` より高性能です。

**Recommended:**

詳細な例は Modular Indexing のドキュメンテーションを参照してください

- [matlab.mixin.indexing.RedefinesParen](https://www.mathworks.com/help/releases/R2024b/matlab/ref/matlab.mixin.indexing.redefinesparen-class.html)

- [matlab.mixin.indexing.RedefinesBrace](https://www.mathworks.com/help/releases/R2024b/matlab/ref/matlab.mixin.indexing.redefinesbrace-class.html)

- [matlab.mixin.indexing.RedefinesDot](https://www.mathworks.com/help/releases/R2024b/matlab/ref/matlab.mixin.indexing.redefinesdot-class.html)

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---
# エラー処理ガイドライン

## 一般

### Code Analyzer の警告

**Type:** Best Practice

**Description:** コードをソース管理にコミットする前、または他者が使用できる状態にする際には、すべての Code Analyzer の警告を修正してください。

**Motivation:**

- 可読性: Code Analyzer の警告を修正すると、未使用変数、到達不能コード、不適切な整形などの潜在的な問題が取り除かれ、コードがよりクリーンで読みやすくなります。

**Detection:** Editor もしくは Code Analyzer Report に表示

**History:** Introduced in Version 1.0

---

### 有益なエラーメッセージ

**Type:** Best Practice

**Description:** 問題の理解と対処方法の判断を助ける、具体的な情報を含むエラーメッセージを書いてください。エラーメッセージは次のいずれかの形式にします。

- 問題と解決策の形式: メッセージの最初の文で問題を述べ、次の文で解決方法を説明します。

- 解決策の形式: 問題を修正するためにユーザーが行うべきこと、または満たすべき条件を述べます。

- 問題の形式: 問題の記述のみを行います。具体的な解決策を述べられない場合に使用します。

**Motivation:**

- 理解容易性: 明確で具体的なエラーメッセージは、エラー時にユーザーが何をすべきかを理解する助けになり、また将来の開発者がどの条件で特定のメッセージが発生するのかを把握する助けになります。

**Recommended:**

問題と解決策の形式:

- `Too many figure objects. Print 1 figure at a time.`

- `Sparse matrices not supported. Use eigs instead.`

解決策の形式:

- `Matrices must be the same size.`

- `"RelTol" value must be a nonnegative scalar.`

問題の形式:

- `Matrix contains NaN or Inf.` 

- `Invalid option combination. `

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

### エラー時の状態リセット

**Type:** Best Practice

**Description:** エラー処理時には、グローバル状態や設定を元の値にリセットしてください。状態のリセットには `try-catch` ブロックや `onCleanup` オブジェクトの使用を検討します。

**Motivation:**

- 再利用性: エラーが発生しても、外部の状態変更を残さないようにします。

**Recommended:**

```matlab
function output = myFunction(input)
oldPath = path;
c = onCleanup(@()path(oldPath));

newFolder = "C:\MATLAB\mydir";
addpath(genpath(newFolder));

% Perform some calculations which might error
end
```

**Detection:** Not detectable

**History:** Introduced in Version 1.0

---

## Try-Catch

### 例外オブジェクトを用いた try-catch の使用

**Type:** Best Practice

**Description:** エラー処理や例外的条件の処理には `try-catch` ブロックを使用してください。通常のフロー制御に `try-catch` を使用しないでください。すべての `try` ブロックには対応する `catch` ブロックを含めます。`catch` ブロックが空の場合は、追加の処理が不要である理由をコメントで説明します。特定のエラーからの回復を試みる `catch` ブロックでは `MException` オブジェクトを使用します。どのエラーが発生したかを決め打ちしないでください。

**Motivation:**

- 理解容易性: `try-catch` を使うことで、特定のエラーやイベントを処理している箇所をコード中で素早く特定できます。

**Recommended:**

```matlab
function manageGlobalState()
% Store original path and current folder
originalPath = path();
originalDir = pwd();

try
    % Modify global state
    addpath("tempFolder");
    cd("C:\Temp");

    % Perform some operations that might error

catch exception
    % Restore path and current folder
    cd(originalDir);
    path(originalPath);

    % Rethrow the error to inform the caller
    rethrow(exception);
end
end
```

**Detection:** Code Analyzer check `CTCH` (R2010b) を有効化することで任意に検出

**History:** Introduced in Version 1.0

---

### throwAsCaller を避ける

**Type:** Best Practice

**Description:** `throwAsCaller` の使用は避けてください。

**Motivation:** 

- 理解容易性: `throwAsCaller` を使うと、エラーがちょうど 1 レベル下の関数から発生したかのように見せる必要があり、実際には呼び出し階層のより深い場所で起きたエラーでも誤解を招くスタックトレースになる可能性があります。

**Recommended:**

```matlab
function numRepos = queryGitHubRepos()
    try
        numRepos = getMatlabRepoCount();
    catch exception
        throw(exception);      % Preserves the full error stack
    end
end

function numRepos = getMatlabRepoCount()
    prefix = "https://api.github.com/search/";
    url = prefix + "repositories?q=language:matlab";
    try
        response = webread(url);
        numRepos = response.total_count;
    catch exception
        error("getMatlabRepoCount:RequestFailed", ...
            "GitHub API request failed: %s", exception.message);
    end
end

>> queryGitHubRepos()
Error using queryGitHubRepos (line 7)
GitHub API request failed: Could not access server.
https://api.github.com/search/repositories?q=language:matlab.
```

**Not Recommended:**

```matlab
function numRepos = queryGitHubRepos()
    try
        numRepos = getMatlabRepoCount();
    catch exception
        throwAsCaller(exception);   % Hides true source of the error
    end
end

function numRepos = getMatlabRepoCount()
    prefix = "https://api.github.com/search/";
    url = prefix + "repositories?q=language:matlab";
    try
        response = webread(url);
        numRepos = response.total_count;
    catch exception
        error("getMatlabRepoCount:RequestFailed", ...
            "GitHub API request failed: %s", exception.message);
    end
end 

>> queryGitHubRepos()
GitHub API request failed: Could not access server.
https://api.github.com/search/repositories?q=language:matlab.
```

**Detection:** 任意で [既存関数に対するカスタム Code Analyzer チェック](https://www.mathworks.com/help/matlab/matlab_env/configure-code-analyzer.html#mw_38519ef1-c176-4933-b2e6-bd17e641681d) を使用

**History:** Introduced in Version 1.0

---