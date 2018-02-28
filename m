Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:51498 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932580AbeB1Rb0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Feb 2018 12:31:26 -0500
Subject: Re: [PATCH] Documentation: Update ncurses package names for
 menuconfig
References: <1519801192-31201-1-git-send-email-arvindprasanna@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <43a91eb4-646a-b4d8-5b3d-b0bfde0019d9@infradead.org>
Date: Wed, 28 Feb 2018 09:31:24 -0800
MIME-Version: 1.0
In-Reply-To: <1519801192-31201-1-git-send-email-arvindprasanna@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Prasanna <arvindprasanna@gmail.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/27/2018 10:59 PM, Arvind Prasanna wrote:
> The package name is ncurses-devel for Redhat based distros
> and libncurses-devel for Debian based distros.

      ^^^^^^^^^^^^^^^^ That's not what the patch says. Please clarify.

> 
> Signed-off-by: Arvind Prasanna <arvindprasanna@gmail.com>
> ---
>  scripts/kconfig/lxdialog/check-lxdialog.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
> index a10bd9d..4353e40 100755
> --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> @@ -55,7 +55,8 @@ EOF
>  	    echo " *** required header files."                            1>&2
>  	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
>  	    echo " *** "                                                  1>&2
> -	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
> +	    echo " *** Install ncurses (ncurses-devel or libncurses-dev   1>&2
> +	           *** depending on your distribution) and try again."    1>&2
>  	    echo " *** "                                                  1>&2
>  	    exit 1
>  	fi
> 

thanks,
-- 
~Randy
