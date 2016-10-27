Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:35569 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933194AbcJ0RJI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Oct 2016 13:09:08 -0400
MIME-Version: 1.0
In-Reply-To: <20161021111600.9417-1-bigeasy@linutronix.de>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
From: Shuah Khan <shuahkhan@gmail.com>
Date: Thu, 27 Oct 2016 11:09:06 -0600
Message-ID: <CAKocOONAiGTfPXDSLC3gb6gvj7-DCbeYbUR1atBJmCQ7Cq-sAw@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>

On Fri, Oct 21, 2016 at 5:16 AM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> Debian started to build the gcc with --enable-default-pie by default so the
> kernel build ends before it starts properly with:
> |kernel/bounds.c:1:0: error: code model kernel does not support PIC mode
>
> Is this okay or do we want some kind of check to see if -fno-PIE is supported?
> It is mentioned in the 4.4.7 gcc manpage is it is not *that* new :)
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index bf6e44a421df..97296d66b586 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -398,7 +398,7 @@ KBUILD_CPPFLAGS := -D__KERNEL__
>  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>                    -fno-strict-aliasing -fno-common \
>                    -Werror-implicit-function-declaration \
> -                  -Wno-format-security \
> +                  -Wno-format-security -fno-PIE \
>                    -std=gnu89
>
>  KBUILD_AFLAGS_KERNEL :=
> --
> 2.9.3
>

Hi,

I ran into this when I upgraded to Ubuntu 16.10. Ubuntu kernel team
has a patch posted for Ubuntu kernels. The patch talks about needing
have this work for other architectures. I applied part of the change
from the original Ubuntu patch -
https://patchwork.ozlabs.org/patch/616621/

Anyway, the following worked for me on x86-64 - both 4.8.4 and 4.9


diff --git a/Makefile b/Makefile
index 82a36ab..0a01ad1 100644
--- a/Makefile
+++ b/Makefile
@@ -651,6 +651,11 @@ ifneq ($(CONFIG_FRAME_WARN),0)
 KBUILD_CFLAGS += $(call cc-option,-Wframe-larger-than=${CONFIG_FRAME_WARN})
 endif

+# force no-pie for distro compilers that enable pie by default
+KBUILD_CFLAGS += $(call cc-option, -fno-pie)
+KBUILD_CFLAGS += $(call cc-option, -no-pie)
+KBUILD_AFLAGS += $(call cc-option, -fno-pie)
+
 # This selects the stack protector compiler flag. Testing it is delayed
 # until after .config has been reprocessed, in the prepare-compiler-check
 # target.

thanks,
-- Shuah
