Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:39366 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751551AbeCNR0h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Mar 2018 13:26:37 -0400
Received: by mail-io0-f193.google.com with SMTP id v10so5287054iob.6
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Mar 2018 10:26:37 -0700 (PDT)
Date: Wed, 14 Mar 2018 13:26:35 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 2/7] kbuild: touch autoksyms.h when it is really
 missing
In-Reply-To: <1521045861-22418-3-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <nycvar.YSQ.7.76.1803141324420.28583@knanqh.ubzr>
References: <1521045861-22418-1-git-send-email-yamada.masahiro@socionext.com> <1521045861-22418-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Jarod Wilson <jarod@redhat.com>, Prarit Bhargava <prarit@redhat.com>, linux-kernel@vger.kernel.org

On Thu, 15 Mar 2018, Masahiro Yamada wrote:

> From the comment, I expect this code creates autoksyms.h in case it
> is missing, but it actually touches it when it does exists.

Oops, indeed.

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> I do not know when this code is useful...
> 
> If autoksyms.h were missing, build should have already failed because
> include/{linux,asm-generic}/export.h need it.
> 
> Maybe for standalone test?
> Or, in order to make this script self-contained?

I agree it isn't very useful. Proof: it was wrong and wouldn't have 
worked as intended. So the best fix might be to simply remove that line.



> 
> 
>  scripts/adjust_autoksyms.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index 513da1a..a52210b 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -49,7 +49,7 @@ case "${KCONFIG_CONFIG}" in
>  esac
>  
>  # In case it doesn't exist yet...
> -if [ -e "$cur_ksyms_file" ]; then touch "$cur_ksyms_file"; fi
> +if [ ! -e "$cur_ksyms_file" ]; then touch "$cur_ksyms_file"; fi
>  
>  # Generate a new ksym list file with symbols needed by the current
>  # set of modules.
> -- 
> 2.7.4
> 
> 
