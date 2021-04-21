Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC262C433B4
	for <linux-kbuild@archiver.kernel.org>; Wed, 21 Apr 2021 00:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AEF561421
	for <linux-kbuild@archiver.kernel.org>; Wed, 21 Apr 2021 00:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234589AbhDUAVM (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 20 Apr 2021 20:21:12 -0400
Received: from mga01.intel.com ([192.55.52.88]:11916 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233863AbhDUAVM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Apr 2021 20:21:12 -0400
IronPort-SDR: O4Btpe9qGOSKD8ZzQNkQKH99YLZfXL6ZMyCRnBonnnPrabpcz4TQu0wv7fiuUOxUfXuLyDGCc8
 Oamqt7M/PETQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="216248982"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="216248982"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 17:20:40 -0700
IronPort-SDR: YW2p4TtdWIWo4Ii4nNuHPmRcvsiAXOMhmues9yx0Wm0minGTlc322vy4jyyAWqU25IreTVNBBN
 aX47KDk+fG5g==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="427302907"
Received: from otc-chromeosbuild-2.jf.intel.com ([10.54.30.90])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 17:20:39 -0700
From:   Patrick Waterlander <patrick.waterlander@intel.com>
To:     nathan.d.ciobanu@intel.com
Cc:     Patrick Waterlander <patrick.waterlander@intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] Makefile: Fix cross building
Date:   Tue, 20 Apr 2021 17:19:58 -0700
Message-Id: <20210421001958.24343-1-patrick.waterlander@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The native pkg-config is always called which may result in incorrect
flags and paths being passed to the cross compiler. Implement
$(CROSS_COMPILE)pkg-config to avoid this issue.

Signed-off-by: Patrick Waterlander <patrick.waterlander@intel.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bc19584fee59..9aa2073f68d6 100644
--- a/Makefile
+++ b/Makefile
@@ -462,6 +462,7 @@ LZMA		= lzma
 LZ4		= lz4c
 XZ		= xz
 ZSTD		= zstd
+PKG_CONFIG     ?= $(CROSS_COMPILE)pkg-config
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
@@ -1089,7 +1090,7 @@ mod_sign_cmd = true
 endif
 export mod_sign_cmd
 
-HOST_LIBELF_LIBS = $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
+HOST_LIBELF_LIBS = $(shell $(PKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)
 
 has_libelf = $(call try-run,\
                echo "int main() {}" | $(HOSTCC) -xc -o /dev/null $(HOST_LIBELF_LIBS) -,1,0)
-- 
2.17.1

