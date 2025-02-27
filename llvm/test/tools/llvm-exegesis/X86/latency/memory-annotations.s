# REQUIRES: exegesis-can-execute-in-subprocess, x86_64-linux

# Test the basic functionality of memory annotations, namely that we can
# specify a memory definition, map it into the process, and then use the
# specified memory.

# RUN: llvm-exegesis -mtriple=x86_64-unknown-unknown -mode=latency -snippets-file=%s -execution-mode=subprocess | FileCheck %s
# RUN: llvm-exegesis -mtriple=x86_64-unknown-unknown -mode=latency -snippets-file=%s -execution-mode=subprocess -repetition-mode=loop | FileCheck %s

# CHECK: measurements:
# CHECK-NEXT: value: {{.*}}, per_snippet_value: {{.*}}

# LLVM-EXEGESIS-MEM-DEF test1 4096 2147483647
# LLVM-EXEGESIS-MEM-MAP test1 8192

movq $8192, %rax
movq (%rax), %rdi
