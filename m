Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FD7C433B4
	for <linux-kbuild@archiver.kernel.org>; Sat, 17 Apr 2021 14:51:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D03D9610CB
	for <linux-kbuild@archiver.kernel.org>; Sat, 17 Apr 2021 14:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236299AbhDQOvj (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 17 Apr 2021 10:51:39 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:23577 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236187AbhDQOvi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 10:51:38 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 13HEodoG021728;
        Sat, 17 Apr 2021 23:50:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13HEodoG021728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618671040;
        bh=z+KixtNoXo8OwxfOqNHWb8056WQaLVyRZ1QNk5mIZjk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mJx38aVq5f8vkpGtfhLTlN15nB5D589fz4C1paug50waAKIUJ05WeSDEO/ru2sisH
         D9ApR+5PAGwKx6PRKRt4FIfaGvU+MBIkn1MRIvx5SujjPDFF9ZUwqIDl6zL16tqkc5
         4J/8zgUDph6AiHmrW8EofF0IQTk9E9oySeuqPl+bOOvkhcrwlAXKpValzxekpDIWpo
         /AX2Ys76+FJvbmKXr9QMSr1SiVb26OAIywbl8FJf4OYlfZGsaKBOMnS5y2i8RZ8yTh
         Zgp+xvQef/5b9nKh7opNPEaIyRsFVSwZay7NmqfVDBeYp0UxnrtyJ+7T0L6c+CuYS1
         YI1FuTk7jVOqw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: gconf: remove unused code
Date:   Sat, 17 Apr 2021 23:50:37 +0900
Message-Id: <20210417145037.349822-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210417145037.349822-1-masahiroy@kernel.org>
References: <20210417145037.349822-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Remove the unused <config.h> inclusion, and commented out lines.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 5527482c3077..7698eea6fb6e 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -3,10 +3,6 @@
  * Copyright (C) 2002-2003 Romain Lievin <roms@tilp.info>
  */
 
-#ifdef HAVE_CONFIG_H
-#  include <config.h>
-#endif
-
 #include <stdlib.h>
 #include "lkc.h"
 #include "images.h"
@@ -1452,9 +1448,6 @@ int main(int ac, char *av[])
 	gtk_init(&ac, &av);
 	glade_init();
 
-	//add_pixmap_directory (PACKAGE_DATA_DIR "/" PACKAGE "/pixmaps");
-	//add_pixmap_directory (PACKAGE_SOURCE_DIR "/pixmaps");
-
 	/* Determine GUI path */
 	env = getenv(SRCTREE);
 	if (env)
-- 
2.27.0

