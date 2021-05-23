Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FDCC47080
	for <linux-kbuild@archiver.kernel.org>; Sun, 23 May 2021 03:15:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E496960241
	for <linux-kbuild@archiver.kernel.org>; Sun, 23 May 2021 03:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbhEWDRP (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 22 May 2021 23:17:15 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:31289 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbhEWDRO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 May 2021 23:17:14 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 14N3EZeo018750;
        Sun, 23 May 2021 12:14:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 14N3EZeo018750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621739677;
        bh=QdjepPEIC8eRn6vWK34ZiH0vZVmkSJ83PvwaiEEfVng=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DlbjRgM/6DJrAAa+ojS5RLz9Qdi0YDtqxqN2bjrPtevXW9/BERSy0a5LN+xQAFnw9
         xbUTybOh2gsr87Dcb81qfE2vASBKVn0/ruCbbJzJvYgbMn4WwHC/lUj4/MAZ2gr7yg
         LxTIaBChQ5Ld6LfA0WmwmQ8LmMSTdaXCswLYd+TIuqPwvjBcw6Ku6fnJ4sZpe8rHnl
         XC1aQoggN/qPA7oOiMcTih44rTqSD5+H6xo3FF5YHEHtMTF7r8E3MKRVsGUseDWIzK
         B4H+TlyguWIkX4pQIkJkMfki6RnplFfLyOspNNRzJ5CZPp+dpIidoFGRKI4BFFoxVN
         WkcV+PYiaeang==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Maennich <maennich@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] scripts/setlocalversion: remove workaround for old make-kpkg
Date:   Sun, 23 May 2021 12:14:25 +0900
Message-Id: <20210523031428.164186-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210523031428.164186-1-masahiroy@kernel.org>
References: <20210523031428.164186-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit b052ce4c840e ("kbuild: fix false positive -dirty
tag caused by make-kpkg").

If I understand correctly, it occurred in very old versions of
make-kpkg. When I tried a newer version, make-kpkg did not touch
scripts/package/Makefile.

Anyway, Debian uses 'make deb-pkg' instead of make-kpkg these days.

Debian handbook [1] mentions it as "the good old days":
 "CULTURE The good old days of kernel-package

  Before the Linux build system gained the ability to build proper
  Debian packages, the recommended way to build such packages was to
  use make-kpkg from the kernel-package package."

[1]: https://debian-handbook.info/browse/stable/sect.kernel-compilation.html

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/setlocalversion | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 879cba956e60..f3084d6bbb22 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -88,7 +88,7 @@ scm_version()
 		if {
 			git --no-optional-locks status -uno --porcelain 2>/dev/null ||
 			git diff-index --name-only HEAD
-		} | grep -qvE '^(.. )?scripts/package'; then
+		} | read dummy; then
 			printf '%s' -dirty
 		fi
 	fi
-- 
2.27.0

