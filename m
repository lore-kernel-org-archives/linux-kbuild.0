Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:37396 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730085AbeGZSfm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 14:35:42 -0400
Date: Thu, 26 Jul 2018 19:21:43 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: include architecture Kconfig files from top-level Kconfig v3
Message-ID: <20180726172143.GA9836@lst.de>
References: <20180724175646.3621-1-hch@lst.de> <CAK7LNARP2HZ8GdsAU8h_b04jLWbvFXTWqiVt2hpE0vJbjP82ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARP2HZ8GdsAU8h_b04jLWbvFXTWqiVt2hpE0vJbjP82ZA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Christoph Hellwig <hch@lst.de>, Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, Ley Foon Tan <lftan@altera.com>, Michal Simek <monstr@monstr.eu>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, linux-arch@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jul 25, 2018 at 01:30:24PM +0900, Masahiro Yamada wrote:
> Could you check the difference of CONFIG_PREEMPT_COUNT, please?
> 
> 
> For alpha, hexagon, um,
> CONFIG_PREEMPT_COUNT was previously never enabled
> because kernel/Kconfig.preempt was not included.
> 
> Now, CONFIG_PREEMPT_COUNT can be enabled
> if it is select'ed by someone.
> 
> I guess this change will be OK, but
> I'd like you and Randy to double-check it just in case.

It might be fine, but with this little fix folded in we should be
safer:

diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index cd1655122ec0..1321a4a7a677 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -57,4 +57,5 @@ config PREEMPT
 endchoice
 
 config PREEMPT_COUNT
-       bool
\ No newline at end of file
+	depends on !ARCH_NO_PREEMPT
+	bool
