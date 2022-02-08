Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56657C433F5
	for <linux-kbuild@archiver.kernel.org>; Tue,  8 Feb 2022 06:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbiBHG1B (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 8 Feb 2022 01:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiBHG1B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Feb 2022 01:27:01 -0500
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001DEC0401EF;
        Mon,  7 Feb 2022 22:26:59 -0800 (PST)
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 2186QIjB025433;
        Tue, 8 Feb 2022 15:26:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 2186QIjB025433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1644301578;
        bh=iCaclbqK1/se8Ep1O/E9eiQSs3CzfYrVGAcsLtLoA9A=;
        h=From:To:Cc:Subject:Date:From;
        b=jvFtohaSHOmo7GU72OLBh+TgSxfhk8L6oaC2i0p4oxvLCH9/IWtaqwMtNJ7FA79UV
         krkGgR+I18hlOzhCkyocbfIMsJl1tDOkHmkJABd2079oFeuFg+265W84ghX/ccRZhU
         UlgJqD/ohuWyHoBRg+8N1fYe9c17fhPzDDko/a+oOnQIyvg4gwv/Zr0ac6AbmRHjGh
         7CsgvHCA+SRf+BRFH/0dfFy1V49yX5fkMLHGmmHi3LAwQQxCSebZjJE+4U0Nm8fGBB
         eMDy239uKgR1GAO23WM7fz1QNYwCy05u6ytShyokHNsZcJS2xQKdUAy4n7ZO7f/n6i
         3fWc+MPJ7mcCA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Ryan Cai <ycaibb@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: fix missing fclose() on error paths
Date:   Tue,  8 Feb 2022 15:26:18 +0900
Message-Id: <20220208062618.1869210-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The file is not closed when ferror() fails.

Fixes: 00d674cb3536 ("kconfig: refactor conf_write_dep()")
Fixes: 57ddd07c4560 ("kconfig: refactor conf_write_autoconf()")
Reported-by: Ryan Cai <ycaibb@gmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 59717be31210..16897cb8cefd 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -979,10 +979,10 @@ static int conf_write_autoconf_cmd(const char *autoconf_name)
 
 	fprintf(out, "\n$(deps_config): ;\n");
 
-	if (ferror(out)) /* error check for all fprintf() calls */
-		return -1;
-
+	ret = ferror(out); /* error check for all fprintf() calls */
 	fclose(out);
+	if (ret)
+		return -1;
 
 	if (rename(tmp, name)) {
 		perror("rename");
@@ -1093,10 +1093,10 @@ static int __conf_write_autoconf(const char *filename,
 			print_symbol(file, sym);
 
 	/* check possible errors in conf_write_heading() and print_symbol() */
-	if (ferror(file))
-		return -1;
-
+	ret = ferror(file);
 	fclose(file);
+	if (ret)
+		return -1;
 
 	if (rename(tmp, filename)) {
 		perror("rename");
-- 
2.32.0

