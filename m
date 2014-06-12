Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:64028 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754284AbaFLBYM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jun 2014 21:24:12 -0400
Date: Thu, 12 Jun 2014 10:24:00 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: fix a typo in a kbuild document
In-Reply-To: <1402385774-3748-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402385774-3748-1-git-send-email-yamada.m@jp.panasonic.com>
Message-Id: <20140612102400.9635.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi Michal,

Does this patch look good?

If it is not too late,
could you consider to include this trivial one in your GIT-PULL?



On Tue, 10 Jun 2014 16:36:14 +0900
Masahiro Yamada <yamada.m@jp.panasonic.com> wrote:

> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  Documentation/kbuild/makefiles.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index d567a7c..c600e2f 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -1171,7 +1171,7 @@ When kbuild executes, the following steps are followed (roughly):
>  	      obvious reason.
>  
>      dtc
> -	Create flattend device tree blob object suitable for linking
> +	Create flattened device tree blob object suitable for linking
>  	into vmlinux. Device tree blobs linked into vmlinux are placed
>  	in an init section in the image. Platform code *must* copy the
>  	blob to non-init memory prior to calling unflatten_device_tree().
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


