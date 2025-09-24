# はじめに

こちらは [GitHub:mathworks](https://github.com/mathworks/MATLAB-Coding-Guidelines) に
公開されている MATLAB Coding Guidelines (Version 1.0.0) を参考に作成した日本語訳です。
内容の正確性には配慮しておりますが、あくまで参考情報としてご利用ください。
正式かつ最新の情報については、必ず英語版の MATLAB Coding Guidelines をご参照ください。

# MATLAB Coding Guidelines


このリポジトリには、推奨される MATLAB コーディングガイドラインが含まれています。これらのガイドラインは、MATLAB のコードベースに一定の規則性と一貫性を導入したいと考える、大規模な組織や MATLAB 開発チーム向けに主に作成されたものです。ガイドラインの使用は任意です。

このガイドラインには、「Rules」と「Best Practices」が含まれています。_Rules_ は、ガイドラインに準拠するために必ず守らなければならない項目です。ルール違反は MATLAB のコードアナライザーによって検出され、MATLAB エディターおよびコードアナライザーのレポートで識別されます。各バージョンのガイドラインには、ルール違反を検出するためのチェックが含まれた `codeAnalyzerConfiguration.json` ファイルが付属しています。

_Best Practices_ は、MATLAB コードの品質向上を目的とした推奨事項です。これらは任意であり、必ずしも従う必要はありません。一部のベストプラクティスは、コードアナライザーでチェックを有効にすることで、ルールとして検出することも可能です。ガイドライン文書の導入部分では、ルールとベストプラクティスの違いについて詳しく説明されています。

このリポジトリ内の各フォルダーには、コーディングガイドラインのバージョンが含まれています。以下の表に示された MATLAB のバージョンに対応する、最新のガイドラインをダウンロードしてください。


| **Use guidelines version** | **With MATLAB version** |
| -------------------------- | ----------------------- |
| [Version 1.0](https://github.com/mathworks/MATLAB-Coding-Guidelines/releases/tag/v1.0.0)| R2025a and higher       |

各フォルダーの内容は以下の通りです：

- codeAnalyzerConfiguration.json
- MATLAB Coding Guidelines.md
- MATLAB Coding Guidelines_jp.md
- MATLAB Coding Guidelines.pdf
- RevisionHistory.txt

このガイドラインは、MATLAB コミュニティからのフィードバックによって、今後も進化していくことが期待されています。今後の改訂に向けて、皆様からのご意見や提案を歓迎します。Issue を立てたり、ディスカッションに投稿したり、自由にご参加ください。皆様の洞察とフィードバックは、このドキュメントの改善と、コミュニティにとってより有益なものにするための助けとなります。

このガイドライン文書および関連する codeAnalyzerConfiguration.json ファイルは、組織の特定のニーズに合わせた独自のローカルガイドラインを作成するための出発点として使用することができます。

