Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:34684 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750750AbeAPQjM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jan 2018 11:39:12 -0500
MIME-Version: 1.0
In-Reply-To: <1515662549-58933-1-git-send-email-wangxiongfeng2@huawei.com>
References: <1515662549-58933-1-git-send-email-wangxiongfeng2@huawei.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 17 Jan 2018 01:38:21 +0900
Message-ID: <CAK7LNATw1xvsWN76X132t41noqhUen+hm+wQmXj1snsko3Fd+A@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: suppress packed-not-aligned warning for default
 setting only
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

2018-01-11 18:22 GMT+09:00 Xiongfeng Wang <wangxiongfeng2@huawei.com>:
> From: Xiongfeng Wang <xiongfeng.wang@linaro.org>
>
> gcc-8 reports many -Wpacked-not-aligned warnings. The below are some
> examples.
>
> ./include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct
> ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
>  } __attribute__ ((packed));
>
> ./include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct
> ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
>  } __attribute__ ((packed));
>
> ./include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct
> ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
>  } __attribute__ ((packed));
>
> This patch suppress this kind of warnings for default setting.
>
> Signed-off-by: Xiongfeng Wang <xiongfeng.wang@linaro.org>
> ---
>  scripts/Makefile.extrawarn | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index c6ebf42..8d53570 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -11,6 +11,8 @@
>  # are not supported by all versions of the compiler
>  # ==========================================================================
>
> +KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
> +
>  ifeq ("$(origin W)", "command line")
>    export KBUILD_ENABLE_EXTRA_GCC_CHECKS := $(W)
>  endif
> @@ -26,6 +28,7 @@ warning-1 += -Wold-style-definition
>  warning-1 += $(call cc-option, -Wmissing-include-dirs)
>  warning-1 += $(call cc-option, -Wunused-but-set-variable)
>  warning-1 += $(call cc-option, -Wunused-const-variable)
> +warning-1 += $(call cc-option, -Wpacked-not-aligned)
>  warning-1 += $(call cc-disable-warning, missing-field-initializers)
>  warning-1 += $(call cc-disable-warning, sign-compare)


Applied to linux-kbuild/kbuild.  Thanks!

-- 
Best Regards
Masahiro Yamada
