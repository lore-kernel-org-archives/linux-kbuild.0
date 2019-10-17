Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:58480 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732271AbfJQPsG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 11:48:06 -0400
Subject: Re: [PATCH] scripts : mksysmap : NM variable missed the value,so
 fixed
References: <20191017102506.22192-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <265d9be5-217d-3f67-ba94-095efdcf5787@infradead.org>
Date: Thu, 17 Oct 2019 08:48:04 -0700
MIME-Version: 1.0
In-Reply-To: <20191017102506.22192-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org

On 10/17/19 3:25 AM, Bhaskar Chowdhury wrote:
> This patch will provide the missing value for NM variable.
> 

Hi,

Does this patch fix some build error that you have encountered?
If so, please describe it and how to cause it.


> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
> TO all,
> Adjusted the subject line, missed in previous one,sorry
> 
>  scripts/mksysmap | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index a35acc0d0b82..4b2f45c45f14 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -40,5 +40,5 @@
>  # 'W' or 'w'. __crc_ are 'A' and placed in the middle
>  # so we just ignore them to let readprofile continue to work.
>  # (At least sparc64 has __crc_ in the middle).
> -
> +NM=$(which nm)

That's not the POSIX way to do that.  It should be

NM=$(command -v nm)

But why is this needed at all?
The top-level Makefile exports the NM variable (and many more) to scripts
that it calls.

>  $NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' > $2
> --
> 2.21.0
> 


-- 
~Randy
