Return-Path: <SRS0=/aPn=CH=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BF5C433E7
	for <linux-kbuild@archiver.kernel.org>; Sat, 29 Aug 2020 08:15:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4F80206C0
	for <linux-kbuild@archiver.kernel.org>; Sat, 29 Aug 2020 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598688954;
	bh=2xBQwpYW3C+U+EZAmz9aUgrw1B10SLVziDjYrMH3QBM=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=bAEx81wrmipx6cY7hz81CtVz96SYOJ4l+tlJvOrGGY0r8WOzevOr+8ZbGfTEdb4YM
	 hP0o57Vyq8R80EMrXiF54GVlIdm7zaj6XGIQ6+pJ0K1W3lffQ/V7dhyuDKVcoDgSFB
	 Vezq0BcNYrU+i8XIlAfQL4en/3oLo3s3ot4bB3PM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbgH2IPt (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 29 Aug 2020 04:15:49 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47525 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgH2IOz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:14:55 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfh014307;
        Sat, 29 Aug 2020 17:14:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfh014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688861;
        bh=rnMeFxtUozgRoWaZOL+eXZBgvS1kKsvPqvmSLOem0ZM=;
        h=From:To:Cc:Subject:Date:From;
        b=D8kMxkhPZnYAOPqqTCXoj2ogevhLJAt4RKNqt9a++veTajLxSbTL+PRKQfuXG/SjU
         RWDP8EOoFdIqg5c81atNI0kO+h0WBnAxfLO/AUV5nSgcagvKxYAIj3mKYP+TR6szEo
         J5kG5569QItVGN0vxuozLCACK/2Mwrj4NPVn0qoFRB6hmpzU0+i7Mb1SkYrtIR9u9M
         y2G5JkVje/an3rusIUBE4/cX+e+dgRkdAtDwE0YEjzDiJd+/Fp8R0HLWnNvr0zf9DA
         OZkx1nOxDbLZ1WlpwRAgulxnQv2pIfzZcBwjT5I5trxjJC7PvwLT3HxSzall05QmTR
         xke13ZVWkWNXA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] kconfig: qconf: reformat the intro message
Date:   Sat, 29 Aug 2020 17:14:07 +0900
Message-Id: <20200829081417.725978-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The introduction message displayed by 'Help -> Introduction' does not
look nice due to excessive new lines.

Reformat the message.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 8638785328a7..c40e37656f3f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1831,17 +1831,24 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 
 void ConfigMainWindow::showIntro(void)
 {
-	static const QString str = "Welcome to the qconf graphical configuration tool.\n\n"
-		"For each option, a blank box indicates the feature is disabled, a check\n"
-		"indicates it is enabled, and a dot indicates that it is to be compiled\n"
-		"as a module.  Clicking on the box will cycle through the three states.\n\n"
-		"If you do not see an option (e.g., a device driver) that you believe\n"
-		"should be present, try turning on Show All Options under the Options menu.\n"
-		"Although there is no cross reference yet to help you figure out what other\n"
-		"options must be enabled to support the option you are interested in, you can\n"
-		"still view the help of a grayed-out option.\n\n"
-		"Toggling Show Debug Info under the Options menu will show the dependencies,\n"
-		"which you can then match by examining other options.\n\n";
+	static const QString str =
+		"Welcome to the qconf graphical configuration tool.\n\n"
+
+		"For each option, a blank box indicates the feature is "
+		"disabled, a check indicates it is enabled, and a dot "
+		"indicates that it is to be compiled as a module. Clicking on "
+		"the box will cycle through the three states.\n\n"
+
+		"If you do not see an option (e.g., a device driver) that you "
+		"believe should be present, try turning on Show All Options "
+		"under the Options menu. Although there is no cross reference "
+		"yet to help you figure out what other options must be enabled "
+		"to support the option you are interested in, you can still "
+		"view the help of a grayed-out option.\n\n"
+
+		"Toggling Show Debug Info under the Options menu will show the "
+		"dependencies, which you can then match by examining other "
+		"options.\n\n";
 
 	QMessageBox::information(this, "qconf", str);
 }
-- 
2.25.1

