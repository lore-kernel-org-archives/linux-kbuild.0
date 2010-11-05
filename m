Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shutemov.name ([188.40.19.243]:55176 "EHLO shutemov.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752462Ab0KEJB5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Nov 2010 05:01:57 -0400
Date: Fri, 5 Nov 2010 11:01:56 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH 1/2] kbuild: introduce ARCH_LIST for headers_install_all
Message-ID: <20101105090156.GA11777@shutemov.name>
References: <1288357441-23100-1-git-send-email-kirill@shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1288357441-23100-1-git-send-email-kirill@shutemov.name>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Woodhouse <dwmw2@infradead.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Does anybody care?

On Fri, Oct 29, 2010 at 04:04:00PM +0300, Kirill A. Shutsemov wrote:
> From: Kirill A. Shutemov <kirill@shutemov.name>
> 
> Using ARCH_LIST you can specify subset of architectures you want to get
> headers for.
> 
> Signed-off-by: Kirill A. Shutemov <kirill@shutemov.name>
> ---
>  Documentation/make/headers_install.txt |    5 +++--
>  scripts/headers.sh                     |    2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/make/headers_install.txt b/Documentation/make/headers_install.txt
> index f2481ca..1abace6 100644
> --- a/Documentation/make/headers_install.txt
> +++ b/Documentation/make/headers_install.txt
> @@ -39,8 +39,9 @@ INSTALL_HDR_PATH indicates where to install the headers.  It defaults to
>  The command "make headers_install_all" exports headers for all architectures
>  simultaneously.  (This is mostly of interest to distribution maintainers,
>  who create an architecture-independent tarball from the resulting include
> -directory.)  Remember to provide the appropriate linux/asm directory via "mv"
> -or "ln -s" before building a C library with headers exported this way.
> +directory.)  You also can use ARCH_LIST to specify list of architectures.
> +Remember to provide the appropriate linux/asm directory via "mv" or "ln -s"
> +before building a C library with headers exported this way.
>  
>  The kernel header export infrastructure is maintained by David Woodhouse
>  <dwmw2@infradead.org>.
> diff --git a/scripts/headers.sh b/scripts/headers.sh
> index 1ddcdd3..62bc527 100755
> --- a/scripts/headers.sh
> +++ b/scripts/headers.sh
> @@ -13,7 +13,7 @@ do_command()
>  	fi
>  }
>  
> -archs=$(ls ${srctree}/arch)
> +archs=${ARCH_LIST:-$(ls ${srctree}/arch)}
>  
>  for arch in ${archs}; do
>  	case ${arch} in
> -- 
> 1.7.3.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
 Kirill A. Shutemov
