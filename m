Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:40964 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752433AbdLUTKs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Dec 2017 14:10:48 -0500
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] fixdep: exit with error code in error branches of do_config_file()
Date: Thu, 21 Dec 2017 20:10:29 +0100
Message-Id: <1513883429-9527-1-git-send-email-lukas.bulwahn@gmail.com>
In-Reply-To: <1513801623-19069-1-git-send-email-lukas.bulwahn@gmail.com>
References: <1513801623-19069-1-git-send-email-lukas.bulwahn@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: lukas.bulwahn@gmail.com, Nicholas Mc Guire <der.herr@hofr.at>, sil2review@lists.osadl.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

do_config_file() should exit with an error code, and not return if it fails
as then the error in do_config_file() would go unnoticed in the current
code and allow the build to continue. The exit with error code will make
the build fail in those very exceptional cases. If this occurs, this
actually indicates a deeper problem in the execution of the kernel build
process.

Now, that the function exists, we do not explicitly free memory and close
the file handlers in do_config_file(), as this is covered by exit().

This issue in the fixdep script was introduced with its initial
implementation back in 2002 by the original author Kai Germaschewski with
this commit 04bd72170653 ("kbuild: Make dependencies at compile time").

This issue was identified during the review of a previous patch that
intended to address a memory leak detected by a static analysis tool.

Link: https://lkml.org/lkml/2017/12/14/736

Fixes: 04bd72170653 ("kbuild: Make dependencies at compile time")
Suggested-by: Nicholas Mc Guire <der.herr@hofr.at>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
compile tested on top of next-20171220 with clang and gcc
Change in v2:
  - no code change; only include proper Fixes tag and explain it

 scripts/basic/fixdep.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index bbf62cb..4274610 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -284,19 +284,18 @@ static void do_config_file(const char *filename)
 		exit(2);
 	}
 	if (st.st_size == 0) {
-		close(fd);
-		return;
+		fprintf(stderr, "fixdep: error empty file config file: ");
+		perror(filename);
+		exit(2);
 	}
 	map = malloc(st.st_size + 1);
 	if (!map) {
 		perror("fixdep: malloc");
-		close(fd);
-		return;
+		exit(2);
 	}
 	if (read(fd, map, st.st_size) != st.st_size) {
 		perror("fixdep: read");
-		close(fd);
-		return;
+		exit(2);
 	}
 	map[st.st_size] = '\0';
 	close(fd);
-- 
2.7.4

