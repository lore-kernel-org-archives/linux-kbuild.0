Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:47835 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfH0KhP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 06:37:15 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: enable unused-function warnings for W= build with Clang
Date: Tue, 27 Aug 2019 19:36:21 +0900
Message-Id: <20190827103621.1073-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

GCC and Clang have different policy for -Wunused-function; GCC never
reports unused-function warnings for 'static inline' functions whereas
Clang reports them if they are defined in source files instead of
included headers although it has been suppressed since commit
abb2ea7dfd82 ("compiler, clang: suppress warning for unused static
inline functions").

We often miss to remove unused functions where 'static inline' is used
in .c files since there is no tool to detect them. Unused code remains
until somebody notices. For example, commit 075ddd75680f ("regulator:
core: remove unused rdev_get_supply()").

Let's remove __maybe_unused from the inline macro to allow Clang to
start finding unused static inline functions. As always, it is not a
good idea to sprinkle warnings for the normal build, so I added
-Wno-unsued-function for no W= build.

Per the documentation [1], -Wno-unused-function will also disable
-Wunneeded-internal-declaration, which can help find bugs like
commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
I added -Wunneeded-internal-declaration to address it.

If you contribute to code clean-up, please run "make CC=clang W=1"
and check -Wunused-function warnings. You will find lots of unused
functions.

Some of them are false-positives because the call-sites are disabled
by #ifdef. I do not like to abuse the inline keyword for suppressing
unused-function warnings because it is intended to be a hint for the
compiler's optimization. I prefer __maybe_unused or #ifdef around the
definition.

[1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---

Changes in v2:
  - Add -Wunneeded-internal-declaration (per Nathan Chancellor)

 include/linux/compiler_types.h | 10 ++--------
 scripts/Makefile.extrawarn     |  4 ++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 599c27b56c29..14de8d0162fb 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -130,10 +130,6 @@ struct ftrace_likely_data {
 
 /*
  * Force always-inline if the user requests it so via the .config.
- * GCC does not warn about unused static inline functions for
- * -Wunused-function.  This turns out to avoid the need for complex #ifdef
- * directives.  Suppress the warning in clang as well by using "unused"
- * function attribute, which is redundant but not harmful for gcc.
  * Prefer gnu_inline, so that extern inline functions do not emit an
  * externally visible function. This makes extern inline behave as per gnu89
  * semantics rather than c99. This prevents multiple symbol definition errors
@@ -143,11 +139,9 @@ struct ftrace_likely_data {
  * (which would break users of __always_inline).
  */
 #if !defined(CONFIG_OPTIMIZE_INLINING)
-#define inline inline __attribute__((__always_inline__)) __gnu_inline \
-	__maybe_unused notrace
+#define inline inline __attribute__((__always_inline__)) __gnu_inline notrace
 #else
-#define inline inline                                    __gnu_inline \
-	__maybe_unused notrace
+#define inline inline                                    __gnu_inline notrace
 #endif
 
 #define __inline__ inline
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a74ce2e3c33e..69589f4bac48 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -70,5 +70,9 @@ KBUILD_CFLAGS += -Wno-initializer-overrides
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
+KBUILD_CFLAGS += -Wno-unused-function
+# -Wno-unused-function would also disable -Wunneeded-internal-declaration,
+# but we want to keep it enabled.
+KBUILD_CFLAGS += -Wunneeded-internal-declaration
 endif
 endif
-- 
2.17.1
