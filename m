Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57765 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752658AbeBPSlS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 13:41:18 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 11/23] kconfig: add 'shell-stdout' function
Date: Sat, 17 Feb 2018 03:38:39 +0900
Message-Id: <1518806331-7101-12-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This is the second built-in function, which retrieves the first line
of stdout from the given shell command.

Example code:

  config CC_IS_GCC
          bool
          default $(shell $CC --version | grep -q gcc)

  config GCC_VERSION
          int
          default $(shell-stdout $srctree/scripts/gcc-version.sh $CC | sed 's/^0*//') if CC_IS_GCC
          default 0

Result:

  $ make -s alldefconfig && tail -n 2 .config
  CONFIG_CC_IS_GCC=y
  CONFIG_GCC_VERSION=504

  $ make CC=clang -s alldefconfig && tail -n 2 .config
  # CONFIG_CC_IS_GCC is not set
  CONFIG_GCC_VERSION=0

By the way, function calls can be nested, so the following works.

Example code:

  config FOO
          bool
          default $(shell $(shell-stdout echo $COMMAND_IN_CAPITAL | tr [A-Z] [a-z]))

Result:
  $ make -s COMMAND=TRUE alldefconfig && tail -n 1 .config
  CONFIG_FOO=y
  $ make -s COMMAND=FALSE alldefconfig && tail -n 1 .config
  # CONFIG_FOO is not set

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/function.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/scripts/kconfig/function.c b/scripts/kconfig/function.c
index f7f154d..266f4ec 100644
--- a/scripts/kconfig/function.c
+++ b/scripts/kconfig/function.c
@@ -189,10 +189,56 @@ static char *do_shell(struct function *f, int argc, char *argv[])
 	return xstrdup(ret == 0 ? "y" : "n");
 }
 
+static char *do_shell_stdout(struct function *f, int argc, char *argv[])
+{
+	static const char *pre = "(";
+	static const char *post = ") 2>/dev/null";
+	FILE *p;
+	char buf[256];
+	char *cmd;
+	int ret;
+
+	if (argc != 2)
+		return NULL;
+
+	/*
+	 * Surround the command with ( ) in case it is piped commands.
+	 * Also, redirect stderr to /dev/null.
+	 */
+	cmd = xmalloc(strlen(pre) + strlen(argv[1]) + strlen(post) + 1);
+	strcpy(cmd, pre);
+	strcat(cmd, argv[1]);
+	strcat(cmd, post);
+
+	p = popen(cmd, "r");
+	if (!p) {
+		perror(cmd);
+		goto free;
+	}
+	if (fgets(buf, sizeof(buf), p)) {
+		size_t len = strlen(buf);
+
+		if (buf[len - 1] == '\n')
+			buf[len - 1] = '\0';
+	} else {
+		buf[0] = '\0';
+	}
+
+	ret = pclose(p);
+	if (ret == -1)
+		perror(cmd);
+
+free:
+	free(cmd);
+
+	return xstrdup(buf);
+}
+
 void func_init(void)
 {
 	/* register built-in functions */
 	func_add("shell", do_shell, NULL);
+	func_add("shell-stdout", do_shell_stdout, NULL);
 }
 
 void func_exit(void)
-- 
2.7.4

