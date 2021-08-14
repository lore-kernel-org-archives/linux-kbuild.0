Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A18C432BE
	for <linux-kbuild@archiver.kernel.org>; Sat, 14 Aug 2021 23:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3CC860E9B
	for <linux-kbuild@archiver.kernel.org>; Sat, 14 Aug 2021 23:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbhHNXmY (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 14 Aug 2021 19:42:24 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:22619 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233223AbhHNXmX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Aug 2021 19:42:23 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 17ENf7AF008297;
        Sun, 15 Aug 2021 08:41:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 17ENf7AF008297
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628984467;
        bh=p77MqZ/bQE0NRNaOYH8SC4jbtPVunqpmSihwUeNOgTs=;
        h=From:To:Cc:Subject:Date:From;
        b=wiY5maaWjgFa28oHNA7cBRQlu1O2z0zZRlAxExMsblSL85YCq9PvZ2zV86EizK49l
         MUZxlJN6VprMeuL0EuRV1J51zmRfZI9fnbYACpRNdLYN+F0KULssR5E5+mjoKHLYpq
         anC40b6z0A4M3h86BPvyCTg6lG01zANxBUlcG7MltsJOh1dwa9SnU6QQWdEe51eVbn
         BWwyLfNh7/h7rDo3goLlY4Z/yM0elZxQHvQUVP3Q1QzdNXEufqv8O/+KQSWV+QvEMQ
         oe8Bp5ixZZv1mXkk3faKfHlxMqrgdB5m2n38rstARogBPpsYpK8fkAi0sIzT3AsPo7
         xGToFOaODK0iw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        clang-built-linux@googlegroups.com
Subject: [PATCH] kbuild: Fix 'no symbols' warning when CONFIG_TRIM_UNUSD_KSYMS=y
Date:   Sun, 15 Aug 2021 08:41:02 +0900
Message-Id: <20210814234102.2315551-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When CONFIG_TRIM_UNUSED_KSYMS is enabled, I see some warnings like this:

  nm: arch/x86/entry/vdso/vdso32/note.o: no symbols

$NM (both GNU nm and llvm-nm) warns when no symbol is found in the
object. Suppress the stderr.

Fixes: bbda5ec671d3 ("kbuild: simplify dependency generation for CONFIG_TRIM_UNUSED_KSYMS")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/gen_ksymdeps.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/gen_ksymdeps.sh b/scripts/gen_ksymdeps.sh
index 1324986e1362..5493124e8ee6 100755
--- a/scripts/gen_ksymdeps.sh
+++ b/scripts/gen_ksymdeps.sh
@@ -4,7 +4,10 @@
 set -e
 
 # List of exported symbols
-ksyms=$($NM $1 | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
+#
+# If the object has no symbol, $NM warns 'no symbols'.
+# Suppress the stdout.
+ksyms=$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
 
 if [ -z "$ksyms" ]; then
 	exit 0
-- 
2.30.2

