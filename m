Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f202.google.com ([209.85.222.202]:49319 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbeLRWtZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Dec 2018 17:49:25 -0500
Received: by mail-qk1-f202.google.com with SMTP id a193so21051781qkg.16
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Dec 2018 14:49:24 -0800 (PST)
Date: Tue, 18 Dec 2018 14:49:07 -0800
Message-Id: <20181218224907.1274-1-tmroeder@google.com>
Mime-Version: 1.0
Subject: [PATCH v2] scripts: add a tool to produce a compile_commands.json file
From: Tom Roeder <tmroeder@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Roeder <tmroeder@google.com>

The LLVM/Clang project provides many tools for analyzing C source code.
Many of these tools are based on LibTooling
(https://clang.llvm.org/docs/LibTooling.html), which depends on a
database of compiler flags. The standard container for this database is
compile_commands.json, which consists of a list of JSON objects, each
with "directory", "file", and "command" fields.

Some build systems, like cmake or bazel, produce this compilation
information directly. Naturally, Makefiles don't. However, the kernel
makefiles already create .<target>.o.cmd files that contain all the
information needed to build a compile_commands.json file.

So, this commit adds scripts/gen_compile_commands.py, which recursively
searches through a directory for .<target>.o.cmd files and extracts
appropriate compile commands from them. It writes a
compile_commands.json file that LibTooling-based tools can use.

By default, gen_compile_commands.py starts its search in its working
directory and (over)writes compile_commands.json in the working
directory. However, it also supports --output and --directory flags for
out-of-tree use.

Note that while gen_compile_commands.py enables the use of clang-based
tools, it does not require the kernel to be compiled with clang. E.g.,
the following sequence of commands produces a compile_commands.json file
that works correctly with LibTooling.

make defconfig
make
scripts/gen_compile_commands.py

Also note that this script is written to work correctly in both Python 2
and Python 3, so it does not specify the Python version in its first
line.

For an example of the utility of this script: after running
gen_compile_commands.json on the latest kernel version, I was able to
use Vim + the YouCompleteMe pluging + clangd to automatically jump to
definitions and declarations. Obviously, cscope and ctags provide some
of this functionality; the advantage of supporting LibTooling is that it
opens the door to many other clang-based tools that understand the code
directly and do not rely on regular expressions and heuristics.

Tested: Built several recent kernel versions and ran the script against
them, testing tools like clangd (for editor/LSP support) and clang-check
(for static analysis). Also extracted some test .cmd files from a kernel
build and wrote a test script to check that the script behaved correctly
with all permutations of the --output and --directory flags.

Signed-off-by: Tom Roeder <tmroeder@google.com>
---
Changelog since v1:
- Add simple string replacement to unescape the pound sign.

 scripts/gen_compile_commands.py | 151 ++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100755 scripts/gen_compile_commands.py

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
new file mode 100755
index 000000000000..7915823b92a5
--- /dev/null
+++ b/scripts/gen_compile_commands.py
@@ -0,0 +1,151 @@
+#!/usr/bin/env python
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) Google LLC, 2018
+#
+# Author: Tom Roeder <tmroeder@google.com>
+#
+"""A tool for generating compile_commands.json in the Linux kernel."""
+
+import argparse
+import json
+import logging
+import os
+import re
+
+_DEFAULT_OUTPUT = 'compile_commands.json'
+_DEFAULT_LOG_LEVEL = 'WARNING'
+
+_FILENAME_PATTERN = r'^\..*\.cmd$'
+_LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
+_VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
+
+# A kernel build generally has over 2000 entries in its compile_commands.json
+# database. If this code finds 500 or fewer, then warn the user that they might
+# not have all the .cmd files, and they might need to compile the kernel.
+_LOW_COUNT_THRESHOLD = 500
+
+
+def parse_arguments():
+    """Sets up and parses command-line arguments.
+
+    Returns:
+        log_level: A logging level to filter log output.
+        directory: The directory to search for .cmd files.
+        output: Where to write the compile-commands JSON file.
+    """
+    usage = 'Creates a compile_commands.json database from kernel .cmd files'
+    parser = argparse.ArgumentParser(description=usage)
+
+    directory_help = ('Path to the kernel source directory to search '
+                      '(defaults to the working directory)')
+    parser.add_argument('-d', '--directory', type=str, help=directory_help)
+
+    output_help = ('The location to write compile_commands.json (defaults to '
+                   'compile_commands.json in the search directory)')
+    parser.add_argument('-o', '--output', type=str, help=output_help)
+
+    log_level_help = ('The level of log messages to produce (one of ' +
+                      ', '.join(_VALID_LOG_LEVELS) + '; defaults to ' +
+                      _DEFAULT_LOG_LEVEL + ')')
+    parser.add_argument(
+        '--log_level', type=str, default=_DEFAULT_LOG_LEVEL,
+        help=log_level_help)
+
+    args = parser.parse_args()
+
+    log_level = args.log_level
+    if log_level not in _VALID_LOG_LEVELS:
+        raise ValueError('%s is not a valid log level' % log_level)
+
+    directory = args.directory or os.getcwd()
+    output = args.output or os.path.join(directory, _DEFAULT_OUTPUT)
+    directory = os.path.abspath(directory)
+
+    return log_level, directory, output
+
+
+def process_line(root_directory, file_directory, command_prefix, relative_path):
+    """Extracts information from a .cmd line and creates an entry from it.
+
+    Args:
+        root_directory: The directory that was searched for .cmd files. Usually
+            used directly in the "directory" entry in compile_commands.json.
+        file_directory: The path to the directory the .cmd file was found in.
+        command_prefix: The extracted command line, up to the last element.
+        relative_path: The .c file from the end of the extracted command.
+            Usually relative to root_directory, but sometimes relative to
+            file_directory and sometimes neither.
+
+    Returns:
+        An entry to append to compile_commands.
+
+    Raises:
+        ValueError: Could not find the extracted file based on relative_path and
+            root_directory or file_directory.
+    """
+    # The .cmd files are intended to be included directly by Make, so they
+    # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
+    # kernel version). The compile_commands.json file is not interepreted
+    # by Make, so this code replaces the escaped version with '#'.
+    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
+
+    cur_dir = root_directory
+    expected_path = os.path.join(cur_dir, relative_path)
+    if not os.path.exists(expected_path):
+        # Try using file_directory instead. Some of the tools have a different
+        # style of .cmd file than the kernel.
+        cur_dir = file_directory
+        expected_path = os.path.join(cur_dir, relative_path)
+        if not os.path.exists(expected_path):
+            raise ValueError('File %s not in %s or %s' %
+                             (relative_path, root_directory, file_directory))
+    return {
+        'directory': cur_dir,
+        'file': relative_path,
+        'command': prefix + relative_path,
+    }
+
+
+def main():
+    """Walks through the directory and finds and parses .cmd files."""
+    log_level, directory, output = parse_arguments()
+
+    level = getattr(logging, log_level)
+    logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
+
+    filename_matcher = re.compile(_FILENAME_PATTERN)
+    line_matcher = re.compile(_LINE_PATTERN)
+
+    compile_commands = []
+    for dirpath, _, filenames in os.walk(directory):
+        for filename in filenames:
+            if not filename_matcher.match(filename):
+                continue
+            filepath = os.path.join(dirpath, filename)
+
+            with open(filepath, 'rt') as f:
+                for line in f:
+                    result = line_matcher.match(line)
+                    if not result:
+                        continue
+
+                    try:
+                        entry = process_line(directory, dirpath,
+                                             result.group(1), result.group(2))
+                        compile_commands.append(entry)
+                    except ValueError as err:
+                        logging.info('Could not add line from %s: %s',
+                                     filepath, err)
+
+    with open(output, 'wt') as f:
+        json.dump(compile_commands, f, indent=2, sort_keys=True)
+
+    count = len(compile_commands)
+    if count < _LOW_COUNT_THRESHOLD:
+        logging.warning(
+            'Found %s entries. Have you compiled the kernel?', count)
+
+
+if __name__ == '__main__':
+    main()
-- 
2.20.0.405.gbc1bbc6f85-goog
