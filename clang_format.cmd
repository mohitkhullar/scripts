find bb bbinc bdb cdb2api comdb2rle csc2 db net schemachange                \
sockpool tools/pmux tools/cdb2sql tools/cdb2sockpool                        \
-name '*.c' -o -name '*.cpp' -o -name '*.h'                                 \
| xargs git diff master...`git rev-parse --abbrev-ref HEAD` -U0 --no-color  \
| grep -v "^\-" | clang-format-diff -style="{BasedOnStyle: llvm,            \
IndentWidth: 4, UseTab: Never, BreakBeforeBraces: Linux, SortIncludes:      \
false, IndentCaseLabels: false, AlwaysBreakTemplateDeclarations: true,      \
AllowShortFunctionsOnASingleLine: false, AllowShortCaseLabelsOnASingleLine: \
false, AllowShortIfStatementsOnASingleLine: false}" -p1 -i
