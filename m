Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:60212 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbgACTwI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 14:52:08 -0500
Date: Fri, 3 Jan 2020 20:52:05 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 11/12] initramfs: refactor the initramfs build rules
Message-ID: <20200103195205.GC21515@ravnborg.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
 <20200103175915.26663-12-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103175915.26663-12-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-kernel@vger.kernel.org

Hi Mashahiro.

I just browsed this fine patchset and noticed...
>  
> -#####
> -# Generate the initramfs cpio archive
> +ramfs-input := $(shell echo $(CONFIG_INITRAMFS_SOURCE))
> +cpio-data :=
> +
> +ifeq ($(words $(ramfs-input)),0)
> +
> +# If CONFIG_INITRAMFS_SOURCE is empty, generate a small initramfs with the
> +# default contents.
> +ramfs-input := $(srctree)/$(src)/default_cpio_list
> +
> +else ifeq ($(words $(ramfs-input)),1)
> +# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
> +# .cpio or .cpio.*, use it directly as an initramfs.
> +ifneq ($(filter %.cpio,$(ramfs-input)),)
> +cpio-data := $(ramfs-input)
> +endif

This part will now work if the file is named foo.cpio.bar.
$(findstring .cpio, should be used and not $(filter %.cpio
At least if the comment describes the intended behaviour.

> +
> +ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
> +cpio-data := $(ramfs-input)
> +# If the specified archive is suffixed with .cpio.* (i.e. already compressed),
> +# we do not double-compress it.
> +compress-y := shipped
> +endif
> +
> +endif


	Sam
