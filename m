Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:32061 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbgADDg0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 22:36:26 -0500
MIME-Version: 1.0
References: <20200103175915.26663-1-masahiroy@kernel.org> <20200103175915.26663-12-masahiroy@kernel.org>
 <20200103195205.GC21515@ravnborg.org>
In-Reply-To: <20200103195205.GC21515@ravnborg.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 Jan 2020 12:35:37 +0900
Message-ID: <CAK7LNAQXx0RGutdOe4JFLTbjm7=cx9aEKQ-823-irED4SyCmMA@mail.gmail.com>
Subject: Re: [PATCH 11/12] initramfs: refactor the initramfs build rules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Sam,

On Sat, Jan 4, 2020 at 4:52 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Mashahiro.
>
> I just browsed this fine patchset and noticed...
> >
> > -#####
> > -# Generate the initramfs cpio archive
> > +ramfs-input := $(shell echo $(CONFIG_INITRAMFS_SOURCE))
> > +cpio-data :=
> > +
> > +ifeq ($(words $(ramfs-input)),0)
> > +
> > +# If CONFIG_INITRAMFS_SOURCE is empty, generate a small initramfs with the
> > +# default contents.
> > +ramfs-input := $(srctree)/$(src)/default_cpio_list
> > +
> > +else ifeq ($(words $(ramfs-input)),1)
> > +# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
> > +# .cpio or .cpio.*, use it directly as an initramfs.
> > +ifneq ($(filter %.cpio,$(ramfs-input)),)
> > +cpio-data := $(ramfs-input)
> > +endif
>
> This part will now work if the file is named foo.cpio.bar.
> $(findstring .cpio, should be used and not $(filter %.cpio
> At least if the comment describes the intended behaviour.


The 'foo.cpio.bar' is taken care of
by ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)

I admit the comment was confusing.


I will clarify the comments as follows:



# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
# .cpio, use it directly as an initramfs.
ifneq ($(filter %.cpio,$(ramfs-input)),)
cpio-data := $(ramfs-input)
endif

# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
# .cpio.*, use it directly as an initramfs, and avoid double compression.
ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
cpio-data := $(ramfs-input)
compress-y := shipped
endif






> > +
> > +ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
> > +cpio-data := $(ramfs-input)
> > +# If the specified archive is suffixed with .cpio.* (i.e. already compressed),
> > +# we do not double-compress it.
> > +compress-y := shipped
> > +endif
> > +
> > +endif
>
>
>         Sam










--
Best Regards
Masahiro Yamada
