Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:39928 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729498AbeG0JFm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Jul 2018 05:05:42 -0400
Date: Fri, 27 Jul 2018 09:48:54 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: include architecture Kconfig files from top-level Kconfig v3
Message-ID: <20180727074854.GA21840@lst.de>
References: <20180724175646.3621-1-hch@lst.de> <CAK7LNARP2HZ8GdsAU8h_b04jLWbvFXTWqiVt2hpE0vJbjP82ZA@mail.gmail.com> <20180726172143.GA9836@lst.de> <CAK7LNASd0YCj4wwmT9-6GYiBz=wDoXkmQW2F_5XjbCzS9-weUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASd0YCj4wwmT9-6GYiBz=wDoXkmQW2F_5XjbCzS9-weUw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Christoph Hellwig <hch@lst.de>, Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, Ley Foon Tan <lftan@altera.com>, Michal Simek <monstr@monstr.eu>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, linux-arch@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jul 27, 2018 at 10:32:19AM +0900, Masahiro Yamada wrote:
> This will just add a new unmet dependency warning.
> CONFIG_PREEMPT_COUNT will be still selected.

True.  I guess we simply need to prohibit CONFIG_DEBUG_ATOMIC_SLEEP
explicitly if PREEMPT_COUNT isn't supported.  E.g something like this:

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 26d3ff7e3cf4..373ce9fecd7e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1195,6 +1195,7 @@ config DEBUG_ATOMIC_SLEEP
 	bool "Sleep inside atomic section checking"
 	select PREEMPT_COUNT
 	depends on DEBUG_KERNEL
+	depends on !ARCH_NO_PREEMPT
 	help
 	  If you say Y here, various routines which may sleep will become very
 	  noisy if they are called inside atomic sections: when a spinlock is
