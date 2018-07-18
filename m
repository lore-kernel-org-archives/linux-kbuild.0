Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:33092 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730598AbeGRJxT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jul 2018 05:53:19 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] kbuild: if_changed: document single use per target limitation
Date: Wed, 18 Jul 2018 11:13:36 +0200
Message-Id: <20180718091336.4540-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dirk Gouders <dirk@gouders.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Users of if_changed could easily feel invited to use it to divide a
recipe into parts like:

a: prereq FORCE
	$(call if_changed,do_a)
	$(call if_changed,do_b)

But this is problematic, because if_changed should not be used more
than once per target: in the above example, if_changed stores the
command-line of the given command in .a.cmd and when a is up-to-date
with respect to prereq, the file .a.cmd contains the command-line for
the last command executed, i.e. do_b.

When the recipe is then executed again, without any change of
prerequisites, the command-line check for do_a will fail, do_a will be
executed and stored in .a.cmd.  The next check, however, will still see
the old content (the file isn't re-read) and if_changed will skip
do_b, because the command-line test will not recognize a change.  On
the next execution of the recipe the roles will flip: do_a is OK but
do_b not and it will be executed.  And so on...

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 Documentation/kbuild/makefiles.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 048fc39a6b91..01fae5a01ce7 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1105,6 +1105,12 @@ When kbuild executes, the following steps are followed (roughly):
 		target: source(s) FORCE
 	#WRONG!#	$(call if_changed, ld/objcopy/gzip/...)
 
+        Note: if_changed should not be used more than once per target.
+              It stores the executed command in a corresponding .cmd
+        file and multiple calls would result in overwrites and
+        unwanted results when the target is up to date and only the
+        tests on changed commands trigger execution of commands.
+
     ld
 	Link target. Often, LDFLAGS_$@ is used to set specific options to ld.
 
-- 
2.16.1

