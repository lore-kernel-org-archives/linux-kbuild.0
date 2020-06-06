Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:17257 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbgFFOoK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jun 2020 10:44:10 -0400
MIME-Version: 1.0
References: <20200514131234.380097-1-efremov@linux.com> <20200605073955.6384-1-efremov@linux.com>
In-Reply-To: <20200605073955.6384-1-efremov@linux.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 6 Jun 2020 23:43:10 +0900
Message-ID: <CAK7LNARqJpM1m38o_5Ft1HV_sriDTBNE27JgxJfmbv2PM9EjQA@mail.gmail.com>
Subject: Re: [PATCH v5] kbuild: add variables for compression tools
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jun 5, 2020 at 4:40 PM Denis Efremov <efremov@linux.com> wrote:
>
> Allow user to use alternative implementations of compression tools,
> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
> speed up the build:
> $ make GZIP=pigz BZIP2=pbzip2
>
> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
> since 2015. However, alternative implementations (e.g., pigz) still rely
> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
>
> The credit goes to @grsecurity.
>
> As a sidenote, for multi-threaded lzma, xz compression one can use:
> $ export XZ_OPT="--threads=0"
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
> Changes in v2:
>   - _GZIP used instead of GZIP
>   - tar commands altered to use tools from the vars
> Changes in v3:
>   - _BZIP2 used instead of BZIP2
>   - _LZOP used instead of LZOP
> Changes in v4:
>   - Unexports removed from Kbuild.include
>   - MAKEOVERRIDES used in top Makefile
>   - All variables checks removed from scripts
> Changes in v5:
>   - Conflict with removed LASAT resolved


Replaced. Thanks.



-- 
Best Regards
Masahiro Yamada
