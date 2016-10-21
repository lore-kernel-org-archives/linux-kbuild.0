Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:51554 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754127AbcJULQL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Oct 2016 07:16:11 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC PATCH] kbuild: add -fno-PIE
Date: Fri, 21 Oct 2016 13:16:00 +0200
Message-Id: <20161021111600.9417-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Debian started to build the gcc with --enable-default-pie by default so the
kernel build ends before it starts properly with:
|kernel/bounds.c:1:0: error: code model kernel does not support PIC mode

Is this okay or do we want some kind of check to see if -fno-PIE is support=
ed?
It is mentioned in the 4.4.7 gcc manpage is it is not *that* new :)

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bf6e44a421df..97296d66b586 100644
--- a/Makefile
+++ b/Makefile
@@ -398,7 +398,7 @@ KBUILD_CPPFLAGS :=3D -D__KERNEL__
 KBUILD_CFLAGS   :=3D -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common \
 		   -Werror-implicit-function-declaration \
-		   -Wno-format-security \
+		   -Wno-format-security -fno-PIE \
 		   -std=3Dgnu89
=20
 KBUILD_AFLAGS_KERNEL :=3D
--=20
2.9.3

