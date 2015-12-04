Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53850 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752950AbbLDP0r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2015 10:26:47 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH v2 4/8] tags: Process Kconfig files in a single pass
Date: Fri,  4 Dec 2015 16:26:23 +0100
Message-Id: <1449242787-16598-5-git-send-email-mmarek@suse.com>
In-Reply-To: <1449242787-16598-1-git-send-email-mmarek@suse.com>
References: <1449242787-16598-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Michal Marek <mmarek@suse.com>
---
v2: No change

 scripts/tags.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index c845b3e2e7b0..283f772133fe 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -219,10 +219,7 @@ exuberant()
 
 	all_kconfigs | xargs $1 -a                              \
 	--langdef=kconfig --language-force=kconfig              \
-	--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/\2/'
-
-	all_kconfigs | xargs $1 -a                              \
-	--langdef=kconfig --language-force=kconfig              \
+	--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/\2/' \
 	--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/CONFIG_\2/'
 
 	all_defconfigs | xargs -r $1 -a                         \
@@ -269,9 +266,7 @@ emacs()
 	--regex='/[^#]*DEFINE_HASHTABLE(\([^,)]*\)/\1/'
 
 	all_kconfigs | xargs $1 -a                              \
-	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/'
-
-	all_kconfigs | xargs $1 -a                              \
+	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/' \
 	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/CONFIG_\3/'
 
 	all_defconfigs | xargs -r $1 -a                         \
-- 
2.1.4

