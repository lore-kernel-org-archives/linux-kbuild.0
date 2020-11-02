Return-Path: <SRS0=r4HO=EI=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBAAC00A89
	for <linux-kbuild@archiver.kernel.org>; Mon,  2 Nov 2020 12:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6365E223B0
	for <linux-kbuild@archiver.kernel.org>; Mon,  2 Nov 2020 12:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="ELkeWk8O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgKBMSp (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 2 Nov 2020 07:18:45 -0500
Received: from rcdn-iport-5.cisco.com ([173.37.86.76]:38576 "EHLO
        rcdn-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbgKBMSp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Nov 2020 07:18:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=934; q=dns/txt; s=iport;
  t=1604319524; x=1605529124;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OyOQHTIUgHMUuC830JRkqMxl1dIU1flTQWpGztg7O5I=;
  b=ELkeWk8OQYJSihkeNgKuj4irY6Hc79sERnEMB0qP+Qt6lLEYLDNy5BDd
   flwCY9eLSGt3j9d64wTiOIcrdakXbYFy1dMQvGB9YQ6gbmaljhHtNe1KI
   WBWcaFzs+I3nIlr+3WoYygY4MMdP64HJTmzHdHSimGuX/8yinGdYZX1jV
   Q=;
X-IronPort-AV: E=Sophos;i="5.77,444,1596499200"; 
   d="scan'208";a="566891500"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 02 Nov 2020 12:18:43 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
        by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 0A2CIf1c005826
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 2 Nov 2020 12:18:43 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
        id 9B757CBEF7B; Mon,  2 Nov 2020 04:08:53 -0800 (PST)
From:   Denys Zagorui <dzagorui@cisco.com>
To:     masahiroy@kernel.org
Cc:     michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, dzagorui@cisco.com
Subject: [PATCH v3] kbuild: use -fmacro-prefix-map for .S sources
Date:   Mon,  2 Nov 2020 04:08:53 -0800
Message-Id: <20201102120853.96855-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.19.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Follow-up to a73619a845d5 ("kbuild: use -fmacro-prefix-map to make
__FILE__ a relative path") commit. Assembler sources also use __FILE__
macro so this flag should be also apllied to that sources.

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ee2284a5cad2..81e480fc6805 100644
--- a/Makefile
+++ b/Makefile
@@ -946,7 +946,7 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
 KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
 
 # change __FILE__ to the relative path from the srctree
-KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 
 # ensure -fcf-protection is disabled when using retpoline as it is
 # incompatible with -mindirect-branch=thunk-extern
-- 
2.19.0.dirty

