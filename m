Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:34593 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932520AbbFUBLH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 20 Jun 2015 21:11:07 -0400
Received: by lbbti3 with SMTP id ti3so90677068lbb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Jun 2015 18:11:05 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC 1/4] scripts: add stackusage script
Date: Sun, 21 Jun 2015 03:10:43 +0200
Message-Id: <1434849046-19920-2-git-send-email-linux@rasmusvillemoes.dk>
In-Reply-To: <1434849046-19920-1-git-send-email-linux@rasmusvillemoes.dk>
References: <1434849046-19920-1-git-send-email-linux@rasmusvillemoes.dk>
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
make with EXTRA_CFLAGS set to -fstack-usage. Example use is

scripts/stackusage -o out.su -- -j8 fs/ext4/

Arguments after -- are passed to make. Afterwards, we find all newly
created .su files, massage them a little, sort by stack use and
concatenate the result to a single output file.

[1] Since gcc encodes that by

48 83 c4 80             add    $0xffffffffffffff80,%rsp

and not

48 81 ec 80 00 00 00    sub    $0x80,%rsp

since -128 fits in an imm8.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 scripts/stackusage | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100755 scripts/stackusage

diff --git a/scripts/stackusage b/scripts/stackusage
new file mode 100755
index 000000000000..d631af648ae7
--- /dev/null
+++ b/scripts/stackusage
@@ -0,0 +1,40 @@
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
+	    echo "$outfile"
+	    shift 2;;
+	-h)
+	    echo "usage: $0 [-o outfile] -- <make options/args>"
+	    exit 0;;
+	--)
+	    shift
+	    break;;
+	-*)
+            echo >&2 "usage: $0 [-o outfile] -- <make options/args>"
+	    exit 1;;
+	*)  break;;
+    esac
+done
+
+if [ -z "$outfile" ]
+then
+    outfile=`mktemp --tmpdir stackusage.$$.XXXX`
+fi
+
+make EXTRA_CFLAGS="-fstack-usage" "$@"
+
+# Prepend directory name to file names, remove line/column
+# information, make file/function/size/type properly tab-separated.
+find . -name '*.su' -newermt "@${now}" -print |                 \
+    xargs perl -MFile::Basename -pe                             \
+      '$d = dirname($ARGV); s#([^:]+):([0-9]+:){2}#$d/$1\t#;' | \
+    sort -k3,3nr > "${outfile}"
+
+echo "$0: output written to ${outfile}"
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
