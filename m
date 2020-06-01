Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36892 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgFALCc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 07:02:32 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 051B1vMN023247
        for <linux-kbuild@vger.kernel.org>; Mon, 1 Jun 2020 20:01:57 +0900
Received: by mail-ua1-f41.google.com with SMTP id w20so3184238uaa.2
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2020 04:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
In-Reply-To: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 1 Jun 2020 20:01:19 +0900
Message-ID: <CAK7LNAS290zRibWqbu1AxQ1W9afPR21OYSia+xkqwoot9zRd2w@mail.gmail.com>
Subject: Re: [PATCH] mksysmap: Fix the mismatch of '.L' symbols in System.map
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: AliOS system security <alios_sys_security@linux.alibaba.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, May 31, 2020 at 7:28 PM AliOS system security
<alios_sys_security@linux.alibaba.com> wrote:
>
> When System.map was generated, the kernel used mksysmap to filter the
> kernel symbols, but all the symbols with the second letter 'L' in the
> kernel were filtered out, not just the symbols starting with 'dot + L'.
>
> For example:
> ashimida@ubuntu:~/linux$ cat System.map |grep ' .L'
> ashimida@ubuntu:~/linux$ nm -n vmlinux |grep ' .L'
> ffff0000088028e0 t bLength_show
> ......
> ffff0000092e0408 b PLLP_OUTC_lock
> ffff0000092e0410 b PLLP_OUTA_lock
>
> I see that in the original patch[1], the original intent should be to
> filter all local symbols starting with '.L', so I wonder if the code
> here may add a '\' before '.L'?


You are right, but please avoid the interrogatory sentence.

Shall I reword as follows?


The original intent should be to filter out all local symbols
starting with '.L', so the dot should be escaped.





>
> [1]. mksysmap: Add h8300 local symbol pattern
>
> Signed-off-by: AliOS system security <alios_sys_security@linux.alibaba.com>
> ---
>  scripts/mksysmap | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index a35acc0..9aa23d1 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -41,4 +41,4 @@
>  # so we just ignore them to let readprofile continue to work.
>  # (At least sparc64 has __crc_ in the middle).
>
> -$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' > $2
> +$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( \.L\)' > $2
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
