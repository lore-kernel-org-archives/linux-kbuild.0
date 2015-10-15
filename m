Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55003 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753053AbbJOURZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2015 16:17:25 -0400
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 5/9] tags: Process Kconfig files in a single pass
Date: Thu, 15 Oct 2015 22:16:31 +0200
Message-Id: <1444940195-28272-6-git-send-email-mmarek@suse.com>
In-Reply-To: <1444940195-28272-1-git-send-email-mmarek@suse.com>
References: <1444940195-28272-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Michal Marek <mmarek@suse.com>
---
 scripts/tags.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 996301c3883d..7d496f602c4b 100755
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
@@ -270,9 +267,7 @@ emacs()
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

