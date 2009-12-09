Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:43018 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752446AbZLILzO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Dec 2009 06:55:14 -0500
From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] gen_init_cpio: fixed fwrite warning
Date: Wed,  9 Dec 2009 06:55:19 -0500
Message-Id: <1260359719-15744-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org

On compilers with security warnings enabled by default, we get:

usr/gen_init_cpio.c: In function ‘cpio_mkfile’:
usr/gen_init_cpio.c:357: warning: ignoring return value of ‘fwrite’,
                                  declared with attribute warn_unused_result

So check the return value and handle errors accordingly.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 usr/gen_init_cpio.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 83b3dde..b2b3c2d 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -354,7 +354,10 @@ static int cpio_mkfile(const char *name, const char *location,
 		push_pad();
 
 		if (size) {
-			fwrite(filebuf, size, 1, stdout);
+			if (fwrite(filebuf, size, 1, stdout) != 1) {
+				fprintf(stderr, "writing filebuf failed\n");
+				goto error;
+			}
 			offset += size;
 			push_pad();
 		}
-- 
1.6.5.5

