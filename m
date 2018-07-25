Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:27771 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729092AbeGYPvy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Jul 2018 11:51:54 -0400
MIME-Version: 1.0
In-Reply-To: <20180720193528.1341-1-jcline@redhat.com>
References: <20180720193528.1341-1-jcline@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 25 Jul 2018 23:39:09 +0900
Message-ID: <CAK7LNAQWotaFhMAnW=Ah8aFO8VMxUB4bXursTe6JTZxcTzettQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: Add Python 3 support to tracing/draw_functrace.py
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeremy Cline <jcline@redhat.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Frederic Weisbecker <fweisbec@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-21 4:35 GMT+09:00 Jeremy Cline <jcline@redhat.com>:
> Use the print function. This maintains Python 2 support and should have
> no functional change.
>
> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> ---
>  scripts/tracing/draw_functrace.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/tracing/draw_functrace.py b/scripts/tracing/draw_functrace.py
> index db40fa04cd51..7d44e796d362 100755
> --- a/scripts/tracing/draw_functrace.py
> +++ b/scripts/tracing/draw_functrace.py
> @@ -20,6 +20,7 @@ Usage:
>         $ scripts/draw_functrace.py < raw_trace_func > draw_functrace
>         Then you have your drawn trace in draw_functrace
>  """
> +from __future__ import print_function

What do you need this line for?

I have not tested this,
but I guess print(CallTree.ROOT) will work for Python 2.



>
>  import sys, re
> @@ -123,7 +124,7 @@ def main():
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



-- 
Best Regards
Masahiro Yamada
