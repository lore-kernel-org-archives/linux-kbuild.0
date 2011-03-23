Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:56863 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753046Ab1CWBkB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Mar 2011 21:40:01 -0400
Message-ID: <4D894CD0.9030509@cn.fujitsu.com>
Date: Wed, 23 Mar 2011 09:28:48 +0800
From: Li Zefan <lizf@cn.fujitsu.com>
MIME-Version: 1.0
Subject: Re: [PATCH]Clean up CodingStyle for scripts/kconfig/gconf.c
References: <20110322143839.GA10291@gmail.com>
In-Reply-To: <20110322143839.GA10291@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, greg@kroah.com, joe@perches.com, akpm@linux-foundation.org

Harry Wei wrote:
> Hi us,
>    	Clean up CodingStyle for scripts/kconfig/gconf.c.
> 

What makes you think this is a bad style? Does Documentation/CodingStyle say
so? Does checkpatch.pl make a complain? Do you really think this improves
readability? I don't think so, and actually it makes the code worse.

Run checkpatch.pl on this file, and you'll see lots of errors and warnings,
but pure codingstyle cleanup is rarely worth anything, so better don't do
that.

> Thanks.
> Best Regards.
> Harry Wei.
> 
> Signed-off-by: Harry Wei <harryxiyou@gmail.com>
> ---
>  scripts/kconfig/gconf.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 4558961..56da945 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -7,7 +7,7 @@
>   */
>  
>  #ifdef HAVE_CONFIG_H
> -#  include <config.h>
> +#include <config.h>
>  #endif
>  
>  #include "lkc.h"
