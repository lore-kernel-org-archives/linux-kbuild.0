Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35037 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752704AbcEPNhg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 May 2016 09:37:36 -0400
Received: by mail-wm0-f46.google.com with SMTP id e201so101328030wme.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 May 2016 06:37:35 -0700 (PDT)
Date: Mon, 16 May 2016 15:37:31 +0200
From: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
Subject: Re: [PATCH v2] scripts/tags.sh: Handle missing {c,e,g}tags/cscope
 utilities
Message-ID: <20160516133731.GA4829@eugeniu-X230>
References: <1461516120-5600-1-git-send-email-eugeniu.m.rosca@gmail.com>
 <571E0F1F.8090204@suse.com>
 <20160515134413.GA14628@eugeniu-X230>
 <57397167.4000000@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <57397167.4000000@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, eugeniu.m.rosca@gmail.com


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename="0001-scripts-tags.sh-Handle-missing-c-e-g-tags-cscope-uti.patch.txt"

From 5917e6602bd0e44c4a672bc4ac8c7a323b6300b6 Mon Sep 17 00:00:00 2001
From: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
Date: Sun, 24 Apr 2016 17:30:53 +0200
Subject: [PATCH v2] scripts/tags.sh: Handle missing {c,e,g}tags/cscope utilities

If the required ctags/etags/gtags/cscope host utility is not found,
current behavior is:

$> make cscope
  GEN     cscope
./scripts/tags.sh: line 140: cscope: command not found
$> make gtags
  GEN     gtags
./scripts/tags.sh: line 145: gtags: command not found
$> make tags
  GEN     tags
xargs: ctags: No such file or directory
sed: can't read tags: No such file or directory
Makefile:1509: recipe for target 'tags' failed
make: *** [tags] Error 2
$> make TAGS
  GEN     TAGS
xargs: etags: No such file or directory
sed: can't read TAGS: No such file or directory
Makefile:1509: recipe for target 'TAGS' failed
make: *** [TAGS] Error 2

Instead of implementing a more graceful handling, this patch only
makes sure that tags.sh script exits immediately upon the first
failure caused by the missing ctags/etags/gtags/cscope tool. By not
altering the exit code, the user will additionally get the failed
recipe in the root Makefile. The output becomes:

$> make cscope
  GEN     cscope
./scripts/tags.sh: line 140: cscope: command not found
Makefile:1517: recipe for target 'cscope' failed
make: *** [cscope] Error 127
$> make gtags
  GEN     gtags
./scripts/tags.sh: line 145: gtags: command not found
Makefile:1517: recipe for target 'gtags' failed
make: *** [gtags] Error 127
$> make tags
  GEN     tags
xargs: ctags: No such file or directory
Makefile:1517: recipe for target 'tags' failed
make: *** [tags] Error 127
$> make TAGS
  GEN     TAGS
xargs: etags: No such file or directory
Makefile:1517: recipe for target 'TAGS' failed
make: *** [TAGS] Error 127

Signed-off-by: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
---
 scripts/tags.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index f72f48f..96b6dec 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -318,22 +318,22 @@ fi
 remove_structs=
 case "$1" in
 	"cscope")
-		docscope
+		docscope || exit
 		;;
 
 	"gtags")
-		dogtags
+		dogtags || exit
 		;;
 
 	"tags")
 		rm -f tags
-		xtags ctags
+		xtags ctags || exit
 		remove_structs=y
 		;;
 
 	"TAGS")
 		rm -f TAGS
-		xtags etags
+		xtags etags || exit
 		remove_structs=y
 		;;
 esac
-- 
2.7.4


--pf9I7BMVVzbSWLtt--
