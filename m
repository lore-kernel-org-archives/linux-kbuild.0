Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fmmailgate02.web.de ([217.72.192.227]:46383 "EHLO
	fmmailgate02.web.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754853AbZEQXgs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 May 2009 19:36:48 -0400
From: Markus Heidelberg <markus.heidelberg@web.de>
Subject: [PATCH resend 04/10] gitignore: ignore Kconfig i18n files
Date: Mon, 18 May 2009 01:36:48 +0200
Message-Id: <1242603414-9267-5-git-send-email-markus.heidelberg@web.de>
In-Reply-To: <1242603414-9267-1-git-send-email-markus.heidelberg@web.de>
References: <1242603414-9267-1-git-send-email-markus.heidelberg@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Heidelberg <markus.heidelberg@web.de>


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 scripts/kconfig/.gitignore |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index b49584c..6a36a76 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -8,6 +8,9 @@ lex.*.c
 zconf.hash.c
 *.moc
 lkc_defs.h
+gconf.glade.h
+*.pot
+*.mo
 
 #
 # configuration programs
-- 
1.6.3.1.20.ga30f

