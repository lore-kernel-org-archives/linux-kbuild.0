Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:59623 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab0KDEUs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Nov 2010 00:20:48 -0400
Received: by gxk23 with SMTP id 23so1067316gxk.19
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Nov 2010 21:20:47 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kconfig: the day kconfig warns about "select"-abuse has come
Date: Thu,  4 Nov 2010 00:16:08 -0400
Message-Id: <1288844168-21539-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>, catalin.marinas@arm.com

CC: catalin.marinas@arm.com
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 Documentation/kbuild/kconfig-language.txt |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index 2fe93ca..5b9b1be 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -112,7 +112,6 @@ applicable everywhere (see syntax).
 	(no prompts anywhere) and for symbols with no dependencies.
 	That will limit the usefulness but on the other hand avoid
 	the illegal configurations all over.
-	kconfig should one day warn about such things.
 
 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
   This allows to limit the range of possible input values for int
-- 
1.7.2.30.gc37d7.dirty

