Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbfB0Ldc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Feb 2019 06:33:32 -0500
Reply-To: kbingham@kernel.org
Subject: Re: [PATCH 2/5] kbuild: remove unimportant comments from ./Kbuild
References: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
 <1550568787-18710-2-git-send-email-yamada.masahiro@socionext.com>
From: Kieran Bingham <kbingham@kernel.org>
Message-ID: <dcc1ba3b-d544-b556-8aa5-69a4a1a88f75@kernel.org>
Date: Wed, 27 Feb 2019 11:33:27 +0000
MIME-Version: 1.0
In-Reply-To: <1550568787-18710-2-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org

Hi Yamada-san,

On 19/02/2019 09:33, Masahiro Yamada wrote:
> Every time we add/remove a target, we need to touch the header part,
> including renumbering. This is not so important information.
> 
> Numbering targets is rather misleading because they are not necessarily
> generated in this order. For example, 1) and 2) can be executed
> simultaneously when the -j option is given.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Sounds reasonable to me.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
> 
>  Kbuild | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/Kbuild b/Kbuild
> index 4cebcc7..a07bbd6 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -1,14 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Kbuild for top-level directory of the kernel
> -# This file takes care of the following:
> -# 1) Generate bounds.h
> -# 2) Generate timeconst.h
> -# 3) Generate asm-offsets.h (may need bounds.h and timeconst.h)
> -# 4) Check for missing system calls
>  
>  #####
> -# 1) Generate bounds.h
> +# Generate bounds.h
>  
>  bounds-file := include/generated/bounds.h
>  
> @@ -19,7 +14,7 @@ $(bounds-file): kernel/bounds.s FORCE
>  	$(call filechk,offsets,__LINUX_BOUNDS_H__)
>  
>  #####
> -# 2) Generate timeconst.h
> +# Generate timeconst.h
>  
>  timeconst-file := include/generated/timeconst.h
>  
> @@ -31,8 +26,7 @@ $(timeconst-file): kernel/time/timeconst.bc FORCE
>  	$(call filechk,gentimeconst)
>  
>  #####
> -# 3) Generate asm-offsets.h
> -#
> +# Generate asm-offsets.h
>  
>  offsets-file := include/generated/asm-offsets.h
>  
> @@ -45,8 +39,7 @@ $(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s FORCE
>  	$(call filechk,offsets,__ASM_OFFSETS_H__)
>  
>  #####
> -# 4) Check for missing system calls
> -#
> +# Check for missing system calls
>  
>  always += missing-syscalls
>  targets += missing-syscalls
> 


-- 
--
Kieran
