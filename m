Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53872 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753222AbbLDP0s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2015 10:26:48 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH v2 5/8] tags: Do not try to index defconfigs
Date: Fri,  4 Dec 2015 16:26:24 +0100
Message-Id: <1449242787-16598-6-git-send-email-mmarek@suse.com>
In-Reply-To: <1449242787-16598-1-git-send-email-mmarek@suse.com>
References: <1449242787-16598-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

The defconfig files are in predictable locations, so there is no need to
index them. Plus, the script was only looking for files named
'defconfig', which only works on a few architectures nowadays.

Signed-off-by: Michal Marek <mmarek@suse.com>
---
v2: No change

 scripts/tags.sh | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 283f772133fe..03041ab7634c 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -134,11 +134,6 @@ all_kconfigs()
 	find_other_sources 'Kconfig*'
 }
 
-all_defconfigs()
-{
-	find_sources $ALLSOURCE_ARCHS "defconfig"
-}
-
 docscope()
 {
 	(echo \-k; echo \-q; all_target_sources) > cscope.files
@@ -221,10 +216,6 @@ exuberant()
 	--langdef=kconfig --language-force=kconfig              \
 	--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/\2/' \
 	--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/CONFIG_\2/'
-
-	all_defconfigs | xargs -r $1 -a                         \
-	--langdef=dotconfig --language-force=dotconfig          \
-	--regex-dotconfig='/^#?[[:blank:]]*(CONFIG_[[:alnum:]_]+)/\1/'
 }
 
 emacs()
@@ -268,9 +259,6 @@ emacs()
 	all_kconfigs | xargs $1 -a                              \
 	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/' \
 	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/CONFIG_\3/'
-
-	all_defconfigs | xargs -r $1 -a                         \
-	--regex='/^#?[ \t]?\(CONFIG_[a-zA-Z0-9_]+\)/\1/'
 }
 
 xtags()
-- 
2.1.4

