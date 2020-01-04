Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:40680 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgADOQ2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 09:16:28 -0500
Date: Sat, 4 Jan 2020 15:16:23 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 11/12] initramfs: refactor the initramfs build rules
Message-ID: <20200104141623.GB17768@ravnborg.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
 <20200103175915.26663-12-masahiroy@kernel.org>
 <20200103195205.GC21515@ravnborg.org>
 <CAK7LNAQXx0RGutdOe4JFLTbjm7=cx9aEKQ-823-irED4SyCmMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQXx0RGutdOe4JFLTbjm7=cx9aEKQ-823-irED4SyCmMA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Masahiro.

> > > +else ifeq ($(words $(ramfs-input)),1)
> > > +# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
> > > +# .cpio or .cpio.*, use it directly as an initramfs.
> > > +ifneq ($(filter %.cpio,$(ramfs-input)),)
> > > +cpio-data := $(ramfs-input)
> > > +endif
> >
> > This part will now work if the file is named foo.cpio.bar.
> > $(findstring .cpio, should be used and not $(filter %.cpio
> > At least if the comment describes the intended behaviour.
> 
> 
> The 'foo.cpio.bar' is taken care of
> by ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
Clever, I only now realized how this worked.
> 
> I admit the comment was confusing.
> 
> 
> I will clarify the comments as follows:
> 
> 
> 
> # If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
> # .cpio, use it directly as an initramfs.
> ifneq ($(filter %.cpio,$(ramfs-input)),)
> cpio-data := $(ramfs-input)
> endif
> 
> # If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
> # .cpio.*, use it directly as an initramfs, and avoid double compression.
> ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
> cpio-data := $(ramfs-input)
> compress-y := shipped
> endif

Looks good.

	Sam
