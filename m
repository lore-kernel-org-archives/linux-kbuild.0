Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:55219 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751516AbdJ0UNw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Oct 2017 16:13:52 -0400
Received: by mail-io0-f194.google.com with SMTP id e89so15130215ioi.11
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Oct 2017 13:13:52 -0700 (PDT)
From: Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2] kbuild: fix linker feature test macros when cross compiling with Clang
Date: Fri, 27 Oct 2017 13:13:43 -0700
Message-Id: <20171027201345.87383-1-ndesaulniers@google.com>
In-Reply-To: <CAK7LNASyP3x8wnvv_Eo_CbHehY5+pPjcpJFAn3fw8NAAi00GQA@mail.gmail.com>
References: <CAK7LNASyP3x8wnvv_Eo_CbHehY5+pPjcpJFAn3fw8NAAi00GQA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: md@google.com, ghackmann@google.com, pirama@google.com, Nick Desaulniers <ndesaulniers@google.com>, Douglas Anderson <dianders@chromium.org>, Ingo Molnar <mingo@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Mark Charlebois <charlebm@gmail.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, linux-kernel@vger.kernel.org

I was not seeing my linker flags getting added when using ld-option when
cross compiling with Clang. Upon investigation, this seems to be due to
a difference in how GCC vs Clang handle cross compilation.

GCC is configured at build time to support one backend, that is implicit
when compiling.  Clang is explicit via the use of `-target <triple>` and
ships with all supported backends by default.

GNU Make feature test macros that compile then link will always fail
when cross compiling with Clang unless Clang's triple is passed along to
the compiler. For example:

$ clang -x c /dev/null -c -o temp.o
$ aarch64-linux-android/bin/ld -E temp.o
aarch64-linux-android/bin/ld:
unknown architecture of input file `temp.o' is incompatible with
aarch64 output
aarch64-linux-android/bin/ld:
warning: cannot find entry symbol _start; defaulting to
0000000000400078
$ echo $?
1

$ clang -target aarch64-linux-android- -x c /dev/null -c -o temp.o
$ aarch64-linux-android/bin/ld -E temp.o
aarch64-linux-android/bin/ld:
warning: cannot find entry symbol _start; defaulting to 00000000004002e4
$ echo $?
0

This causes conditional checks that invoke $(CC) without the target
triple, then $(LD) on the result, to always fail.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes since v1:
* base patch off of
  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
  kbuild branch, per Masahiro.
* Use $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) rather than $(CLANG_TRIPLE), per
  Masahiro.

 scripts/Kbuild.include | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 064f477dfdca..0f09e4508554 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -228,12 +228,13 @@ cc-if-fullversion = $(shell [ $(cc-fullversion) $(1) $(2) ] && echo $(3) || echo
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
 cc-ldoption = $(call try-run-cached,\
-	$(CC) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) $(1) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
 
 # ld-option
 # Usage: LDFLAGS += $(call ld-option, -X)
 ld-option = $(call try-run-cached,\
-	$(CC) -x c /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
+	$(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -x c /dev/null -c -o "$$TMPO"; \
+	$(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
 
 # ar-option
 # Usage: KBUILD_ARFLAGS := $(call ar-option,D)
-- 
2.15.0.rc2.357.g7e34df9404-goog

