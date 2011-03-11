Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52207 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750905Ab1CKG7t (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Mar 2011 01:59:49 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2B6xnhB011900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-kbuild@vger.kernel.org>; Fri, 11 Mar 2011 01:59:49 -0500
Received: from localhost (beach.nrt.redhat.com [10.64.200.71])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP id p2B6xlPq025207
	for <linux-kbuild@vger.kernel.org>; Fri, 11 Mar 2011 01:59:48 -0500
Date: Fri, 11 Mar 2011 15:59:47 +0900 (JST)
Message-Id: <20110311.155947.824460700302079643.yamato@redhat.com>
Subject: [PATCH] Introducing TAGSFALGS
From: Masatake YAMATO <yamato@redhat.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

This patch introduces TAGSFALGS which is passed to the indexer invoked
via tags, TAGS, scope, or gtags target.

Here is an example:

     make O=/tmp/build TAGSFLAGS="--excmd=number" tags

Signed-off-by: Masatake YAMATO <yamato@redhat.com>
---
 Makefile        |    3 ++-
 scripts/tags.sh |   52 ++++++++++++++++++++++++++++++++--------------------
 2 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index 26492be..fd36251 100644
--- a/Makefile
+++ b/Makefile
@@ -1383,8 +1383,9 @@ clean: $(clean-dirs)
 
 # Generate tags for editors
 # ---------------------------------------------------------------------------
+TAGSFLAGS =
 quiet_cmd_tags = GEN     $@
-      cmd_tags = $(CONFIG_SHELL) $(srctree)/scripts/tags.sh $@
+      cmd_tags = $(CONFIG_SHELL) $(srctree)/scripts/tags.sh $@ $(TAGSFLAGS)
 
 tags TAGS cscope gtags: FORCE
 	$(call cmd,tags)
diff --git a/scripts/tags.sh b/scripts/tags.sh
index bd6185d..53c8989 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -111,17 +111,20 @@ all_defconfigs()
 docscope()
 {
 	(echo \-k; echo \-q; all_sources) > cscope.files
-	cscope -b -f cscope.out
+	cscope "$@" -b -f cscope.out
 }
 
 dogtags()
 {
-	all_sources | gtags -f -
+	all_sources | gtags "$@" -f -
 }
 
 exuberant()
 {
-	all_sources | xargs $1 -a                               \
+        cmd=$1
+	shift
+	
+	all_sources | xargs $cmd "$@" -a                        \
 	-I __initdata,__exitdata,__acquires,__releases          \
 	-I __read_mostly,____cacheline_aligned                  \
 	-I ____cacheline_aligned_in_smp                         \
@@ -134,15 +137,15 @@ exuberant()
 	--regex-c++='/^TRACE_EVENT\(([^,)]*).*/trace_\1/'		\
 	--regex-c++='/^DEFINE_EVENT\(([^,)]*).*/trace_\1/'
 
-	all_kconfigs | xargs $1 -a                              \
+	all_kconfigs | xargs $cmd "$@" -a                       \
 	--langdef=kconfig --language-force=kconfig              \
 	--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/\2/'
 
-	all_kconfigs | xargs $1 -a                              \
+	all_kconfigs | xargs $cmd "$@" -a                       \
 	--langdef=kconfig --language-force=kconfig              \
 	--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/CONFIG_\2/'
 
-	all_defconfigs | xargs -r $1 -a                         \
+	all_defconfigs | xargs -r $cmd "$@" -a                  \
 	--langdef=dotconfig --language-force=dotconfig          \
 	--regex-dotconfig='/^#?[[:blank:]]*(CONFIG_[[:alnum:]_]+)/\1/'
 
@@ -150,28 +153,34 @@ exuberant()
 
 emacs()
 {
-	all_sources | xargs $1 -a                               \
+        cmd=$1
+	shift
+    
+	all_sources | xargs $cmd "$@" -a                        \
 	--regex='/^ENTRY(\([^)]*\)).*/\1/'                      \
 	--regex='/^SYSCALL_DEFINE[0-9]?(\([^,)]*\).*/sys_\1/'
 
-	all_kconfigs | xargs $1 -a                              \
+	all_kconfigs | xargs $cmd "$@" -a                       \
 	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/'
 
-	all_kconfigs | xargs $1 -a                              \
+	all_kconfigs | xargs $cmd "$@" -a                       \
 	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/CONFIG_\3/'
 
-	all_defconfigs | xargs -r $1 -a                         \
+	all_defconfigs | xargs -r $cmd "$@" -a                  \
 	--regex='/^#?[ \t]?\(CONFIG_[a-zA-Z0-9_]+\)/\1/'
 }
 
 xtags()
 {
-	if $1 --version 2>&1 | grep -iq exuberant; then
-		exuberant $1
-	elif $1 --version 2>&1 | grep -iq emacs; then
-		emacs $1
+        cmd=$1
+        shift
+
+	if $cmd --version 2>&1 | grep -iq exuberant; then
+		exuberant $cmd "$@"
+	elif $cmd --version 2>&1 | grep -iq emacs; then
+		emacs $cmd "$@"
 	else
-		all_sources | xargs $1 -a
+		all_sources | xargs $cmd "$@" -a
         fi
 }
 
@@ -187,22 +196,25 @@ if [ "${ARCH}" = "um" ]; then
 	fi
 fi
 
-case "$1" in
+target=$1
+shift
+
+case "$target" in
 	"cscope")
-		docscope
+		docscope $@
 		;;
 
 	"gtags")
-		dogtags
+		dogtags $@
 		;;
 
 	"tags")
 		rm -f tags
-		xtags ctags
+		xtags ctags $@
 		;;
 
 	"TAGS")
 		rm -f TAGS
-		xtags etags
+		xtags etags $@
 		;;
 esac
-- 
1.7.4

