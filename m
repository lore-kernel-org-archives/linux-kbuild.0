Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729308AbgEUWI5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 18:08:57 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34179C05BD43
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:08:56 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ci21so3979943pjb.3
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:08:56 -0700 (PDT)
Date: Thu, 21 May 2020 15:08:53 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
Message-ID: <202005211506.2700F86@keescook>
References: <20200521202716.193316-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521202716.193316-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 21, 2020 at 01:27:16PM -0700, Sami Tolvanen wrote:
> Instead of linking all compilation units again each time vmlinux_link is
> called, reuse vmlinux.o from modpost_link.
> 
> With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> in the time spent in vmlinux_link).

Nice! Any time savings at final link is a big cumulative win.

> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/link-vmlinux.sh | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index d09ab4afbda4..c6cc4305950c 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -77,11 +77,8 @@ vmlinux_link()
>  
>  	if [ "${SRCARCH}" != "um" ]; then
>  		objects="--whole-archive			\
> -			${KBUILD_VMLINUX_OBJS}			\
> +			vmlinux.o				\
>  			--no-whole-archive			\
> -			--start-group				\
> -			${KBUILD_VMLINUX_LIBS}			\
> -			--end-group				\
>  			${@}"
>  
>  		${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}	\

I think the "um" case can be updated as well too, yes?

Also, I think the comment above modpost_link() needs to be updated now
to reflect the nature of how vmlinux.o gets used after this patch.

-- 
Kees Cook
