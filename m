Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:54127 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGKrT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jan 2020 05:47:19 -0500
MIME-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org> <20200104150238.19834-2-masahiroy@kernel.org>
In-Reply-To: <20200104150238.19834-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 Jan 2020 19:46:29 +0900
Message-ID: <CAK7LNAS+SfvRRu=WHzh6eghBNusMiEaxuqj0L+5jnA0W=HOy+Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] initramfs: replace klibcdirs in Makefile with FORCE
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>, "H. Peter Anvin" <hpa@zytor.com>

(+CC: Ben Hutchings, H. Peter Anvin)

On Sun, Jan 5, 2020 at 12:03 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'klibcdirs' was added by commit d39a206bc35d ("kbuild: rebuild initramfs
> if content of initramfs changes"). If this is just a matter of forcing
> execution of the recipe line, we can replace it with FORCE.
>
> I do not understand the purpose of
>
>    $(deps_initramfs): klibcdirs


Perhaps, the 'klibcdirs' target might be intended
to control the directory descending
in case klibc is dropped in the kernel tree.

Anyway, klibc is built independently
of Linux kernel, and this 'klibcdirs' target
is just a no-op stub as far as the kernel tree is concerned.

Clean it up.


> Remove it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - New patch (I forgot to submit this in v1 series)
>
>  usr/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/usr/Makefile b/usr/Makefile
> index e6f7cb2f81db..55c942da01cd 100644
> --- a/usr/Makefile
> +++ b/usr/Makefile
> @@ -3,9 +3,6 @@
>  # kbuild file for usr/ - including initramfs image
>  #
>
> -klibcdirs:;
> -PHONY += klibcdirs
> -
>  suffix_y = $(subst $\",,$(CONFIG_INITRAMFS_COMPRESSION))
>  datafile_y = initramfs_data.cpio$(suffix_y)
>  datafile_d_y = .$(datafile_y).d
> @@ -50,13 +47,12 @@ targets := $(datafile_y)
>  # do not try to update files included in initramfs
>  $(deps_initramfs): ;
>
> -$(deps_initramfs): klibcdirs
>  # We rebuild initramfs_data.cpio if:
>  # 1) Any included file is newer than initramfs_data.cpio
>  # 2) There are changes in which files are included (added or deleted)
>  # 3) If gen_init_cpio are newer than initramfs_data.cpio
>  # 4) Arguments to gen_initramfs.sh changes
> -$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) klibcdirs
> +$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) FORCE
>         $(Q)$(initramfs) -l $(ramfs-input) > $(obj)/$(datafile_d_y)
>         $(call if_changed,initfs)
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
