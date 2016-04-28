Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f50.google.com ([209.85.192.50]:35591 "EHLO
	mail-qg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752630AbcD1Vdl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 17:33:41 -0400
Received: by mail-qg0-f50.google.com with SMTP id f74so35492151qge.2
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Apr 2016 14:33:40 -0700 (PDT)
Date: Thu, 28 Apr 2016 17:33:38 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH] kbuild: fix adjust_autoksyms.sh for modules that need only
 one symbol
Message-ID: <alpine.LFD.2.20.1604281729590.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org

When only one symbol was listed and therefore the line didn't contain
any space to separate multiple symbols, that symbol got ignored.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 5bf538f1ed..8dc1918b67 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -59,7 +59,7 @@ cat > "$new_ksyms_file" << EOT
  */
 
 EOT
-sed -ns -e '3s/ /\n/gp' "$MODVERDIR"/*.mod | sort -u |
+sed -ns -e '3{s/ /\n/g;/^$/!p;}' "$MODVERDIR"/*.mod | sort -u |
 while read sym; do
 	if [ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ]; then
 		sym="${sym#_}"
