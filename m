Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:36744 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751975AbbFYIVw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Jun 2015 04:21:52 -0400
Received: by lacny3 with SMTP id ny3so40154653lac.3
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jun 2015 01:21:51 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC v2 1/4] scripts: add stackusage script
Date: Thu, 25 Jun 2015 10:21:29 +0200
Message-Id: <1435220492-15868-2-git-send-email-linux@rasmusvillemoes.dk>
In-Reply-To: <1435220492-15868-1-git-send-email-linux@rasmusvillemoes.dk>
References: <1434849046-19920-1-git-send-email-linux@rasmusvillemoes.dk>
 <1435220492-15868-1-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org

The current checkstack.pl script has a few problems, stemming from the
overly simplistic attempt at parsing objdump output with regular
expresions: For example, on x86_64 it doesn't take the push
instruction into account, making it consistently underestimate the
real stack use, and it also doesn't capture stack pointer adjustments
of exactly 128 bytes [1].

Since newer gcc (>= 4.6) knows about -fstack-usage, we might as well
take the information straight from the horse's mouth. This patch
introduces scripts/stackusage, which is a simple wrapper for running
make with KCFLAGS set to -fstack-usage. Example use is

scripts/stackusage -o out.su -j8 lib/

The script understands "-o foo" for writing to 'foo' and -h for a
trivial help text; anything else is passed to make.

Afterwards, we find all newly created .su files, massage them a
little, sort by stack use and write the result to a single output
file.

Note that the function names printed by (at least) gcc 4.7 are
sometimes useless. For example, the first three lines of out.su
generated above are

./lib/decompress_bunzip2.c:155  get_next_block  448     static
./lib/decompress_unlzma.c:537   unlzma  336     static
./lib/vsprintf.c:616    8       304     static

That function '8' is really the static symbol_string(), but it has
been subject to 'interprocedural scalar replacement of aggregates', so
its name in the object file is 'symbol_string.isra.8'. gcc 5.0 doesn't
have this problem; it uses the full name as seen in the object file.

[1] Since gcc encodes that by

48 83 c4 80             add    $0xffffffffffffff80,%rsp

and not

48 81 ec 80 00 00 00    sub    $0x80,%rsp

since -128 fits in an imm8.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 scripts/stackusage | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100755 scripts/stackusage

diff --git a/scripts/stackusage b/scripts/stackusage
new file mode 100755
index 000000000000..b30dfa6b3a0a
--- /dev/null
+++ b/scripts/stackusage
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+outfile=""
+now=`date +%s`
+
+while [ $# -gt 0 ]
+do
+    case "$1" in
+        -o)
+	    outfile="$2"
+	    shift 2;;
+	-h)
+	    echo "usage: $0 [-o outfile] <make options/args>"
+	    exit 0;;
+	*)  break;;
+    esac
+done
+
+if [ -z "$outfile" ]
+then
+    outfile=`mktemp --tmpdir stackusage.$$.XXXX`
+fi
+
+KCFLAGS="${KCFLAGS} -fstack-usage" make "$@"
+
+# Prepend directory name to file names, remove column information,
+# make file:column/function/size/type properly tab-separated.
+find . -name '*.su' -newermt "@${now}" -print |                     \
+    xargs perl -MFile::Basename -pe                                 \
+        '$d = dirname($ARGV); s#([^:]+:[0-9]+):[0-9]+:#$d/$1\t#;' | \
+    sort -k3,3nr > "${outfile}"
+
+echo "$0: output written to ${outfile}"
-- 
2.1.3

