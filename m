Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:45508 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753142AbZJYLGO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 25 Oct 2009 07:06:14 -0400
Date: Sun, 25 Oct 2009 12:06:17 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Compiling 2.6.31/31.5
Message-ID: <20091025110617.GA6691@merkur.ravnborg.org>
References: <55e03a0a0910242038x5656e9c0ve28bb28023dc1432@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55e03a0a0910242038x5656e9c0ve28bb28023dc1432@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: MySQL Student <mysqlstudent@gmail.com>
Cc: linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

lkml cc:ed. linux-kbuild is for the build system - not build errors.

	Sam

On Sat, Oct 24, 2009 at 11:38:14PM -0400, MySQL Student wrote:
> Hi,
> 
> I'm having difficulty compiling 2.6.31 and 2.6.31.5 on x86 with
> gcc-3.4.4 and binutils-2.20.51.0.2:
> 
>   AS      arch/x86/lib/thunk_32.o
>   CC      arch/x86/lib/usercopy_32.o
>   AR      arch/x86/lib/lib.a
>   LD      vmlinux.o
>   MODPOST vmlinux.o
>   GEN     .version
>   CHK     include/linux/compile.h
>   UPD     include/linux/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> drivers/built-in.o: In function `con_init':
> vt.c:(.init.text+0x3c5b): undefined reference to `.L1446'
> make: *** [.tmp_vmlinux1] Error 1
> 
> This is built from "make defconfig".
> 
> I've seen a few references to this searching, but all the solutions
> didn't apply or didn't work. What could I be doing wrong? Could this
> be a problem with my development tools?
> 
> Thanks,
> Alex
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
