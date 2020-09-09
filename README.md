# dcli demo (Dart Package of the Week #8)

This demonstrates how to use the dcli command line scripting package. [See video tutorial](https://youtu.be/z99IxxWmD1Q).

## Steps

1. Install `dcli`
```bash
$ pub global activate dcli
$ sudo dcli_install
```

2. Run the current scripts
```bash
$ dcli run ./bin/myscript.dart
$ dcli run ./bin/unused_deps.dart
```

3. Generate the executables
```bash
$ dart2native ./bin/myscript.dart -o ./bin/myscript
$ dart2native ./bin/unused_deps.dart -o ./bin/unused_deps
```

4. Run the compiled executables
```bash
$ ./bin/myscript
$ ./bin/unused_deps
```

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
