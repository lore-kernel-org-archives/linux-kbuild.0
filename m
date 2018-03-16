Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:43371 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751714AbeCPCYe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 22:24:34 -0400
Received: by mail-qt0-f194.google.com with SMTP id s48so9435734qtb.10
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Mar 2018 19:24:33 -0700 (PDT)
Date: Thu, 15 Mar 2018 22:24:32 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v2 2/7] kbuild: remove wrong 'touch' in
 adjust_autoksyms.sh
In-Reply-To: <1521166725-24157-3-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <nycvar.YSQ.7.76.1803152224090.28583@knanqh.ubzr>
References: <1521166725-24157-1-git-send-email-yamada.masahiro@socionext.com> <1521166725-24157-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 16 Mar 2018, Masahiro Yamada wrote:

> The comment mentions it creates autoksyms.h in case it is missing,
> but the actual code touches it when it does exists.
> 
> The build system creates it anyway because <linux/export.h> and
> <asm-generic/export.h> need it.
> 
> The code would not have worked as intended, and people have not
> noticed it.  This is a proof that we can simply remove it.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Nicolas Pitre <nico@linaro.org>

> ---
> 
> Changes in v2:
>   - Remove the code instead of fixing it
> 
>  scripts/adjust_autoksyms.sh | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index a162258..e0dd0d5 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -48,9 +48,6 @@ case "${KCONFIG_CONFIG}" in
>  	. "./${KCONFIG_CONFIG}"
>  esac
>  
> -# In case it doesn't exist yet...
> -if [ -e "$cur_ksyms_file" ]; then touch "$cur_ksyms_file"; fi
> -
>  # Generate a new ksym list file with symbols needed by the current
>  # set of modules.
>  cat > "$new_ksyms_file" << EOT
> -- 
> 2.7.4
> 
> 
