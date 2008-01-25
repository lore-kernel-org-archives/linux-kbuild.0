Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from krynn.se.axis.com ([193.13.178.10]:60780 "EHLO
	krynn.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753680AbYAYKFB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Jan 2008 05:05:01 -0500
Date: Fri, 25 Jan 2008 10:38:30 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH 26/77] CRIS: Remove 'TOPDIR' from Makefiles
Message-ID: <20080125093830.GX3912@axis.com>
References: <20080124215813.GA4204@uranus.ravnborg.org> <1201212238-4369-26-git-send-email-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1201212238-4369-26-git-send-email-sam@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, WANG Cong <xiyou.wangcong@gmail.com>, Mikael Starvik <mikael.starvik@axis.com>, Andreas Schwab <schwab@suse.de>

On Thu, Jan 24, 2008 at 11:03:07PM +0100, Sam Ravnborg wrote:
> From: WANG Cong <xiyou.wangcong@gmail.com>
> 
> This patch removes TOPDIR from Cris Makefiles.
> 
> Cc: Mikael Starvik <starvik@axis.com>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Andreas Schwab <schwab@suse.de>
> Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Tested-by: Jesper Nilsson <jesper.nilsson@axis.com>
> ---
>  arch/cris/arch-v32/boot/compressed/Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/cris/arch-v32/boot/compressed/Makefile b/arch/cris/arch-v32/boot/compressed/Makefile
> index 9f77eda..609692f 100644
> --- a/arch/cris/arch-v32/boot/compressed/Makefile
> +++ b/arch/cris/arch-v32/boot/compressed/Makefile
> @@ -7,7 +7,7 @@
>  target = $(target_compressed_dir)
>  src    = $(src_compressed_dir)
>  
> -CC = gcc-cris -mlinux -march=v32 -I $(TOPDIR)/include
> +CC = gcc-cris -mlinux -march=v32 $(LINUXINCLUDE)
>  CFLAGS = -O2
>  LD = gcc-cris -mlinux -march=v32 -nostdlib
>  OBJCOPY = objcopy-cris
> -- 
> 1.5.4.rc3.14.g44397

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
--
               Jesper Nilsson -- jesper.nilsson@axis.com
