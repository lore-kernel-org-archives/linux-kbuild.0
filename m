Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f180.google.com ([209.85.208.180]:38102 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbeHORU0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 13:20:26 -0400
Received: by mail-lj1-f180.google.com with SMTP id p6-v6so1105275ljc.5
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Aug 2018 07:28:03 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 1/3] Kbuild: refactor fixdep to use getopt()
Date: Wed, 15 Aug 2018 16:27:47 +0200
Message-Id: <20180815142749.18804-2-linux@rasmusvillemoes.dk>
In-Reply-To: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
References: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org

As preparation for teaching an old dog a few new tricks.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 scripts/basic/fixdep.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 850966f3d602..666041841200 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -381,16 +381,23 @@ int main(int argc, char *argv[])
 	const char *depfile, *target, *cmdline;
 	int insert_extra_deps = 0;
 	void *buf;
+	int opt;
 
-	if (argc == 5 && !strcmp(argv[1], "-e")) {
-		insert_extra_deps = 1;
-		argv++;
-	} else if (argc != 4)
+	while ((opt = getopt(argc, argv, "e")) != -1) {
+		switch (opt) {
+		case 'e': insert_extra_deps = 1; break;
+		default: usage();
+		}
+	}
+	argc -= optind;
+	argv += optind;
+
+	if (argc != 3)
 		usage();
 
-	depfile = argv[1];
-	target = argv[2];
-	cmdline = argv[3];
+	depfile = argv[0];
+	target = argv[1];
+	cmdline = argv[2];
 
 	printf("cmd_%s := %s\n\n", target, cmdline);
 
-- 
2.16.4
