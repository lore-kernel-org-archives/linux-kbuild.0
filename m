Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5C0C433ED
	for <linux-kbuild@archiver.kernel.org>; Thu,  8 Apr 2021 21:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E000861055
	for <linux-kbuild@archiver.kernel.org>; Thu,  8 Apr 2021 21:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbhDHVcG (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 8 Apr 2021 17:32:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:38042 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232236AbhDHVcD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 17:32:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id EF31DB034;
        Thu,  8 Apr 2021 21:31:50 +0000 (UTC)
From:   Michal Suchanek <msuchanek@suse.de>
To:     linux-kbuild@vger.kernel.org
Cc:     Michal Suchanek <msuchanek@suse.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MAINTAINERS: add pattern for dummy-tools.
Date:   Thu,  8 Apr 2021 23:31:40 +0200
Message-Id: <04385380bee4847a8541c35418ff266b82d9cc13.1617917438.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
References: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/get_maintainer.pl does not find a maintainer for new files
otherwise.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c80ad735b384..ce631ec44e1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9690,6 +9690,7 @@ F:	scripts/*vmlinux*
 F:	scripts/Kbuild*
 F:	scripts/Makefile*
 F:	scripts/basic/
+F:	scripts/dummy-tools/
 F:	scripts/mk*
 F:	scripts/mod/
 F:	scripts/package/
-- 
2.26.2

