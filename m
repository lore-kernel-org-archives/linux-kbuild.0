Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55243 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgGBXjf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jul 2020 19:39:35 -0400
From: Danny Lin <danny@kdrag0n.dev>
Subject: [PATCH] kbuild: Allow Clang global merging if !MODULES
Date: Thu,  2 Jul 2020 16:39:29 -0700
Message-Id: <20200702233929.181409-1-danny@kdrag0n.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Danny Lin <danny@kdrag0n.dev>

The old reasoning for disabling Clang's global merging optimization is
that it breaks modpost by coalescing many symbols into _MergedGlobals.
However, modpost is only used in builds with dynamic modules;
vmlinux.symvers is still created during standalone builds, but it's
effectively just an empty dummy file.

Enabling the optimization whenever possible allows us to reap the
benefits of reduced register pressure when many global variables are
used in the same function.

An x86 defconfig kernel built with this optimization boots fine in qemu,
and a downstream 4.14 kernel has been used on arm64 for nearly a year
without any issues caused by this optimization.

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index a60c98519c37..f04c3639cf61 100644
--- a/Makefile
+++ b/Makefile
@@ -772,10 +772,13 @@ ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
 KBUILD_CFLAGS += -Wno-format-invalid-specifier
 KBUILD_CFLAGS += -Wno-gnu
+
+ifdef CONFIG_MODULES
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
 # See modpost pattern 2
 KBUILD_CFLAGS += -mno-global-merge
+endif
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.27.0
