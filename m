Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:51659 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760793AbZDJLWY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Apr 2009 07:22:24 -0400
Date: Fri, 10 Apr 2009 13:24:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] fix spurious initramfs rebuild
Message-ID: <20090410112429.GA22370@uranus.ravnborg.org>
References: <1234201792.1951.26.camel@sakura.staff.proxad.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1234201792.1951.26.camel@sakura.staff.proxad.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maxime Bizon <mbizon@freebox.fr>
Cc: linux-kbuild@vger.kernel.org

On Mon, Feb 09, 2009 at 06:49:52PM +0100, Maxime Bizon wrote:
> 
> Hello,
> 
> 
> 
> When gen_initramfs_list is used to generate make dependencies, it
> includes symbolic links, for which make tracks the link target. Any
> change to that target will cause an initramfs rebuild, even if the
> symlink points to something outside of the initramfs directory.
> 
> If the target happens to be /tmp, the rebuild occurs for each kernel
> build, since gen_initramfs_list uses mktemp...
> 
> Proposed way to fix it is to omit symbolic links from generated
> dependencies, but this has a small drawback: changing perm/owner on a
> symlink will go unnoticed.
> 
> 
> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> 
> --- linux-2.6.28.4/scripts/gen_initramfs_list.sh.old	2009-02-09 18:22:26.000000000 +0100
> +++ linux-2.6.28.4/scripts/gen_initramfs_list.sh	2009-02-09 18:21:54.000000000 +0100
> @@ -97,7 +97,7 @@
>  }
>  
>  list_parse() {
> -	echo "$1 \\"
> +	[ ! -L "$1" ] && echo "$1 \\" || :
>  }
>  
>  # for each file print a line in following format

Applied.

	Sam
