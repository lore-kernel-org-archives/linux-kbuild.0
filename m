Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:54989 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751107AbdFFBsM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jun 2017 21:48:12 -0400
MIME-Version: 1.0
In-Reply-To: <1496028061-19285-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1496028061-19285-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Jun 2017 10:47:43 +0900
Message-ID: <CAK7LNAQ_OOvmCU6jdg+VNnWnZRzjeZ99Uz8o_2yDnMM+i=g=kg@mail.gmail.com>
Subject: Re: [PATCH] Top Makefile: tiny correction on `make help`
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Cao,


2017-05-29 12:21 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> The help info of `make -C=1` is little confusing, make it clear.

`make C=1` instead of `make -C=1`



> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index efa267a..b34a34d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1417,7 +1417,7 @@ help:
>         @echo  '  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
>         @echo  '  make V=2   [targets] 2 => give reason for rebuild of target'
>         @echo  '  make O=dir [targets] Locate all output files in "dir", including .config'
> -       @echo  '  make C=1   [targets] Check all c source with $$CHECK (sparse by default)'
> +       @echo  '  make C=1   [targets] Check re-compiled c source only with $$CHECK (sparse by default)'
>         @echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
>         @echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
>         @echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'

Which phrase is qualified by "only"?

[1] re-compiled c source only
[2] only with $$CHECK

I know [1] is what you mean (sorry for my nitpicking).


Perhaps, "Check only re-compiled c source with $$CHECK" is even clearer?

(or, just drop "only" because "re-compiled c source" is understandable enough ?)


Could you use "kbuild: " instead of "Top Makefile" in the subject?

Thanks.

-- 
Best Regards
Masahiro Yamada
