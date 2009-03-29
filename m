Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:59874 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757397AbZC2NBv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Mar 2009 09:01:51 -0400
From: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] headerdep: fix option processing for -I
Date: Sun, 29 Mar 2009 15:01:47 +0200
Message-Id: <1238331707-23129-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.orglinux-kbuild@vger.kernel.org
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

-I takes an argument.  Without this change only a 1 is added to
@opt_include which is not helpful.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>

---
 scripts/headerdep.pl |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/headerdep.pl b/scripts/headerdep.pl
index 97399da..536408e 100755
--- a/scripts/headerdep.pl
+++ b/scripts/headerdep.pl
@@ -19,7 +19,7 @@ my $opt_graph;
 	version	=> \&version,
 
 	all	=> \$opt_all,
-	I	=> \@opt_include,
+	"I:s"	=> \@opt_include,
 	graph	=> \$opt_graph,
 );
 
-- 
tg: (5d80f8e..) t/misc/fix_include_opt_for_headerdep (depends on: linus/master)
