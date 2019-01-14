Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:57704 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfANNvs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jan 2019 08:51:48 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/12] selftests: gpio-mockup-chardev: Check asprintf() for error
Date: Mon, 14 Jan 2019 14:51:33 +0100
Message-Id: <20190114135144.26096-2-geert+renesas@glider.be>
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuah@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

With gcc 7.3.0:

    gpio-mockup-chardev.c: In function ‘get_debugfs’:
    gpio-mockup-chardev.c:62:3: warning: ignoring return value of ‘asprintf’, declared with attribute warn_unused_result [-Wunused-result]
       asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Handle asprintf() failures to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tools/testing/selftests/gpio/gpio-mockup-chardev.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
index f8d468f54e986dd0..aaa1e9f083c37215 100644
--- a/tools/testing/selftests/gpio/gpio-mockup-chardev.c
+++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
@@ -37,7 +37,7 @@ static int get_debugfs(char **path)
 	struct libmnt_table *tb;
 	struct libmnt_iter *itr = NULL;
 	struct libmnt_fs *fs;
-	int found = 0;
+	int found = 0, ret;
 
 	cxt = mnt_new_context();
 	if (!cxt)
@@ -58,8 +58,11 @@ static int get_debugfs(char **path)
 			break;
 		}
 	}
-	if (found)
-		asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
+	if (found) {
+		ret = asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
+		if (ret < 0)
+			err(EXIT_FAILURE, "failed to format string");
+	}
 
 	mnt_free_iter(itr);
 	mnt_free_context(cxt);
-- 
2.17.1
