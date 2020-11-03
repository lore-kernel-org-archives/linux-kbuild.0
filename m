Return-Path: <SRS0=BGTV=EJ=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1DDC2D0A3
	for <linux-kbuild@archiver.kernel.org>; Tue,  3 Nov 2020 11:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F12FC216C4
	for <linux-kbuild@archiver.kernel.org>; Tue,  3 Nov 2020 11:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbgKCLsc (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 3 Nov 2020 06:48:32 -0500
Received: from m9785.mail.qiye.163.com ([220.181.97.85]:15740 "EHLO
        m9785.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbgKCLsc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 06:48:32 -0500
X-Greylist: delayed 16796 seconds by postgrey-1.27 at vger.kernel.org; Tue, 03 Nov 2020 06:48:29 EST
Received: from localhost (unknown [117.48.120.186])
        by m9785.mail.qiye.163.com (Hmail) with ESMTPA id 40A445C1BB5;
        Tue,  3 Nov 2020 13:44:35 +0800 (CST)
From:   WANG Chao <chao.wang@ucloud.cn>
To:     linux-kernel@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: add extra-y to targets-for-modules
Date:   Tue,  3 Nov 2020 13:44:25 +0800
Message-Id: <20201103054425.59251-1-chao.wang@ucloud.cn>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSUI3V1ktWUFJV1kPCR
        oVCBIfWUFZGh9LGEtMQ0sfGkkYVkpNS09IQ0lJTE5ISU9VGRETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hOSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORA6Fhw*Fz4BHUM*CkMUPFYL
        DTkaCg9VSlVKTUtPSENJSUxOT0xJVTMWGhIXVRgTGhRVDBoVHDsOGBcUDh9VGBVFWVdZEgtZQVlK
        SkxVT0NVSklLVUpDTVlXWQgBWUFKTU1LNwY+
X-HM-Tid: 0a758ca2b6c62087kuqy40a445c1bb5
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

extra-y target doesn't build for 'make M=...' since commit 6212804f2d78
("kbuild: do not create built-in objects for external module builds").

This especially breaks kpatch, which is using 'extra-y := kpatch.lds'
and 'make M=...' to build livepatch patch module.

Add extra-y to targets-for-modules so that such kind of build works
properly.

Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ae647379b579..0113a042d643 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -86,7 +86,7 @@ ifdef need-builtin
 targets-for-builtin += $(obj)/built-in.a
 endif
 
-targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
+targets-for-modules := $(extra-y) $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
 
 ifdef need-modorder
 targets-for-modules += $(obj)/modules.order
-- 
2.29.1

