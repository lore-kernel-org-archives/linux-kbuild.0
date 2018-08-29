Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from genki.is ([104.200.25.21]:55038 "EHLO genki.is"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725199AbeH2H1t (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Aug 2018 03:27:49 -0400
Date: Tue, 28 Aug 2018 23:26:24 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8
Message-Id: <de6839047158272d1976ab023b9a222c09679846.1535512872.git.sky@genki.is>
From: Genki Sky <sky@genki.is>
Subject: [PATCH] scripts/setlocalversion: git: Make -dirty check more robust
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Christian Kujau <lists@nerdbynature.de>, Elazar Leibovich <elazar.leibovich@oracle.com>, Junio C Hamano <gitster@pobox.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>

$(git diff-index) relies on the index being refreshed. This refreshing
of the index used to happen, but was removed in cdf2bc632ebc
("scripts/setlocalversion on write-protected source tree", 2013-06-14)
due to issues with a read-only filesystem.

If the index is not refreshed, one runs into problems. E.g. as
described in [0], git stores the uid in its index, so even if just the
uid has changed (or git is tricked into thinking so), then we will
think the tree is dirty. So as in [1], if you package linux-git with a
system that uses fakeroot(1), you get a "-dirty" version. Unless you
manually $(git update-index --refresh) themselves.

The simplest solution seems to be $(git status --porcelain), with an
additional flag saying "ignore untracked files". It seems clearer
about what it does, and avoids issues regarding cached indexes and
writable filesystems, but still has stable output for scripting.

[0]: https://public-inbox.org/git/0190ae30-b6c8-2a8b-b1fb-fd9d84e6dfdf@oracle.com/
[1]: https://bbs.archlinux.org/viewtopic.php?id=236702

Signed-off-by: Genki Sky <sky@genki.is>
---

Notes:

   Testing: I ran $(git status -uno .... && echo dirty) after each of
   the following commands, checking sanity:

     % > Makefile
     % git checkout Makefile
     % chmod -w .git
     % > scripts/package/Makefile
     % chmod +w .git
     % git checkout scripts/package/Makefile
     % touch new_file
     % touch scripts/package/new_file
     % rm new_file scripts/package/new_file
     % mv Makefile .clang-format
     % git checkout Makefile .clang-format

 scripts/setlocalversion | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 71f39410691b..79f7dd57d571 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -74,7 +74,7 @@ scm_version()
 		fi

 		# Check for uncommitted changes
-		if git diff-index --name-only HEAD | grep -qv "^scripts/package"; then
+		if git status -uno --porcelain | grep -qv '^.. scripts/package'; then
 			printf '%s' -dirty
 		fi

--
2.18.0
