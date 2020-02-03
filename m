Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37577 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgBCUHB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 15:07:01 -0500
From: Arvind Sankar <nivedita@alum.mit.edu>
Date: Mon, 3 Feb 2020 15:06:58 -0500
Subject: Re: [PATCH] initramfs: do not show compression mode choice if
 INITRAMFS_SOURCE is empty
Message-ID: <20200203200656.GA455151@rani.riverdale.lan>
References: <20200203164708.17478-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200203164708.17478-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sam Ravnborg <sam@ravnborg.org>

On Tue, Feb 04, 2020 at 01:47:08AM +0900, Masahiro Yamada wrote:
> Since commit ddd09bcc899f ("initramfs: make compression options not
> depend on INITRAMFS_SOURCE"), Kconfig asks the compression mode for
> the built-in initramfs regardless of INITRAMFS_SOURCE.
> 
> It is technically simpler, but pointless from a UI perspective,
> Linus says [1].
> 
> When INITRAMFS_SOURCE is empty, usr/Makefile creates a tiny default
> cpio, which is so small that nobody cares about the compression.
> 
> This commit hides the Kconfig choice in that case. The default cpio
> is embedded without compression, which was the original behavior.
> 
> [1]: https://lkml.org/lkml/2020/2/1/160
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Would it be feasible to check if the kernel is going to be compressed,
i.e. one of the KERNEL_{GZIP,BZIP2,...} options other than
KERNEL_UNCOMPRESSED is set, and default built-in initramfs to
uncompressed in that case as well?

Thanks.
