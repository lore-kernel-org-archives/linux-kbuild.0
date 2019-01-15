Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbfAOQov (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Jan 2019 11:44:51 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.20 08/57] x86, modpost: Replace last remnants of RETPOLINE with CONFIG_RETPOLINE
Date: Tue, 15 Jan 2019 17:35:49 +0100
Message-Id: <20190115154911.193525782@linuxfoundation.org>
In-Reply-To: <20190115154910.734892368@linuxfoundation.org>
References: <20190115154910.734892368@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, WANG Chao <chao.wang@ucloud.cn>, Borislav Petkov <bp@suse.de>, Zhenzhong Duan <zhenzhong.duan@oracle.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <ak@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>, David Woodhouse <dwmw@amazon.co.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jkosina@suse.cz>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Tim Chen <tim.c.chen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-kbuild@vger.kernel.org, srinivas.eeda@oracle.com, x86-ml <x86@kernel.org>

4.20-stable review patch.  If anyone has any objections, please let me know.

------------------

From: WANG Chao <chao.wang@ucloud.cn>

commit e4f358916d528d479c3c12bd2fd03f2d5a576380 upstream.

Commit

  4cd24de3a098 ("x86/retpoline: Make CONFIG_RETPOLINE depend on compiler support")

replaced the RETPOLINE define with CONFIG_RETPOLINE checks. Remove the
remaining pieces.

 [ bp: Massage commit message. ]

Fixes: 4cd24de3a098 ("x86/retpoline: Make CONFIG_RETPOLINE depend on compiler support")
Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jessica Yu <jeyu@kernel.org>
Cc: Jiri Kosina <jkosina@suse.cz>
Cc: Kees Cook <keescook@chromium.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: linux-kbuild@vger.kernel.org
Cc: srinivas.eeda@oracle.com
Cc: stable <stable@vger.kernel.org>
Cc: x86-ml <x86@kernel.org>
Link: https://lkml.kernel.org/r/20181210163725.95977-1-chao.wang@ucloud.cn
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/x86/kernel/cpu/bugs.c   |    2 +-
 include/linux/compiler-gcc.h |    2 +-
 include/linux/module.h       |    2 +-
 scripts/mod/modpost.c        |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -213,7 +213,7 @@ static enum spectre_v2_mitigation spectr
 static enum spectre_v2_user_mitigation spectre_v2_user __ro_after_init =
 	SPECTRE_V2_USER_NONE;
 
-#ifdef RETPOLINE
+#ifdef CONFIG_RETPOLINE
 static bool spectre_v2_bad_module;
 
 bool retpoline_module_ok(bool has_retpoline)
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -68,7 +68,7 @@
  */
 #define uninitialized_var(x) x = x
 
-#ifdef RETPOLINE
+#ifdef CONFIG_RETPOLINE
 #define __noretpoline __attribute__((__indirect_branch__("keep")))
 #endif
 
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -817,7 +817,7 @@ static inline void module_bug_finalize(c
 static inline void module_bug_cleanup(struct module *mod) {}
 #endif	/* CONFIG_GENERIC_BUG */
 
-#ifdef RETPOLINE
+#ifdef CONFIG_RETPOLINE
 extern bool retpoline_module_ok(bool has_retpoline);
 #else
 static inline bool retpoline_module_ok(bool has_retpoline)
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2157,7 +2157,7 @@ static void add_intree_flag(struct buffe
 /* Cannot check for assembler */
 static void add_retpoline(struct buffer *b)
 {
-	buf_printf(b, "\n#ifdef RETPOLINE\n");
+	buf_printf(b, "\n#ifdef CONFIG_RETPOLINE\n");
 	buf_printf(b, "MODULE_INFO(retpoline, \"Y\");\n");
 	buf_printf(b, "#endif\n");
 }
