Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:41173 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752045AbdLNT4m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Dec 2017 14:56:42 -0500
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] fixdep: free memory on second error path of do_config_file
Date: Thu, 14 Dec 2017 20:54:10 +0100
Message-Id: <1513281250-9186-2-git-send-email-lukas.bulwahn@gmail.com>
In-Reply-To: <1513281250-9186-1-git-send-email-lukas.bulwahn@gmail.com>
References: <1513281250-9186-1-git-send-email-lukas.bulwahn@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Alexey Dobriyan <adobriyan@gmail.com>, lukas.bulwahn@gmail.com, sil2review@lists.osadl.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit dee81e988674 ("fixdep: faster CONFIG_ search") introduces the memory
leak when `map = mmap(...)` was replaced with `map = malloc(...)` and
`read(fd, map, ...)`. It introduces a new second error path, which does not
free the allocated memory for `map`. We now correct that behavior and free
`map` before the do_config_file() function returns.

Facebook's static analysis tool Infer (http://fbinfer.com) found this
memory leak:

  scripts/basic/fixdep.c:297: error: MEMORY_LEAK
    memory dynamically allocated by call to `malloc()` at line 290, \
    column 8 is not reachable after line 297, column 3.

Fixes: dee81e988674 ("fixdep: faster CONFIG_ search")

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 scripts/basic/fixdep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index bbf62cb..131c450 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -296,6 +296,7 @@ static void do_config_file(const char *filename)
 	if (read(fd, map, st.st_size) != st.st_size) {
 		perror("fixdep: read");
 		close(fd);
+		free(map);
 		return;
 	}
 	map[st.st_size] = '\0';
-- 
2.7.4

