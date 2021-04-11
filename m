Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2A5C433B4
	for <linux-kbuild@archiver.kernel.org>; Sun, 11 Apr 2021 10:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A07A610C8
	for <linux-kbuild@archiver.kernel.org>; Sun, 11 Apr 2021 10:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhDKKOz (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 11 Apr 2021 06:14:55 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:60610 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbhDKKOz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 06:14:55 -0400
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1618136078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c/l58PZ/LDB2s5htRD2/tprkOdjnMs3MpOQAEnFCilo=;
        b=Vo+RwFWllVYc3QXdntf+LNwRFSeYIltl09X1mzRJeLo2DG8DoD9RRbIjO+jHce/Bbyg7im
        mqZKsh4bwPQI1vLcuEWux+4oz1jgqUlKRpimiS7wSsFoJlebfiR8Bc3p9uln74RlAHfb1x
        Y9x9Di36dh7hI9qDEn6+2Uqpsn6SH8aLZwdhgQ+3buYv87CminPD4CXCCSeUppcYer/EJ6
        ajAeS+P/3MPP0/+N//VseFyzH9oJ9ZJvVhTW78P+SNoS2uKuGbIHFbl64VYTfeqm0wTxAk
        GFa/v6W98IXCgtUJCii4Fhs+zFBbFIMrH3vl48S3Bv9ZLtb7DYiGumtUHWhbYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1618136078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c/l58PZ/LDB2s5htRD2/tprkOdjnMs3MpOQAEnFCilo=;
        b=XcuQ5jXuxgU+n4X3psD0G5yQgVGaX8H0TPpi3hFpmzIQ9yEuNfI6UcTUvZP0wPW6RfcCWv
        NmL0CXB250CTUKBg==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH 3/6] builddeb: clean generated package content
Date:   Sun, 11 Apr 2021 12:14:19 +0200
Message-Id: <20210411101422.7092-4-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-1-bage@linutronix.de>
References: <20210411101422.7092-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

For each binary Debian package, a directory with the package name is
created in the debian directory. Include the generated files in the
package's clean target.

Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 2fa149796791..717223ef6b03 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -246,7 +246,7 @@ binary-arch: build-arch
 	KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile intdeb-pkg
 
 clean:
-	rm -rf debian/*tmp debian/files
+	rm -rf debian/*tmp debian/files debian/linux-*
 	\$(MAKE) clean
 
 binary: binary-arch
-- 
2.30.2

