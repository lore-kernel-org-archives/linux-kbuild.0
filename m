Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:65019 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfCGPdJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Mar 2019 10:33:09 -0500
MIME-Version: 1.0
References: <20190221215901.23970-1-ar@cs.msu.ru>
In-Reply-To: <20190221215901.23970-1-ar@cs.msu.ru>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Mar 2019 00:32:11 +0900
Message-ID: <CAK7LNAQrN1e1GYRd760pWiAdgY9_7Jda3QD_zozTNHpHOim4Xg@mail.gmail.com>
Subject: Re: [PATCH] scripts/package/Makefile: put proper config in source tarball
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arseny Maslennikov <ar@cs.msu.ru>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Riku Voipio <riku.voipio@linaro.org>

On Fri, Feb 22, 2019 at 7:19 AM Arseny Maslennikov <ar@cs.msu.ru> wrote:
>
> It is widely known that one can build a kernel without a .config in the
> source tree

"without a .config in the source file"  means
KCONFIG_CONFIG will probably contain '..' or absolute path.



ex1)  KCONFIG_CONFIG=../my_dir/.config

ex2)  KCONFIG_CONFIG=/absolute/pass/to/my/.config





> by setting KCONFIG_CONFIG equal to the actual configuration
> file path.
>
> When making a *-pkg target, make(1) prepares a source tarball and tries
> to pack `.config' in there regardless of the value of KCONFIG_CONFIG,
> failing spectacularly if .config is absent and packing the wrong config
> if it exists.
> Let's fix that.


Did you notice the log 'Removing leading ...' from tar
for case ex1), ex2) ?


masahiro@grover:~/ref/linux$ make -j8  KCONFIG_CONFIG=../.config  deb-pkg
make clean
/bin/bash ./scripts/package/mkdebian
  TAR     linux-5.0.0+.tar.gz
tar: Removing leading `../' from member names
   ...


Even if I apply 3/3, it will produce a broken source package
since the tar will rip off the leading directory path,
then it mismatches to KCONFIG_CONFIG recorded in debian/rules.

A simple case like KCONFIG_CONFIG=my.config will work,
but I am not convinced with 3/3.




> Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
> ---
>  scripts/package/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 453fecee62f0..100a0d28ad25 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -27,7 +27,7 @@ KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
>  KBUILD_PKG_ROOTCMD ?="fakeroot -u"
>  export KDEB_SOURCENAME
>  # Include only those top-level files that are needed by make, plus the GPL copy
> -TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
> +TAR_CONTENT := $(KBUILD_ALLDIRS) $(KCONFIG_CONFIG) .scmversion Makefile \
>                 Kbuild Kconfig COPYING $(wildcard localversion*)
>  MKSPEC     := $(srctree)/scripts/package/mkspec
>
> --
> 2.20.1
>


--
Best Regards
Masahiro Yamada
