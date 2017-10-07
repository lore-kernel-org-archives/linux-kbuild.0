Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37478 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751823AbdJGUYI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Oct 2017 16:24:08 -0400
From: Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: [PATCH v2] kbuild: clang: remove crufty HOSTCFLAGS
Date: Sat,  7 Oct 2017 13:23:23 -0700
Message-Id: <20171007202323.1993-1-nick.desaulniers@gmail.com>
In-Reply-To: <CAK7LNARTo+esxqmoLrXufRoP7qbJprwVOYiRB-a2jRd=AZ0sXg@mail.gmail.com>
References: <CAK7LNARTo+esxqmoLrXufRoP7qbJprwVOYiRB-a2jRd=AZ0sXg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: behanw@converseincode.com, dl9pf@gmx.de, charlebm@gmail.com, mka@chromium.org, ghackmann@google.com, md@google.com, Nick Desaulniers <nick.desaulniers@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When compiling with `make CC=clang HOSTCC=clang`, I was seeing warnings
that clang did not recognize -fno-delete-null-pointer-checks for HOSTCC
targets.  These were added in commit 61163efae020 ("kbuild: LLVMLinux:
Add Kbuild support for building kernel with Clang").

Clang does not support -fno-delete-null-pointer-checks, so adding it to
HOSTCFLAGS if HOSTCC is clang does not make sense.

It's not clear why the other warnings were disabled, and just for
HOSTCFLAGS, but I can remove them, add -Werror to HOSTCFLAGS and compile
with clang just fine.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
---
 Makefile | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Makefile b/Makefile
index cf007a31d575..5853d9492590 100644
--- a/Makefile
+++ b/Makefile
@@ -306,11 +306,6 @@ HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
 HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
 HOST_LOADLIBES := $(HOST_LFS_LIBS)
 
-ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
-HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
-		-Wno-missing-field-initializers -fno-delete-null-pointer-checks
-endif
-
 # Decide whether to build built-in, modular, or both.
 # Normally, just do built-in.
 
-- 
2.11.0

