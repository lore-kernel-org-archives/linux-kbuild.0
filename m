Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:35975 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752246AbcLHTRH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 14:17:07 -0500
Received: by mail-io0-f178.google.com with SMTP id a81so14612133ioe.3
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Dec 2016 11:17:06 -0800 (PST)
Date: Thu, 8 Dec 2016 14:17:03 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH] kbuild: fix scripts/adjust_autoksyms.sh* for the no modules
 case
Message-ID: <alpine.LFD.2.20.1612081410570.1657@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org

When CONFIG_TRIM_UNUSED_KSYMS=y and no modules are actually selected,
the adjust_autoksyms.sh script fails with:

sed: can't read .tmp_versions/*.mod: No such file or directory

Let's cope with that case gracefully.

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 8dc1918b67..513da1a4a2 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -59,6 +59,7 @@ cat > "$new_ksyms_file" << EOT
  */
 
 EOT
+[ "$(ls -A "$MODVERDIR")" ] &&
 sed -ns -e '3{s/ /\n/g;/^$/!p;}' "$MODVERDIR"/*.mod | sort -u |
 while read sym; do
 	if [ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ]; then
