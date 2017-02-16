Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:32944 "EHLO
        mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933171AbdBPVSX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Feb 2017 16:18:23 -0500
Received: by mail-pf0-f181.google.com with SMTP id c73so8137403pfb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Feb 2017 13:18:23 -0800 (PST)
From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: [PATCH] scripts: objdiff: Ignore debug info when comparing
Date: Thu, 16 Feb 2017 13:18:20 -0800
Message-Id: <20170216211820.4337-1-stephen.boyd@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.m@jp.panasonic.com>, Jason Cooper <jason@lakedaemon.net>

If the kernel is configured to be built with debug symbols, or
has bug tables, comparing files may not work if line numbers
change. This makes comparing object files with these options
harder to do. Let's strip out the debug info and drop the
__bug_table here so that we don't see false positives. There may
be other things to drop later, and it may be architecture
specific, but this works for me with my ARM64 build.

Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---
 scripts/objdiff | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index 62e51dae2138..4fb5d6796893 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -57,13 +57,15 @@ get_output_dir() {
 do_objdump() {
 	dir=$(get_output_dir $1)
 	base=${1##*/}
+	stripped=$dir/${base%.o}.stripped
 	dis=$dir/${base%.o}.dis
 
 	[ ! -d "$dir" ] && mkdir -p $dir
 
 	# remove addresses for a cleaner diff
 	# http://dummdida.tumblr.com/post/60924060451/binary-diff-between-libc-from-scientificlinux-and
-	$OBJDUMP -D $1 | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dis
+	$STRIP -g $1 -R __bug_table -R .note -R .comment -o $stripped
+	$OBJDUMP -D $stripped | sed -e "s/^[[:space:]]\+[0-9a-f]\+//" -e "s:^$stripped:$1:" > $dis
 }
 
 dorecord() {
@@ -73,6 +75,7 @@ dorecord() {
 
 	CMT="`git rev-parse --short HEAD`"
 
+	STRIP="${CROSS_COMPILE}strip"
 	OBJDUMP="${CROSS_COMPILE}objdump"
 
 	for d in $FILES; do
-- 
2.10.0.297.gf6727b0

