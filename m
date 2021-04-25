Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80E3C433B4
	for <linux-kbuild@archiver.kernel.org>; Sun, 25 Apr 2021 21:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B1EB611ED
	for <linux-kbuild@archiver.kernel.org>; Sun, 25 Apr 2021 21:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhDYVgL (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 25 Apr 2021 17:36:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:19965 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231247AbhDYVgK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Apr 2021 17:36:10 -0400
IronPort-SDR: C9wZlz+giLrhhfGm2xGr6vM55QJejwhEoRwyJnoltvNfFs2tF7zUkQafVhNHBizv0BhJlZYmMC
 +kGbGj0qC4Iw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="176375312"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="176375312"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 14:35:30 -0700
IronPort-SDR: uCxCQzfAaScEtn9+ZqI6MQ8cs5Q39tJ9eFCnPUIbafrmpKzm3i8skq6KUrsh5eiBuEpHNEdasL
 yEroy6pUIBHw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="525507157"
Received: from tassilo.jf.intel.com ([10.54.74.11])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 14:35:30 -0700
From:   Andi Kleen <ak@linux.intel.com>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, Andi Kleen <andi@firstfloor.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: [PATCH] kbuild, link-vmlinux: Don't delete output files with make -i
Date:   Sun, 25 Apr 2021 14:35:21 -0700
Message-Id: <20210425213521.3159899-1-ak@linux.intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Andi Kleen <andi@firstfloor.org>

make -i is useful to see output files which normally get deleted on an
error.  Make this work with link-vmlinux.sh too. Don't delete the output
files on error when make -i is used.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/link-vmlinux.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 0e039a4cf2cb..a1a57f214c58 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -300,6 +300,11 @@ sorttable()
 # Delete output files in case of error
 cleanup()
 {
+	# don't delete for make -i
+	case "$MFLAGS" in
+	*-i*) return ;;
+	esac
+
 	rm -f .btf.*
 	rm -f .tmp_System.map
 	rm -f .tmp_initcalls.lds
-- 
2.25.4

