Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87878C433DB
	for <linux-kbuild@archiver.kernel.org>; Sat, 27 Feb 2021 05:36:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4197764EE7
	for <linux-kbuild@archiver.kernel.org>; Sat, 27 Feb 2021 05:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhB0FgL (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 27 Feb 2021 00:36:11 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:16482 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhB0FgK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 00:36:10 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 11R5YvAh024876;
        Sat, 27 Feb 2021 14:34:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 11R5YvAh024876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614404097;
        bh=9HaYoJf3OLpRj0pkBEUuDMLFstJ3yNlW8MBD3cBUS2E=;
        h=From:To:Cc:Subject:Date:From;
        b=MboQKAjGHsy/QnOTAPnqgsJu1JK62AEw9rHzMmrQZ1TzQZw+fWTw34mEYS/zooDQZ
         reJI/EVY5Dwg9AUXjX+AT1Lpbc3OP9PztdLuxrxkUSfqmem9M/CHCEtdy15hCCDvTI
         LyTBbaBLc6BpmQ2hoKgt/tnBW8PitqX0VgCWXRb6iNHOFr+pT9gqhsC2nR/qMAMblN
         2he8X2WX6v+5wi2igElsGkMExmSgicllrPSwFGJ4Vt4YnhZG200sFh0DVV90YP6D3H
         7jacqk2haVZZKoLdPSCf/NzK75BUwXtlpsU8PYEyKDD3LYjsepWs/IES272bmCxupo
         815Rid6Vf/zgg==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-ia64@vger.kernel.org
Subject: [PATCH] ia64: remove redundant READELF from arch/ia64/Makefile
Date:   Sat, 27 Feb 2021 14:34:50 +0900
Message-Id: <20210227053450.4073222-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

READELF is defined by the top Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/ia64/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 3e9da5e6c3bd..467b7e7f967c 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -14,7 +14,6 @@
 KBUILD_DEFCONFIG := generic_defconfig
 
 NM := $(CROSS_COMPILE)nm -B
-READELF := $(CROSS_COMPILE)readelf
 
 CHECKFLAGS	+= -D__ia64=1 -D__ia64__=1 -D_LP64 -D__LP64__
 
-- 
2.27.0

