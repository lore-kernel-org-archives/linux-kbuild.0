Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:42678 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbfFDRaz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 13:30:55 -0400
MIME-Version: 1.0
References: <20190520151614.19188-1-dan.rue@linaro.org>
In-Reply-To: <20190520151614.19188-1-dan.rue@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 5 Jun 2019 02:30:12 +0900
Message-ID: <CAK7LNARonAGTShZTyiDL02qtP3PUg7jyYZRHG9C-MUY+zKY22g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: teach kselftest-merge to find nested config files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dan Rue <dan.rue@linaro.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, May 21, 2019 at 12:19 AM Dan Rue <dan.rue@linaro.org> wrote:
>
> Current implementation of kselftest-merge only finds config files that
> are one level deep using `$(srctree)/tools/testing/selftests/*/config`.
>
> Often, config files are added in nested directories, and do not get
> picked up by kselftest-merge.
>
> Use `find` to catch all config files under
> `$(srctree)/tools/testing/selftests` instead.
>
> Signed-off-by: Dan Rue <dan.rue@linaro.org>
> ---
>  Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index a45f84a7e811..e99e7f9484af 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1228,9 +1228,8 @@ kselftest-clean:
>  PHONY += kselftest-merge
>  kselftest-merge:
>         $(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
> -       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> -               -m $(objtree)/.config \
> -               $(srctree)/tools/testing/selftests/*/config
> +       $(Q)find $(srctree)/tools/testing/selftests -name config | \
> +               xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>         +$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>
>  # ---------------------------------------------------------------------------
> --
> 2.21.0
>


Applied to linux-kbuild/fixes. Thanks.




-- 
Best Regards
Masahiro Yamada
