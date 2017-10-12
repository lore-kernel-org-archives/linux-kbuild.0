Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:3840 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751302AbdJLF6S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Oct 2017 01:58:18 -0400
Subject: Re: [PATCH] kbuild: remove KBUILD_SUBDIR_ASFLAGS and
 KBUILD_SUBDIR_CCFLAGS
References: <1507635801-30561-1-git-send-email-yamada.masahiro@socionext.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <59DF0446.6000707@cn.fujitsu.com>
Date: Thu, 12 Oct 2017 13:57:26 +0800
MIME-Version: 1.0
In-Reply-To: <1507635801-30561-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org



On 10/10/2017 07:43 PM, Masahiro Yamada wrote:
> Accumulate subdir-{cc,as}flags-y directly to KBUILD_{A,C}FLAGS.
> Remove KBUILD_SUBDIR_{AS,CC}FLAGS.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  scripts/Makefile.lib | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 9bbb019..bc63f17a 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -5,8 +5,8 @@ cppflags-y += $(EXTRA_CPPFLAGS)
>  ldflags-y  += $(EXTRA_LDFLAGS)
>  
>  # flags that take effect in current and sub directories
> -export KBUILD_SUBDIR_ASFLAGS := $(KBUILD_SUBDIR_ASFLAGS) $(subdir-asflags-y)
> -export KBUILD_SUBDIR_CCFLAGS := $(KBUILD_SUBDIR_CCFLAGS) $(subdir-ccflags-y)
> +KBUILD_AFLAGS += $(subdir-asflags-y)
> +KBUILD_CFLAGS += $(subdir-ccflags-y)
>  
>  # Figure out what we need to build from the various variables
>  # ===========================================================================
> @@ -94,10 +94,10 @@ basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
>  modname_flags  = $(if $(filter 1,$(words $(modname))),\
>                   -DKBUILD_MODNAME=$(call name-fix,$(modname)))
>  
> -orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(KBUILD_SUBDIR_CCFLAGS) \
> +orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) \
>                   $(ccflags-y) $(CFLAGS_$(basetarget).o)
>  _c_flags       = $(filter-out $(CFLAGS_REMOVE_$(basetarget).o), $(orig_c_flags))
> -orig_a_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(KBUILD_SUBDIR_ASFLAGS) \
> +orig_a_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) \
>                   $(asflags-y) $(AFLAGS_$(basetarget).o)
>  _a_flags       = $(filter-out $(AFLAGS_REMOVE_$(basetarget).o), $(orig_a_flags))
>  _cpp_flags     = $(KBUILD_CPPFLAGS) $(cppflags-y) $(CPPFLAGS_$(@F))
> 

I also think the KBUILD_SUBDIR_{AS,CC}FLAGS is unnecessary when I came
to this part. So FWIW:

Reviewed-by: Cao jin <caoj.fnst@cn.fujitsu.com>
-- 
Sincerely,
Cao jin


