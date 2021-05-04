Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC2FC433B4
	for <linux-kbuild@archiver.kernel.org>; Tue,  4 May 2021 10:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1389611C0
	for <linux-kbuild@archiver.kernel.org>; Tue,  4 May 2021 10:11:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhEDKMX (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 4 May 2021 06:12:23 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:49887 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhEDKMV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 06:12:21 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 144AB1SV020452;
        Tue, 4 May 2021 19:11:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 144AB1SV020452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620123062;
        bh=54WsyuLRcprMOYMa9VBbVKAbYlOXXv352Rr19KXZZi4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=z+0pD278dDvF1zGoJUREfMh1U8NXbHAfpNT88jxDdZ+GVSqY/eo8IEzTJtX2b99m3
         VMGXYUyZhLf/3N4d4AOiXsRAGDathDL1ihpbIosXVmy4HvKDcg8bOTBIvBPgsvb4fC
         Y9wwUrvZm+1GGAU7PC8oQSEQYSeKk9uK8PjjxoR1/SUJsvgZsuu1G//ocfmSWS34g5
         Yeq0zjsFxCXekq0Y9AI5NatO/AfFSkdERCaxz5CmgNExEiZDiB54NRMYYVEhyQquwS
         gkBjAYJJkJmnyEm+aq3eQOSthi0/yyl32bxWitXg9/1V4PG6n+8jbaypgjgi0uGkcp
         qJaxqrhATSWXw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kbuild: make distclean remove tag files in sub-directories
Date:   Tue,  4 May 2021 19:10:57 +0900
Message-Id: <20210504101058.96498-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210504101058.96498-1-masahiroy@kernel.org>
References: <20210504101058.96498-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'make tags' and friends create tag files in the top directory, but
people may manually create tag files in sub-directories.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 560408808c33..2cbf68dc40b7 100644
--- a/Makefile
+++ b/Makefile
@@ -1511,9 +1511,6 @@ MRPROPER_FILES += include/config include/generated          \
 		  signing_key.x509.signer vmlinux-gdb.py \
 		  *.spec
 
-# Directories & files removed with 'make distclean'
-DISTCLEAN_FILES += tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS
-
 # clean - Delete most, but leave enough to build external modules
 #
 clean: rm-files := $(CLEAN_FILES)
@@ -1540,16 +1537,14 @@ mrproper: clean $(mrproper-dirs)
 
 # distclean
 #
-distclean: rm-files := $(wildcard $(DISTCLEAN_FILES))
-
 PHONY += distclean
 
 distclean: mrproper
-	$(call cmd,rmfiles)
 	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.orig' -o -name '*.rej' -o -name '*~' \
 		-o -name '*.bak' -o -name '#*#' -o -name '*%' \
-		-o -name 'core' \) \
+		-o -name 'core' -o -name tags -o -name TAGS -o -name 'cscope*' \
+		-o -name GPATH -o -name GRTAGS -o -name GSYMS -o -name GTAGS \) \
 		-type f -print | xargs rm -f
 
 
-- 
2.27.0

