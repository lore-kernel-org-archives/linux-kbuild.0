Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:42628 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752146AbYLAWWA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Dec 2008 17:22:00 -0500
Message-Id: <200812012221.mB1ML8pR013109@imap1.linux-foundation.org>
Subject: [patch 7/8] tags: link from CONFIG_x to 'config x' as well
From: akpm@linux-foundation.org
Date: Mon, 01 Dec 2008 14:21:07 -0800
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com

From: Alexey Dobriyan <adobriyan@gmail.com>

Inability to jump from CONFIG_ symbol in source to symbol definition in
Kconfig is very, very annoying. You'll jump to useless entry in autoconf.h,
if it exists at all.

No more.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 Makefile |    6 ++++++
 1 file changed, 6 insertions(+)

diff -puN Makefile~tags-link-from-config_x-to-config-x-as-well Makefile
--- a/Makefile~tags-link-from-config_x-to-config-x-as-well
+++ a/Makefile
@@ -1482,6 +1482,10 @@ define xtags
 		--langdef=kconfig \
 		--language-force=kconfig \
 		--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/\2/'; \
+	    $(all-kconfigs) | xargs $1 -a \
+		--langdef=kconfig \
+		--language-force=kconfig \
+		--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/CONFIG_\2/'; \
 	    $(all-defconfigs) | xargs -r $1 -a \
 		--langdef=dotconfig \
 		--language-force=dotconfig \
@@ -1490,6 +1494,8 @@ define xtags
 	    $(all-sources) | xargs $1 -a; \
 	    $(all-kconfigs) | xargs $1 -a \
 		--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/'; \
+	    $(all-kconfigs) | xargs $1 -a \
+		--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/CONFIG_\3/'; \
 	    $(all-defconfigs) | xargs -r $1 -a \
 		--regex='/^#?[ \t]?\(CONFIG_[a-zA-Z0-9_]+\)/\1/'; \
 	else \
_
