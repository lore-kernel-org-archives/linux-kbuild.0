Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from miranda.se.axis.com ([193.13.178.8]:46189 "EHLO
	miranda.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752042AbYAGHJ1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Jan 2008 02:09:27 -0500
From: "Mikael Starvik" <mikael.starvik@axis.com>
Subject: RE: [Patch 4/8] CRIS: Remove 'TOPDIR' from Makefiles
Date: Mon, 7 Jan 2008 08:08:52 +0100
Message-ID: <BFECAF9E178F144FAEF2BF4CE739C66804C402EA@exmail1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <BFECAF9E178F144FAEF2BF4CE739C668057FD0ED@exmail1.se.axis.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Sam Ravnborg' <sam@ravnborg.org>, 'WANG Cong' <xiyou.wangcong@gmail.com>
Cc: Mikael Starvik <mikael.starvik@axis.com>, 'LKML' <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, 'Andrew Morton' <akpm@osdl.org>, dev-etrax <dev-etrax@axis.com>

>PS. Mikael - should Jesper be mentioned in MAINTAINERS?

Yes, that is a good idea. Down the road Jesper will take over maintainership
I guess.

-----Original Message-----
From: Sam Ravnborg [mailto:sam@ravnborg.org] 
Sent: Tuesday, January 01, 2008 11:20 AM
To: WANG Cong
Cc: Mikael Starvik; LKML; linux-kbuild@vger.kernel.org; Andrew Morton;
dev-etrax
Subject: Re: [Patch 4/8] CRIS: Remove 'TOPDIR' from Makefiles


On Tue, Jan 01, 2008 at 03:29:22PM +0800, WANG Cong wrote:
> 
> TOPDIR is obsolete, use objtree instead.
> This patch removes TOPDIR from all Cris Makefiles.
> 
> Cc: Mikael Starvik <starvik@axis.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
> 
> ---
> 
> diff --git a/arch/cris/arch-v32/boot/compressed/Makefile
b/arch/cris/arch-v32/boot/compressed/Makefile
> index 9f77eda..8586922 100644
> --- a/arch/cris/arch-v32/boot/compressed/Makefile
> +++ b/arch/cris/arch-v32/boot/compressed/Makefile
> @@ -7,7 +7,7 @@
>  target = $(target_compressed_dir)
>  src    = $(src_compressed_dir)
>  
> -CC = gcc-cris -mlinux -march=v32 -I $(TOPDIR)/include
> +CC = gcc-cris -mlinux -march=v32 -I $(objtree)/include

As in the mips case the right fix is to use:
> +CC = gcc-cris -mlinux -march=v32 -Iinclude -Iinclude2

In this way we pick up the includes also in the O=..
case.

PS. Mikael - should Jesper be mentioned in MAINTAINERS?

	Sam

