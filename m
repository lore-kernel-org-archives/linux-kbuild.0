Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:36425 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754443AbZFEXlN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 19:41:13 -0400
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 26/39] gitignore: ignore Kconfig i18n files
Date: Sat,  6 Jun 2009 01:42:44 +0200
Message-Id: <1244245377-17441-26-git-send-email-sam@ravnborg.org>
In-Reply-To: <20090605233720.GA13588@uranus.ravnborg.org>
References: <20090605233720.GA13588@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Markus Heidelberg <markus.heidelberg@web.de>, Sam Ravnborg <sam@ravnborg.org>

From: Markus Heidelberg <markus.heidelberg@web.de>

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
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
1.6.3.rc3.40.g75b44

