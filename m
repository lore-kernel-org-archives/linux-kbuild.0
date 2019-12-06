Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:45252 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfLFQJF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Dec 2019 11:09:05 -0500
Subject: Re: [PATCH] kconfig: Add yes2modconfig and mod2yesconfig targets.
References: <1575625847-6384-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5a473c6c-cc1f-6648-31ec-3b40e415a836@infradead.org>
Date: Fri, 6 Dec 2019 08:09:03 -0800
MIME-Version: 1.0
In-Reply-To: <1575625847-6384-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>

On 12/6/19 1:50 AM, Tetsuo Handa wrote:
> Since kernel configs provided by syzbot are close to "make allyesconfig",
> it takes long time to rebuild. This is especially waste of time when we
> need to rebuild for many times (e.g. doing manual printk() inspection,
> bisect operations).
> 
> We can save time if we can exclude modules which are irrelevant to each
> problem. But "make localmodconfig" cannot exclude modules which are built
> into vmlinux because /sbin/lsmod output is used as the source of modules.
> 
> Therefore, this patch adds "make yes2modconfig" which converts from =y
> to =m if possible. After confirming that the interested problem is still
> reproducible, we can try "make localmodconfig" (and/or manually tune
> based on "Modules linked in:" line) in order to exclude modules which are
> irrelevant to the interested problem. While we are at it, this patch also
> adds "make mod2yesconfig" target which converts from =m to =y in case
> someone wants to convert from =m to =y after "make localmodconfig".
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> ---
>  scripts/kconfig/Makefile   |  2 +-
>  scripts/kconfig/conf.c     | 17 +++++++++++++++++
>  scripts/kconfig/confdata.c | 26 ++++++++++++++++++++++++++
>  scripts/kconfig/lkc.h      |  3 +++
>  4 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 2f1a59fa5169..3516809255be 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -67,7 +67,7 @@ localyesconfig localmodconfig: $(obj)/conf
>  #  deprecated for external use
>  simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
>  	alldefconfig randconfig listnewconfig olddefconfig syncconfig \
> -	helpnewconfig
> +	helpnewconfig yes2modconfig mod2yesconfig
>  
>  PHONY += $(simple-targets)


In this Makefile (above), please also update the available 'help' targets.

-- 
~Randy
