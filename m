Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34374 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935042AbeB1Vr0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Feb 2018 16:47:26 -0500
Subject: Re: [PATCH v3] Documentation: Update ncurses package names for
 menuconfig
References: <CAK-=9LoRtOjN9_jCxtHf_fLeh3NpW6KOgYNuD09PKbDkCaCajg@mail.gmail.com>
 <1519853553-10626-1-git-send-email-arvindprasanna@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a83b79e2-3db1-efb4-9122-46708b36b58a@infradead.org>
Date: Wed, 28 Feb 2018 13:47:22 -0800
MIME-Version: 1.0
In-Reply-To: <1519853553-10626-1-git-send-email-arvindprasanna@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Prasanna <arvindprasanna@gmail.com>
Cc: Philippe Ombredanne <pombredanne@nexb.com>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/28/2018 01:32 PM, Arvind Prasanna wrote:
> The package name is ncurses-devel for Redhat based distros
> and libncurses-dev for Debian based distros.
> 
> Signed-off-by: Arvind Prasanna <arvindprasanna@gmail.com>

Thanks. Looks good to me.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> 
> Changes in v3:
> - Fix a package name in the commit message.
> 
> Changes in v2:
> - Add a missing echo as pointed out by one of the reviewers.
> 
>  scripts/kconfig/lxdialog/check-lxdialog.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
>  scripts/kconfig/lxdialog/check-lxdialog.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
> index a10bd9d..6c0bcd9 100755
> --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> @@ -55,7 +55,8 @@ EOF
>  	    echo " *** required header files."                            1>&2
>  	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
>  	    echo " *** "                                                  1>&2
> -	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
> +	    echo " *** Install ncurses (ncurses-devel or libncurses-dev " 1>&2
> +	    echo " *** depending on your distribution) and try again."    1>&2
>  	    echo " *** "                                                  1>&2
>  	    exit 1
>  	fi
> 


-- 
~Randy
