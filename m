Return-Path: <SRS0=k9F6=DS=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49469C433DF
	for <linux-kbuild@archiver.kernel.org>; Sun, 11 Oct 2020 19:00:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF371207FB
	for <linux-kbuild@archiver.kernel.org>; Sun, 11 Oct 2020 19:00:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="V7CZ7NEa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgJKTAl (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 11 Oct 2020 15:00:41 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:16882 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgJKTAl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Oct 2020 15:00:41 -0400
X-Greylist: delayed 354 seconds by postgrey-1.27 at vger.kernel.org; Sun, 11 Oct 2020 15:00:40 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1602442839;
        s=strato-dkim-0002; d=aepfle.de;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=2M6UkCdPor/fY59jORI7T/+9FR6xj1OOYkDB+lMXU9c=;
        b=V7CZ7NEaGzZ7Cd+vvrC9cig34/nhR9HfDoILOgbiEYm5mc4gVzwVXkyyD7pweI3qxI
        QSbXtlRsasiGANUbKkxM9O3RMYm1PZgVCyqwCWrevQdGcgUmK1PuHr7Z5LjUAbbZzLVh
        MKnix4QhcD31Iy+PfyiloI9zVm5K8iYBMTiLimkM36eN5Z3c88jD1o58CPU3ODkQuYa1
        ycNkkQHZQP09lGsewekJ9skGonI1abLrCOVvEkrAkBjXcnzrlaq6uN6/ALzrijgNgxPw
        0IT7Y/vrtM0D8vZQXtj3clfy3fAN5+iiv1d6V3T97zlUbWcR5DGWKcfBjkUmuLnlwJhs
        H1SA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G5Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
        by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
        with ESMTPSA id e003b5w9BIsbbf2
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 11 Oct 2020 20:54:37 +0200 (CEST)
From:   Olaf Hering <olaf@aepfle.de>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Olaf Hering <olaf@aepfle.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v2] kbuild: enforce -Werror=return-type
Date:   Sun, 11 Oct 2020 20:54:31 +0200
Message-Id: <20201011185431.24094-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Catch errors which at least gcc tolerates by default:
 warning: 'return' with no value, in function returning non-void [-Wreturn-type]

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f84d7e4ca0be..965e7259e6e8 100644
--- a/Makefile
+++ b/Makefile
@@ -497,7 +497,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
 		   -Werror=implicit-function-declaration -Werror=implicit-int \
-		   -Wno-format-security \
+		   -Werror=return-type -Wno-format-security \
 		   -std=gnu89
 KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_AFLAGS_KERNEL :=
