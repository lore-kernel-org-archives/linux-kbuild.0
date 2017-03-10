Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:48924 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932097AbdCJBpf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Mar 2017 20:45:35 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] MAINTAINERS: add Masahiro Yamada as a Kbuild maintainer
Date: Fri, 10 Mar 2017 10:41:50 +0900
Message-Id: <1489110110-9723-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

It has been difficult lately for Michal to work on Kbuild on his
regular basis.  We discussed the maintainership of Kbuild, and I
decided to be a co-maintainer.

Add myself to the maintainer field, and replace the repository with
my own.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Michal Marek <mmarek@suse.com>
---

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c265a5f..f1023c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7084,9 +7084,9 @@ S:	Maintained
 F:	fs/autofs4/
 
 KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
+M:	Masahiro Yamada <yamada.masahiro@socionext.com>
 M:	Michal Marek <mmarek@suse.com>
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git for-next
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git rc-fixes
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 L:	linux-kbuild@vger.kernel.org
 S:	Maintained
 F:	Documentation/kbuild/
-- 
2.7.4

