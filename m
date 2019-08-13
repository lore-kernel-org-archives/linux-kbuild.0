Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43385 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729691AbfHMPAz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:00:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id v12so3975626pfn.10
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 08:00:55 -0700 (PDT)
Date: Tue, 13 Aug 2019 08:00:53 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] gcc-plugins: Enable error message print
Message-ID: <201908130755.A44C39B46@keescook>
References: <1565689489-309136-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565689489-309136-1-git-send-email-zhe.he@windriver.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zhe.he@windriver.com
Cc: re.emese@gmail.com, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

On Tue, Aug 13, 2019 at 05:44:49PM +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> Instead of sliently emptying CONFIG_PLUGIN_HOSTCC which is the dependency
> of a series of configurations, the following error message would be easier
> for users to find something is wrong and what is happening.
> 
> scripts/gcc-plugins/gcc-common.h:5:22: fatal error: bversion.h:
> No such file or directory
> compilation terminated.
> 
> Now that we have already got the error message switch, let's turn it on.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>

Hi!

Yeah, this would be helpful, but unfortunately it would be very noisy
for many people who don't have the GCC plugins installed. It used to
print error messages when it was a selectable Kconfig option but now
that it is autodetected, we can't show the errors unconditionally.

I would love to have some kind of way to answer the question "why isn't
this option available?" in Kconfig. The best place for this might be in
the menuconfig search option, but I'm not sure how to wire up other
things like it.

-Kees

> ---
>  scripts/gcc-plugins/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index d33de0b..fe28cb9 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -3,7 +3,7 @@ preferred-plugin-hostcc := $(if-success,[ $(gcc-version) -ge 40800 ],$(HOSTCXX),
>  
>  config PLUGIN_HOSTCC
>  	string
> -	default "$(shell,$(srctree)/scripts/gcc-plugin.sh "$(preferred-plugin-hostcc)" "$(HOSTCXX)" "$(CC)")" if CC_IS_GCC
> +	default "$(shell,$(srctree)/scripts/gcc-plugin.sh --show-error "$(preferred-plugin-hostcc)" "$(HOSTCXX)" "$(CC)")" if CC_IS_GCC
>  	help
>  	  Host compiler used to build GCC plugins.  This can be $(HOSTCXX),
>  	  $(HOSTCC), or a null string if GCC plugin is unsupported.
> -- 
> 2.7.4
> 

-- 
Kees Cook
