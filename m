Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:42482 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751256AbeFWUts (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jun 2018 16:49:48 -0400
Received: by mail-wr0-f196.google.com with SMTP id w10-v6so9820475wrk.9
        for <linux-kbuild@vger.kernel.org>; Sat, 23 Jun 2018 13:49:48 -0700 (PDT)
From: Alexander Ploumistos <alexpl@fedoraproject.org>
Subject: [PATCH] kconfig: loop boundary condition fix
Date: Sat, 23 Jun 2018 22:49:04 +0200
Message-Id: <20180623204904.11378-1-alexpl@fedoraproject.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: linux-kbuild@vger.kernel.org, labbott@redhat.com, Jerry James <loganjerry@gmail.com>, Alexander Ploumistos <alexpl@fedoraproject.org>

From: Jerry James <loganjerry@gmail.com>

If buf[-1] just happens to hold the byte 0x0A, then nread can wrap around
to (size_t)-1, leading to invalid memory accesses.

This has caused segmentation faults when trying to build the latest
kernel snapshots for i686 in Fedora:
https://bugzilla.redhat.com/show_bug.cgi?id=1592374

Signed-off-by: Jerry James <loganjerry@gmail.com>
[alexpl@fedoraproject.org: reformatted patch for submission]
Signed-off-by: Alexander Ploumistos <alexpl@fedoraproject.org>
---
 scripts/kconfig/preprocess.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 65da87fce907..5ca2df790d3c 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -156,7 +156,7 @@ static char *do_shell(int argc, char *argv[])
 		nread--;
 
 	/* remove trailing new lines */
-	while (buf[nread - 1] == '\n')
+	while (nread > 0 && buf[nread - 1] == '\n')
 		nread--;
 
 	buf[nread] = 0;
-- 
2.17.1

