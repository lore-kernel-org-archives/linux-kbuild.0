Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:37622 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbfHMGLt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 02:11:49 -0400
From: Knut Omang <knut.omang@oracle.com>
Subject: [RFC 09/19] ktf: resolve: A helper utility to aid in exposing private kernel symbols to KTF tests.
Date: Tue, 13 Aug 2019 08:09:24 +0200
Message-Id: <09d79897772dd370a61967b03e83fa4b8663698b.1565676440.git-series.knut.omang@oracle.com>
In-Reply-To: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, Knut Omang <knut.omang@oracle.com>

Takes an input file foo.txt with a list of symbols on the form:

#module foo
#header foo.h
private_foo_symbol_1
private_foo_symbol_2

and creates usable definitions to access these (requires CONFIG_KALLSYMS_ALL).
This is useful to be able to easily and cleanly test internal interfaces of a module.
Examples follows in the selftests later in the series.

Signed-off-by: Knut Omang <knut.omang@oracle.com>
---
 tools/testing/selftests/ktf/scripts/resolve | 188 +++++++++++++++++++++-
 1 file changed, 188 insertions(+)
 create mode 100755 tools/testing/selftests/ktf/scripts/resolve

diff --git a/tools/testing/selftests/ktf/scripts/resolve b/tools/testing/selftests/ktf/scripts/resolve
new file mode 100755
index 0000000..74005f7
--- /dev/null
+++ b/tools/testing/selftests/ktf/scripts/resolve
@@ -0,0 +1,188 @@
+#!/usr/bin/python
+
+# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
+#    Author: Knut Omang <knut.omang@oracle.com>
+#
+# SPDX-License-Identifier: GPL-2.0
+#
+# A script to generate code and header definitions for
+# module and kernel symbols not directly exposed to KTF.
+# (See the documentation for KTF for details)
+#
+
+import os, sys, re, shutil, string, ConfigParser
+
+def usage():
+    print "Usage: resolve symbolfile outputfile"
+    exit(0)
+
+class FuncInfo:
+    def __init__(self, sym, re_sym, re_decl):
+        self.symbol = sym
+        self.re_sym = re_sym
+        self.re_decl = re_decl
+
+    def __repr__(self):
+        return "FuncInfo: [%s: %s]" % (self.symbol, self.re_decl)
+
+class Module:
+    def __init__(self, name, header):
+        self.cur_header = header
+        self.prefix = "Z"
+        self.name = name
+        self.symbols = {}  # Input:  headerfile -> symbol list
+        self.func_def = []  # FuncInfo list
+        self.debug = False
+        all_modules.append(self)
+
+    def log(self, str):
+        if self.debug:
+            print str
+
+    def SetHeader(self, header):
+        self.cur_header = header
+
+    def AddSymbol(self, sym):
+        try:
+            h = self.symbols[self.cur_header]
+            h.append(sym)
+        except:
+            self.symbols[self.cur_header] = [sym]
+
+    # Open along include path:
+    def Open(self, filename):
+        for p in includepath:
+            try:
+                f = os.path.join(p, filename)
+                self.log(" -- trying " + f)
+                header = open(f,'r')
+                return header
+            except:
+                continue
+        sys.stderr.write(" ** unable to open \"%s\"\n" % filename)
+        return None
+
+    # Parse the relevant header files for function defs:
+    def ParseDefs(self):
+        for hf in self.symbols.keys():
+            self.log(" ** Parsing %s:" % hf)
+            header = self.Open(hf)
+            if header == None:
+                return
+            content = header.read()
+            symbols = self.symbols[hf]
+            types = r"(extern|u8|u16|u32|u64|int|long|size_t|off_t|loff_t|void|struct|union\s)(.*[\*\s]"
+            funor = ")(" + "|".join(symbols) + r")(\([^\)]+\);)$"
+            tt = types + funor
+            s = re.compile(tt, re.MULTILINE)
+            miter = s.finditer(content)
+            s_count = 0
+            for m in miter:
+                sym = m.group(3)
+                re_name = "_".join([self.prefix, sym])
+                re_decl = "%s%s(*%s)%s" % (m.group(1), m.group(2), re_name, m.group(4))
+                self.func_def.append(FuncInfo(sym, re_name, re_decl))
+                s_count = s_count + 1
+
+            if s_count != len(symbols):
+                print " ** Warning: File %s: Found %d definitions from %d symbols!" % \
+                    (hf, s_count, len(symbols))
+                print " ** - please check/fix output manually!"
+
+    # Output functions:
+    def write_funcs(self, file):
+        for fi in self.func_def:
+            file.write("\t%s\n"% fi.re_decl)
+
+    def write_defines(self, file):
+        for fi in self.func_def:
+            file.write("#define %s ktf_syms.%s\n" % (fi.symbol, fi.re_sym))
+
+    def write_resolve_calls(self, file):
+        for fi in self.func_def:
+            file.write("\tktf_resolve_symbol(%s, %s);\n" % (self.name, fi.symbol))
+
+usage_h = False
+my_argv = []
+includepath = [""]
+
+for arg in sys.argv[1:]:
+    if arg == "-h":
+        usage_h = True
+        continue
+    incl = re.match(r"-I([^\s]+)", arg)
+    if incl != None:
+        includepath.append(incl.group(1))
+        continue
+    genopt = re.match(r"-([^\s]+)", arg)
+    if genopt != None:
+        # Silently ignore other cc options as we accept cc-flags-y:
+        #
+        continue
+    my_argv.append(arg)
+
+# Main program:
+
+if len(my_argv) != 2 or usage_h:
+    usage()
+
+symfile = my_argv[0]
+outputfile = my_argv[1]
+
+all_modules = []
+module = Module("kernel", None)  # Default, at the top of the file is the main kernel symbols
+header = None  # A header directive is required before any symbols
+
+try:
+    file = open(symfile, 'r')
+except:
+    print "Unable to open config file \"%s\"" % symfile
+    exit(1)
+for line in file:
+    match = re.match(r"^#(\w+) ([\w\.]+)\s*$", line)
+    if match != None:
+        cmd = match.group(1)
+        value = match.group(2)
+        if cmd == "module":
+            module = Module(value, header)
+        elif cmd == "header":
+            header = value
+            module.SetHeader(header)
+        else:
+            raise ResolveError("Unknown directive \"%s\"" % cmd)
+        #print "%s set to %s" % (cmd, value)
+        continue
+    match = re.match(r"\s*(\w+)\s*", line)
+    if match != None:
+        s = match.group(1)
+        module.AddSymbol(s)
+
+for m in all_modules:
+    m.ParseDefs()
+
+try:
+    output = open(outputfile, "w")
+except:
+    print "Failed to open output header file \"%s\"" % outputfile
+output.write('#ifndef _KTF_RESOLVE_H\n#define _KTF_RESOLVE_H\n')
+output.write('#include "ktf.h"\n\nstruct ktf_syms {\n')
+
+for m in all_modules:
+    m.write_funcs(output)
+
+output.write('};\n\n')
+
+for m in all_modules:
+    m.write_defines(output)
+
+output.write('\n\nextern struct ktf_syms ktf_syms;\n')
+output.write('\nint ktf_resolve_symbols(void);\n#ifndef KTF_CLIENT\n')
+output.write('struct ktf_syms ktf_syms;\n\n')
+
+output.write('\nint ktf_resolve_symbols(void)\n{\n')
+
+for m in all_modules:
+    m.write_resolve_calls(output)
+
+output.write('\treturn 0;\n}\n\n#endif /* !KTF_CLIENT */\n#endif /* _KTF_RESOLVE_H */ \n')
+output.close()
-- 
git-series 0.9.1
