Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:24741 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751599AbdKQHVK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 02:21:10 -0500
Subject: Re: [PATCH] kbuild: define KBUILD_MODNAME even if multiple modules
 share objects
References: <1510818396-17443-1-git-send-email-yamada.masahiro@socionext.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5952fd94-d3a9-620f-2326-74f16fbe029c@cn.fujitsu.com>
Date: Fri, 17 Nov 2017 15:20:29 +0800
MIME-Version: 1.0
In-Reply-To: <1510818396-17443-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org



On 11/16/2017 03:46 PM, Masahiro Yamada wrote:
> Currently, KBUILD_MODNAME is defined only when $(modname) contains
> just one word.  If an object is shared between multiple modules,
> undefined KBUILD_MODNAME causes a build error.
> 
> A simple test case is as follows:
> 
>   obj-m += foo.o
>   obj-m += bar.o
>   foo-objs := foo-bar-common.o foo-main.o
>   bar-objs := foo-bar-common.o bar-main.o
> 
> In this case, we do not know what to define for KBUILD_MODNAME when
> compiling foo-bar-common.o ("foo" or "bar" ?), so one reasonable
> solution is let it fall back to $(basetarget) (= "foo-bar-common").
> 
> It would be better to avoid such a design where possible, but we
> already have such a case, for example,
> drivers/net/ethernet/cavium/liquidio/Makefile
> 
> I slightly refactored implementation; we can check $(word 2, $(modname))
> instead of $(filter 1,$(words $(modname))).
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  scripts/Makefile.lib | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 5fbc46d..9f9a7df 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -86,8 +86,7 @@ subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
>  #       differ in different configs.
>  name-fix = $(squote)$(quote)$(subst $(comma),_,$(subst -,_,$1))$(quote)$(squote)
>  basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
> -modname_flags  = $(if $(filter 1,$(words $(modname))),\
> -                 -DKBUILD_MODNAME=$(call name-fix,$(modname)))
> +modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(if $(word 2,$(modname)),$(basetarget),$(modname)))
>  
>  orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) \
>                   $(ccflags-y) $(CFLAGS_$(basetarget).o)
> 

I like this style of the refactor, because it is a bit more readable
according to human mind,  and it also behave the same as before in the
case drivers/net/ethernet/cavium/liquidio/Makefile: modname =
$(basetarget). So:

Tested-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Reviewed-by: Cao jin <caoj.fnst@cn.fujitsu.com>

-- 
Sincerely,
Cao jin


