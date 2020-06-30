Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbgF3VOc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 17:14:32 -0400
Date: Tue, 30 Jun 2020 14:14:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: make Clang build userprogs for target
 architecture
Message-ID: <20200630211428.GB4163361@ubuntu-s3-xlarge-x86>
References: <20200630150625.12056-1-masahiroy@kernel.org>
 <20200630150625.12056-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630150625.12056-2-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, clang-built-linux@googlegroups.com

On Wed, Jul 01, 2020 at 12:06:25AM +0900, Masahiro Yamada wrote:
> Programs added 'userprogs' should be compiled for the target
> architecture i.e. the same architecture as the kernel.
> 
> GCC does this correctly since the target architecture is implied
> by the toolchain prefix.
> 
> Clang builds userspace programs always for the host architecture
> because the target triple is currently missing.
> 
> Fix this.
> 
> Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
> (no changes since v1)
> 
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index ac2c61c37a73..bc48810d1655 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -970,8 +970,8 @@ LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
>  endif
>  
>  # Align the bit size of userspace programs with the kernel
> -KBUILD_USERCFLAGS  += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> -KBUILD_USERLDFLAGS += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> +KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> +KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
>  
>  # make the checker run with the right architecture
>  CHECKFLAGS += --arch=$(ARCH)
> -- 
> 2.25.1
 
