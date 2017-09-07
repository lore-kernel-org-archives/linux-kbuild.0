Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:57228 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752375AbdIGRFU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Sep 2017 13:05:20 -0400
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com [209.85.161.180]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id v87H551K005166
        for <linux-kbuild@vger.kernel.org>; Fri, 8 Sep 2017 02:05:06 +0900
Received: by mail-yw0-f180.google.com with SMTP id s62so1002621ywg.0
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Sep 2017 10:05:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170816110855.6021-1-riku.voipio@linaro.org>
References: <20170816110855.6021-1-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Sep 2017 02:04:24 +0900
Message-ID: <CAK7LNASm98uy4vC7c3UxM10fx422jHwg+QUmadcpc+_TvECqew@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/package/Makefile: make revision update a function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>

Hi Riku,


2017-08-16 20:08 GMT+09:00  <riku.voipio@linaro.org>:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> The updated deb-pkg and bindeb-pkg will use the same snippet,
> so make it reusable.
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  scripts/package/Makefile | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 71b4a8af9d4d..9867638896ad 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -44,14 +44,18 @@ tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>         $(addprefix $(2)/,$(TAR_CONTENT) $(3)); \
>  rm -f $(2) $(objtree)/.scmversion
>
> +quiet_cmd_updateversion = UPDATEVERSION
> +      cmd_updateversion = \
> +       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version; \
> +       mv -f $(objtree)/.tmp_version $(objtree)/.version
> +
>  # rpm-pkg
>  # ---------------------------------------------------------------------------
>  rpm-pkg rpm: FORCE
>         $(MAKE) clean
>         $(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
>         $(call cmd,src_tar,$(KERNELPATH),kernel.spec)
> -       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
> -       mv -f $(objtree)/.tmp_version $(objtree)/.version
> +       $(call cmd,updateversion)
>         rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
>         rm $(KERNELPATH).tar.gz kernel.spec
>
> @@ -60,9 +64,7 @@ rpm-pkg rpm: FORCE
>  binrpm-pkg: FORCE
>         $(MAKE) KBUILD_SRC=
>         $(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
> -       $(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
> -       mv -f $(objtree)/.tmp_version $(objtree)/.version
> -
> +       $(call cmd,updateversion)
>         rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
>                 $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>         rm binkernel.spec



scripts/mkversion is pretty small.
I think scripts/mkversion can also update .version

For example,




if [ ! -f .version ]
then
    version=1
else
    version=$(expr 0$(cat .version) + 1)
fi

echo $version > .version
echo $version




Then, remove the duplicated code from the Makefile.




-- 
Best Regards
Masahiro Yamada
