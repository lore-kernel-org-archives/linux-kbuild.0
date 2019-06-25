Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0038.hostedemail.com ([216.40.44.38]:36730 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728506AbfFYQ5o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 12:57:44 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 185CE18020B0B
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Jun 2019 16:52:28 +0000 (UTC)
Message-ID: <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
From: Joe Perches <joe@perches.com>
Date: Tue, 25 Jun 2019 09:52:23 -0700
In-Reply-To: <20190625160103.GA13133@embeddedor>
References: <20190625160103.GA13133@embeddedor>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Jingoo Han <jingoohan1@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, 2019-06-25 at 11:01 -0500, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch
> cases where we are expecting to fall through.
[]
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.

Just enable the thing already.

If you stopped trying to do it all yourself, others
will help resolve any new build warnings.

For instance: a build of -next x86/64 defconfig has 2.  nbd.
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5102b2bbd224..df909ffdfcdb 100644
--- a/Makefile
+++ b/Makefile
@@ -690,6 +690,7 @@ endif # may-sync-config
 endif # $(dot-config)
 
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
+KBUILD_CFLAGS	+= $(call cc-option, -Wimplicit-fallthrough)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
