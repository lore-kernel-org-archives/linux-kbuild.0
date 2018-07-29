Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:59496 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731506AbeG2Dkp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Jul 2018 23:40:45 -0400
MIME-Version: 1.0
In-Reply-To: <20180728144833.6336-1-jcline@redhat.com>
References: <20180728144833.6336-1-jcline@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 29 Jul 2018 11:11:21 +0900
Message-ID: <CAK7LNASS_LfGOPthtL0Quueh74Sbatdhk0ouaRUZuufNB1VSvw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Add Python 3 support to tracing/draw_functrace.py
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeremy Cline <jcline@redhat.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Frederic Weisbecker <fweisbec@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-28 23:48 GMT+09:00 Jeremy Cline <jcline@redhat.com>:
> Use the print function. This maintains Python 2 support and should have
> no functional change.
>
> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> ---

Applied to linux-kbuild. Thanks!


> Changes from v1:
>   - Drop "from __future__ import print_function" as Python 2 is not long
>     for this world and in this case the statement and function behave
>     the same way.
>
>  scripts/tracing/draw_functrace.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/tracing/draw_functrace.py b/scripts/tracing/draw_functrace.py
> index db40fa04cd51..9b6dd4f36335 100755
> --- a/scripts/tracing/draw_functrace.py
> +++ b/scripts/tracing/draw_functrace.py
> @@ -123,7 +123,7 @@ def main():
>                 tree = tree.getParent(caller)
>                 tree = tree.calls(callee, calltime)
>
> -       print CallTree.ROOT
> +       print(CallTree.ROOT)
>
>  if __name__ == "__main__":
>         main()
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
