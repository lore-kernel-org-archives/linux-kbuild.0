Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:36593 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932111AbbLGVZv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Dec 2015 16:25:51 -0500
From: Tom Rini <trini@konsulko.com>
Subject: [PATCH] kbuild: fixdep: Check fstat(2) return value
Date: Mon,  7 Dec 2015 16:26:08 -0500
Message-Id: <1449523568-31084-1-git-send-email-trini@konsulko.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Coverity has recently added a check that will find when we don't check
the return code from fstat(2).  Copy/paste the checking logic that
print_deps() has with an appropriate re-wording of the perror() message.

Cc: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tom Rini <trini@konsulko.com>

---
Note that I don't have a CID here was I found this in U-Boot and the
kernel hasn't yet done a build with this test being enabled.
---
 scripts/basic/fixdep.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index c68fd61..e3d9678 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -274,7 +274,11 @@ static void do_config_file(const char *filename)
 		perror(filename);
 		exit(2);
 	}
-	fstat(fd, &st);
+	if (fstat(fd, &st) < 0) {
+		fprintf(stderr, "fixdep: error fstat'ing config file: ");
+		perror(filename);
+		exit(2);
+	}
 	if (st.st_size == 0) {
 		close(fd);
 		return;
-- 
1.7.9.5

