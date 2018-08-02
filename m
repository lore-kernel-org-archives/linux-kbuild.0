Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17029 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387456AbeHBRDa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Aug 2018 13:03:30 -0400
MIME-Version: 1.0
In-Reply-To: <31061.1533131891@warthog.procyon.org.uk>
References: <31061.1533131891@warthog.procyon.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 3 Aug 2018 00:11:04 +0900
Message-ID: <CAK7LNAT2_eaGbd04y1b=rfYhabiTpbEqYO+fznJrFOdzzmQ9Kw@mail.gmail.com>
Subject: Re: Can we fix samples/ dependency on headers please?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.



2018-08-01 22:58 GMT+09:00 David Howells <dhowells@redhat.com>:
> Hi,
>
> I'm currently having to mark various userspace programs I've added to the
> samples/ directory as BROKEN in samples/Kconfig because the root Makefile
> mucks up the dependencies between building samples and headers_install.
>
> The main culprit seems to be:
>
>         commit dd92478a15fa3bfd746ee08b4ef59401c1537804
>         Author: Nicolas Pitre <nicolas.pitre@linaro.org>
>         Date:   Sun Feb 28 22:00:00 2016 -0500
>         kbuild: build sample modules along with the rest of the kernel
>
> which make the samples build in parallel with the build, thereby voiding the
> explicit dependency:
>
>         Documentation/ samples/: headers_install
>
> and thereby breaking:
>
>         commit ddea05fa148b4d8e66498e522a616d87f9cf81e3
>         Author: Arnd Bergmann <arnd@arndb.de>
>         Date:   Mon Jul 4 16:39:35 2016 +0200
>         kbuild: make samples depend on headers_install
>
> The obvious fix is to revert commit dd92478a15fa3bfd746ee08b4ef59401c1537804
> (see attached patch).
>
> David
> ---
> commit 5c186b58db93e2644012e2fcb4c6ca2e74c6754b
> Author: David Howells <dhowells@redhat.com>
> Date:   Wed Aug 1 14:48:22 2018 +0100
>
>     Revert "kbuild: build sample modules along with the rest of the kernel"
>
>     This reverts commit dd92478a15fa3bfd746ee08b4ef59401c1537804.
>
>     The problem with this commit is that some of the samples require the header
>     installation to occur first, but building them in parallel with the rest of
>     the build breaks that requirement.
>
>     Signed-off-by: David Howells <dhowells@redhat.com>
>
> diff --git a/Makefile b/Makefile
> index ca2af1ab91eb..30fc0a37ad41 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1009,16 +1009,14 @@ vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
>  ifdef CONFIG_HEADERS_CHECK
>         $(Q)$(MAKE) -f $(srctree)/Makefile headers_check
>  endif
> +ifdef CONFIG_SAMPLES
> +       $(Q)$(MAKE) $(build)=samples
> +endif
>  ifdef CONFIG_GDB_SCRIPTS
>         $(Q)ln -fsn $(abspath $(srctree)/scripts/gdb/vmlinux-gdb.py)
>  endif
>         +$(call if_changed,link-vmlinux)
>
> -# Build samples along the rest of the kernel
> -ifdef CONFIG_SAMPLES
> -vmlinux-dirs += samples
> -endif
> -
>  # The actual objects are generated when descending,
>  # make sure no implicit rule kicks in
>  $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
> --


I dot not understand why this would fix your problem.

Does the combination of CONFIG_SAMPLES=y and CONFIG_HEADERS_CHECK=n
still fail to build?


If you need to install headers before building samples,
this should work:


diff --git a/Makefile b/Makefile
index b47af5a..555ee84 100644
--- a/Makefile
+++ b/Makefile
@@ -1023,6 +1023,7 @@ endif
 # Build samples along the rest of the kernel
 ifdef CONFIG_SAMPLES
 vmlinux-dirs += samples
+samples: headers_install
 endif

 # The actual objects are generated when descending,




Please note Arnd's patch only works for single targets.
'samples/' and 'samples' are different targets.


-- 
Best Regards
Masahiro Yamada
