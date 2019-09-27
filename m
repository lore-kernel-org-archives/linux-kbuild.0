Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42828 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfI0Mov (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 08:44:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id n14so2560388wrw.9
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 05:44:50 -0700 (PDT)
Date: Fri, 27 Sep 2019 13:44:46 +0100
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH 5/7] kbuild: fix build error of 'make nsdeps' in clean
 tree
Message-ID: <20190927124446.GE259443@google.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927093603.9140-6-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190927093603.9140-6-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jessica Yu <jeyu@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Will Deacon <will.deacon@arm.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 27, 2019 at 06:36:01PM +0900, Masahiro Yamada wrote:
>Running 'make nsdeps' in a clean source tree fails as follows:
>
>$ make -s clean; make -s defconfig; make nsdeps
>   [ snip ]
>awk: fatal: cannot open file `init/modules.order' for reading (No such file or directory)
>make: *** [Makefile;1307: modules.order] Error 2
>make: *** Deleting file 'modules.order'
>make: *** Waiting for unfinished jobs....
>
>The cause of the error is 'make nsdeps' does not build modules at all.
>Set KBUILD_MODULES to fix it.

You reported that issue earlier, but having nsdeps depend on modules
(see Makefile:1708) resolved that for me. I wonder what I missed. But I
won't disagree with you on kbuild advise. :-)

Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> Makefile | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Makefile b/Makefile
>index d456746da347..80ba8efd56bb 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -616,7 +616,7 @@ endif
> # in addition to whatever we do anyway.
> # Just "make" or "make all" shall build modules as well
>
>-ifneq ($(filter all _all modules,$(MAKECMDGOALS)),)
>+ifneq ($(filter all _all modules nsdeps,$(MAKECMDGOALS)),)
>   KBUILD_MODULES := 1
> endif
>
>-- 
>2.17.1
>
