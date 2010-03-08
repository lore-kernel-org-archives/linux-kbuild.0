Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44833 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752994Ab0CHJfF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Mar 2010 04:35:05 -0500
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH] Revert "kbuild: specify absolute paths for cscope"
Date: Mon,  8 Mar 2010 10:34:41 +0100
Message-Id: <1268040881-18707-1-git-send-email-mmarek@suse.cz>
In-Reply-To: <20100307213023.GB3794@viiv.ffwll.ch>
References: <20100307213023.GB3794@viiv.ffwll.ch>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Michal Marek <mmarek@suse.cz>, Ian Campbell <ijc@hellion.org.uk>, linux-kbuild@vger.kernel.org

This reverts commit eb8f844c0a41c4529a7d06b7801296eca9ae67aa. Ian
Campbell writes:
> I keep my kernel source tree on a more powerful build box where I run my
> builds etc (including "make cscope") but run my editor from my
> workstation with an NFS mount to the source. This worked fine for me
> using relative paths for cscope. Using absolute paths in cscope breaks
> this previously working setup because the root path is not the same on
> both systems. I guess this is similar to moving the source tree around.
>
> Without wanting to start a flamewar it really sounds to me like we are
> working around a vim (or cscope) bug here, emacs with cscope bindings
> works fine in this configuration.

Given that absolute paths can be forced by make O=. cscope, change the
default back to relative paths.

Ian Campbell <ijc@hellion.org.uk>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 scripts/tags.sh |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 868b4c8..8509bb5 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -18,6 +18,8 @@ ignore="( -name SCCS -o -name BitKeeper -o -name .svn -o \
           -prune -o"
 
 # Do not use full path if we do not use O=.. builds
+# Use make O=. {tags|cscope}
+# to force full paths for a non-O= build
 if [ "${KBUILD_SRC}" = "" ]; then
 	tree=
 else
@@ -108,13 +110,7 @@ all_defconfigs()
 
 docscope()
 {
-	# always use absolute paths for cscope, as recommended by cscope
-	# upstream
-	case "$tree" in
-		/*) ;;
-		*) tree=$PWD/$tree ;;
-	esac
-	(cd /; echo \-k; echo \-q; all_sources) > cscope.files
+	(echo \-k; echo \-q; all_sources) > cscope.files
 	cscope -b -f cscope.out
 }
 
-- 
1.6.6.1

