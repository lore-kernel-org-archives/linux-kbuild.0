Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.polytechnique.org ([129.104.30.34]:45542 "EHLO
	mx1.polytechnique.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755244AbbKRSQE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Nov 2015 13:16:04 -0500
From: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Subject: [PATCH] fixdep: constify strrcmp arguments
Date: Wed, 18 Nov 2015 19:07:15 +0100
Message-Id: <1447870035-14677-1-git-send-email-nicolas.iooss_linux@m4x.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nicolas Iooss <nicolas.iooss_linux@m4x.org>

strrcmp only performs read access to the memory addressed by its
arguments so make them const pointers.

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
---
 scripts/basic/fixdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index c68fd61fdc42..5b327c67a828 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -251,7 +251,7 @@ static void parse_config_file(const char *map, size_t len)
 }
 
 /* test is s ends in sub */
-static int strrcmp(char *s, char *sub)
+static int strrcmp(const char *s, const char *sub)
 {
 	int slen = strlen(s);
 	int sublen = strlen(sub);
-- 
2.6.2

