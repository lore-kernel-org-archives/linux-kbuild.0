Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:42252 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757134AbZBKVYO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Feb 2009 16:24:14 -0500
Message-Id: <200902112124.n1BLO9qK027146@imap1.linux-foundation.org>
Subject: [patch 1/1] tags: fix config symbols generation
From: akpm@linux-foundation.org
Date: Wed, 11 Feb 2009 13:24:09 -0800
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com

From: Alexey Dobriyan <adobriyan@gmail.com>

commit 4f628248a578585472e19e4cba2c604643af8c6c aka "kbuild: reintroduce
ALLSOURCE_ARCHS support for tags/cscope" breaks tags generation for
Kconfig symbols.

Steps to reproduce:

	make tags
	vi -t PROC_FS

It should jump to 'config PROC_FS' line.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/tags.sh |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff -puN scripts/tags.sh~tags-fix-config-symbols-generation scripts/tags.sh
--- a/scripts/tags.sh~tags-fix-config-symbols-generation
+++ a/scripts/tags.sh
@@ -76,7 +76,10 @@ all_sources()
 
 all_kconfigs()
 {
-	find_sources $ALLSOURCE_ARCHS 'Kconfig*'
+	for arch in $ALLSOURCE_ARCHS; do
+		find_sources $arch 'Kconfig*'
+	done
+	find_other_sources 'Kconfig*'
 }
 
 all_defconfigs()
_
