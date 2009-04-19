Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fmmailgate01.web.de ([217.72.192.221]:53342 "EHLO
	fmmailgate01.web.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758312AbZDSNlV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Apr 2009 09:41:21 -0400
From: Markus Heidelberg <markus.heidelberg@web.de>
Subject: [PATCH 04/10] gitignore: ignore Kconfig i18n files
Date: Sun, 19 Apr 2009 15:41:21 +0200
Message-Id: <1240148487-27584-5-git-send-email-markus.heidelberg@web.de>
In-Reply-To: <1240148487-27584-1-git-send-email-markus.heidelberg@web.de>
References: <1240148487-27584-1-git-send-email-markus.heidelberg@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Heidelberg <markus.heidelberg@web.de>


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 scripts/kconfig/.gitignore |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index b49584c..01e185f 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -8,6 +8,8 @@ lex.*.c
 zconf.hash.c
 *.moc
 lkc_defs.h
+gconf.glade.h
+*.pot
 
 #
 # configuration programs
-- 
1.6.3.rc1.24.g467d50

