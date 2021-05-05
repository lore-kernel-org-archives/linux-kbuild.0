Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AB6C433ED
	for <linux-kbuild@archiver.kernel.org>; Wed,  5 May 2021 03:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3922613AA
	for <linux-kbuild@archiver.kernel.org>; Wed,  5 May 2021 03:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhEEDgf (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 4 May 2021 23:36:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:28227 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230454AbhEEDgf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 23:36:35 -0400
IronPort-SDR: rySuoIo4EzGUOZSCYM9DSJLBWtiETTXncnGQOvMKUDTW8+Hth/wN/HELVEEQzoDB8fHUGGPoF6
 RC/hNMlkoxQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="198181753"
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; 
   d="scan'208";a="198181753"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 20:35:39 -0700
IronPort-SDR: W+dZiJePLcSkpi0oUkXUtKqMUekRTVeKJVl/WBkwSjI+jRFmyKfORDy1XipVFLIK9qJXzzRqB9
 5Zd3hgk99rYg==
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; 
   d="scan'208";a="429551968"
Received: from tassilo.jf.intel.com ([10.54.74.11])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 20:35:38 -0700
From:   Andi Kleen <ak@linux.intel.com>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
Subject: [PATCH] kbuild: Don't remove link-vmlinux temporary files on exit/signal
Date:   Tue,  4 May 2021 20:35:27 -0700
Message-Id: <20210505033527.1282488-1-ak@linux.intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Keep them around until they are cleaned up by make clean. This
uses a bit more disk space, but makes it easier to debug any
problems with the kernel link process.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/link-vmlinux.sh | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 7d112681f332..f4de4c97015b 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -320,20 +320,6 @@ cleanup()
 	rm -f .vmlinux.d
 }
 
-on_exit()
-{
-	if [ $? -ne 0 ]; then
-		cleanup
-	fi
-}
-trap on_exit EXIT
-
-on_signals()
-{
-	exit 1
-}
-trap on_signals HUP INT QUIT TERM
-
 # Use "make V=1" to debug this script
 case "${KBUILD_VERBOSE}" in
 *1*)
-- 
2.25.4

