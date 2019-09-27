Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54348 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727465AbfI0NlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 09:41:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so6675779wmp.4
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 06:41:13 -0700 (PDT)
Date: Fri, 27 Sep 2019 14:41:08 +0100
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH 0/7] module: various bug-fixes and clean-ups for module
 namespace
Message-ID: <20190927134108.GC187147@google.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190927093603.9140-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jessica Yu <jeyu@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Will Deacon <will.deacon@arm.com>, Michal Marek <michal.lkml@markovi.net>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 27, 2019 at 06:35:56PM +0900, Masahiro Yamada wrote:
>
>I was hit by some problems caused by the module namespace feature
>that was merged recently. At least, the breakage of
>external module builds is a fatal one. I just took a look at the code
>closer, and I noticed some more issues and improvements.
>
>I hope these patches are mostly OK.
>The 4th patch might have room for argument since it is a trade-off
>of "cleaner implermentation" vs "code size".
>
Thanks Masahiro for taking the time to improve the implementation of the
symbol namespaces. These are all good points that you addressed!

For [04/07], I can work on this if you do not mind.

Cheers,
Matthias

>
>Masahiro Yamada (7):
>  modpost: fix broken sym->namespace for external module builds
>  module: swap the order of symbol.namespace
>  module: rename __kstrtab_ns_* to __kstrtabns_* to avoid symbol
>    conflict
>  module: avoid code duplication in include/linux/export.h
>  kbuild: fix build error of 'make nsdeps' in clean tree
>  nsdeps: fix hashbang of scripts/nsdeps
>  nsdeps: make generated patches independent of locale
>
> Makefile               |   2 +-
> include/linux/export.h | 104 ++++++++++++++---------------------------
> kernel/module.c        |   2 +-
> scripts/mod/modpost.c  |  20 ++++----
> scripts/nsdeps         |   4 +-
> 5 files changed, 47 insertions(+), 85 deletions(-)
>
>-- 
>2.17.1
>
