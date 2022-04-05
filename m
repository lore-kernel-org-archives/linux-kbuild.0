Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B1CC4332F
	for <linux-kbuild@archiver.kernel.org>; Wed,  6 Apr 2022 00:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445518AbiDFAmz (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 5 Apr 2022 20:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444216AbiDEPlC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Apr 2022 11:41:02 -0400
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9A99FC0;
        Tue,  5 Apr 2022 07:03:31 -0700 (PDT)
Received: from grover.. (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 235E2k8P021295;
        Tue, 5 Apr 2022 23:02:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 235E2k8P021295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1649167371;
        bh=14THH7OGjq9Th9kYojci8epMYGgACRtH/hVpWkrrFWI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AHRXWSvHIn/Itms1OHzLnWPnfTi6I6ES3+aHFhkhJubI1sS1fK3FasYxAuNHMLJrF
         38F+0OVJBLrIP2I5SdD9IRatQGXP97wfzqXYQdWLenhQHbuRrGf3CdVF7ILZnNrteW
         rBOamsiDr4mp+D6FXARE37JjaJZRwZDXKwst0g45RJZczTi7G2kmCPce/buFAY0BKy
         AB3vP1gDmM2TeOJLDcR/3smwqHJZ/+1QL7+XIXUwk6C9twrGiZRTB/o0GKWpvSX5j7
         jj8rY8Og4fpFXR1YTj2XfyUw+8005VX5j/IiHTpik52FNhFwrj3X9Y6kX3IzcMTrLT
         Dj2BKi9Jchreg==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2 07/10] kbuild: get rid of duplication in the first line of *.mod files
Date:   Tue,  5 Apr 2022 23:02:26 +0900
Message-Id: <20220405140229.2895394-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220405140229.2895394-1-masahiroy@kernel.org>
References: <20220405140229.2895394-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The first line of *.mod lists the object files that consist of the
module. This may contain duplication if the same object is added
multiple times, like this:

  obj-m := foo.o
  foo-$(CONFIG_FOO1_X) += foo1.o
  foo-$(CONFIG_FOO1_Y) += foo1.o
  foo-$(CONFIG_FOO2_X) += foo2.o
  foo-$(CONFIG_FOO2_Y) += foo2.o

This is probably not a big deal. As far as I know, the only small
problem is scripts/mod/sumversion.c parses the same file over again.
This can be avoided by adding $(sort ...). It has a side-effect that
sorts the objects alphabetically, but it is not a big deal, either.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new

 scripts/Makefile.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3ef2373f0a57..63625877aeae 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -307,8 +307,10 @@ $(obj)/%.prelink.o: $(obj)/%.o FORCE
 	$(call if_changed,cc_prelink_modules)
 endif
 
+multi-m-prereqs = $(sort $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)))
+
 cmd_mod = { \
-	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
+	echo $(if $(multi-m-prereqs), $(multi-m-prereqs), $(@:.mod=.o)); \
 	$(undefined_syms) echo; \
 	} > $@
 
-- 
2.32.0

