# pigen_practice

A new Flutter project.

## Pigeon CLI でスキーマからファイル生成する

```
flutter pub run pigeon \
    --input pigeons/story.dart \
    --dart_out lib/pigeons_output/story.dart \
    --objc_header_out ios/Runner/story.h \
    --objc_source_out ios/Runner/story.m \
    --experimental_swift_out ios/Runner/Story.swift
```

## 開発メモ

最新の`freezed` と 最新の`pigeon` で依存している `analyzer` のバージョン不一致で、コンフリクトが発生する

- `freezed`: ^2.2.1
  - analyzer: ^5.2.0
- `pigeon`: ^4.2.5
  - analyzer: ">=4.4.0 <5.0.0"

```
Running "flutter pub get" in pigen_practice...                  
Because no versions of pigeon match >4.2.5 <5.0.0 and pigeon 4.2.5 depends on analyzer ^4.4.0, pigeon ^4.2.5 requires analyzer ^4.4.0.
And because freezed >=2.2.1 depends on analyzer ^5.2.0, pigeon ^4.2.5 is incompatible with freezed >=2.2.1.
So, because pigen_practice depends on both freezed ^2.2.1 and pigeon ^4.2.5, version solving failed.
pub get failed (1; So, because pigen_practice depends on both freezed ^2.2.1 and pigeon ^4.2.5, version solving failed.)
```

### 対応方法

`freezed` のバージョンを一時的にダウングレードして対応した。

```
flutter_riverpod: ^2.1.1
freezed: ^2.0.0
freezed_annotation: ^2.2.0
```


