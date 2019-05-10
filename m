Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:49735 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfEJGNP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 02:13:15 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kconfig: do not write .config if the content is the same
Date: Fri, 10 May 2019 15:12:05 +0900
Message-Id: <20190510061205.28753-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190510061205.28753-1-yamada.masahiro@socionext.com>
References: <20190510061205.28753-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Joel Fernandes <joel@joelfernandes.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Kconfig updates the .config when it exits even if its content is
exactly the same as before. Since its timestamp becomes newer than
that of other build artifacts, additional processing is invoked,
which is annoying.

- syncconfig is invoked to update include/config/auto.conf, etc.

- kernel/config.o is recompiled if CONFIG_IKCONFIG is enabled,
  then vmlinux is relinked as well.

If the .config is not changed at all, we do not have to even
touch it. Just bail out showing "No change to .config".

  $ make allmodconfig
  scripts/kconfig/conf  --allmodconfig Kconfig
  #
  # configuration written to .config
  #
  $ make allmodconfig
  scripts/kconfig/conf  --allmodconfig Kconfig
  #
  # No change to .config
  #

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 54 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 9fd6430c93d2..399973e35533 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
  */
 
+#include <sys/mman.h>
 #include <sys/stat.h>
 #include <ctype.h>
 #include <errno.h>
@@ -36,6 +37,52 @@ static bool is_dir(const char *path)
 	return S_ISDIR(st.st_mode);
 }
 
+/* return true if the given two files are the same, false otherwise */
+static bool is_same(const char *file1, const char *file2)
+{
+	int fd1, fd2;
+	struct stat st1, st2;
+	void *map1, *map2;
+	bool ret = false;
+
+	fd1 = open(file1, O_RDONLY);
+	if (fd1 < 0)
+		return ret;
+
+	fd2 = open(file2, O_RDONLY);
+	if (fd2 < 0)
+		goto close1;
+
+	ret = fstat(fd1, &st1);
+	if (ret)
+		goto close2;
+	ret = fstat(fd2, &st2);
+	if (ret)
+		goto close2;
+
+	if (st1.st_size != st2.st_size)
+		goto close2;
+
+	map1 = mmap(NULL, st1.st_size, PROT_READ, MAP_PRIVATE, fd1, 0);
+	if (map1 == MAP_FAILED)
+		goto close2;
+
+	map2 = mmap(NULL, st2.st_size, PROT_READ, MAP_PRIVATE, fd2, 0);
+	if (map2 == MAP_FAILED)
+		goto close2;
+
+	if (bcmp(map1, map2, st1.st_size))
+		goto close2;
+
+	ret = true;
+close2:
+	close(fd2);
+close1:
+	close(fd1);
+
+	return ret;
+}
+
 /*
  * Create the parent directory of the given path.
  *
@@ -888,6 +935,13 @@ int conf_write(const char *name)
 	fclose(out);
 
 	if (*tmpname) {
+		if (is_same(name, tmpname)) {
+			conf_message("No change to %s", name);
+			unlink(tmpname);
+			sym_set_change_count(0);
+			return 0;
+		}
+
 		snprintf(oldname, sizeof(oldname), "%s.old", name);
 		rename(name, oldname);
 		if (rename(tmpname, name))
-- 
2.17.1
