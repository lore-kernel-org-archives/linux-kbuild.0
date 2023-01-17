Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9709C67871
	for <linux-kbuild@archiver.kernel.org>; Tue, 17 Jan 2023 10:00:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236265AbjAQKAN (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 17 Jan 2023 05:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235873AbjAQKAL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 05:00:11 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6B12BEEC;
        Tue, 17 Jan 2023 02:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673949610; x=1705485610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rdRNudDVQjfVZrAN9l66sPJH87XwseqgBHKR+TSWbOU=;
  b=nkrXRYrY3zvBXEcgv2h1OZZKCeGO3qFvFXdYSm9ivJncrFmTVnKfmbsW
   /Fo05wJkhIq+WXZaGoZPwD66ossCsbLHfvhLzNuQF7RKQom32h+mgmcG3
   7inheshnVAJ+Ho1gD6jdftTKu3l/2PXiND4MN6AJh/QkbuwOnSX9eqKPF
   ObMYaxrZQv9OEdPmug46bvVF9ibEWoEllS+yABrz1+eSLCLMxz58aJpKr
   vhxWebC+KGHnn0tMZDc9/dWopki5g5uKjUh9SVHowR62jnhpcemzS+6Vz
   +k2hpHGLofeDarot1gFPdOHSJtj1CUHjSRYLocvhHSMBGGlF52NUu5s6j
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325933224"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="325933224"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="904595561"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="904595561"
Received: from dmcmanus.ger.corp.intel.com (HELO localhost) ([10.252.27.166])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:08 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     jani.nikula@intel.com
Subject: [PATCH 2/6] docs/kbuild/makefiles: fix header underline
Date:   Tue, 17 Jan 2023 11:59:42 +0200
Message-Id: <20230117095946.2042832-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117095946.2042832-1-jani.nikula@intel.com>
References: <20230117095946.2042832-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The "Kbuild syntax for exported headers" section should not be under
"Architecture Makefiles" in hierarchy. Bump the header underline from
"-" to "=".

Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/kbuild/makefiles.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 59085ffbe99a..014dd97181dd 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1509,7 +1509,7 @@ When kbuild executes, the following steps are followed (roughly):
 	the linked vmlinux file.
 
 8 Kbuild syntax for exported headers
-------------------------------------
+====================================
 
 The kernel includes a set of headers that is exported to userspace.
 Many headers can be exported as-is but other headers require a
-- 
2.34.1

