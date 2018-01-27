Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:44493 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751450AbeA0APu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jan 2018 19:15:50 -0500
MIME-Version: 1.0
In-Reply-To: <20171127213423.27218-21-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org> <20171127213423.27218-21-andi@firstfloor.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 27 Jan 2018 01:15:49 +0100
Message-ID: <CAK8P3a3RQhiEkh6uUjdX-juXggNdZxvxRPJbE6M3e6Dy-ycGxw@mail.gmail.com>
Subject: Re: [PATCH 20/21] Kbuild, lto: Add Link Time Optimization support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, samitolvanen@google.com, alxmtvv@gmail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>

On Mon, Nov 27, 2017 at 10:34 PM, Andi Kleen <andi@firstfloor.org> wrote:
> From: Andi Kleen <ak@linux.intel.com>
> - Add a new LDFINAL variable that controls the final link
> for vmlinux or module. In this case we call gcc-ld instead
> of ld, to run the LTO step.

When I tried this out on allmodconfig (following the lwn article), I ran into
a number of warnings:

WARNING: modpost: missing MODULE_LICENSE() in
drivers/isdn/hardware/eicon/diva_mnt.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/isdn/hysdn/hysdn.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/vhost/vhost_scsi.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/scsi/pcmcia/qlogic_cs.o
see include/linux/module.h for more information
WARNING: modpost: missing MODULE_LICENSE() in drivers/scsi/pcmcia/fdomain_cs.o
...

These are apparently all compound modules that do have a valid
license, and modinfo
shows it correctly:

modinfo build/tmp/drivers/isdn/hardware/eicon/diva_mnt.ko
filename:
/home/arnd/arm-soc/build/tmp/drivers/isdn/hardware/eicon/diva_mnt.ko
license:        GPL
author:         Cytronics & Melware, Eicon Networks
description:    Maint driver for Eicon DIVA Server cards
...

but something in the LTO build conuses modpost to the point that it doesn't
see it.

I also get 131 errors in x86 allmodconfig along the lines of

/git/arm-soc/include/linux/slab.h:298:0: error: type of
'kmalloc_caches' does not match original declaration
[-Werror=lto-type-mismatch]
 extern struct kmem_cache *kmalloc_caches[KMALLOC_SHIFT_HIGH + 1];
 /git/arm-soc/mm/slab_common.c:958:1: note: 'kmalloc_caches' was
previously declared here
 EXPORT_SYMBOL(kmalloc_caches);

/git/arm-soc/include/linux/seq_file.h:109:5: error: type of 'seq_open'
does not match original declaration [-Werror=lto-type-mismatc
h]
 int seq_open(struct file *, const struct seq_operations *);
     ^
/git/arm-soc/fs/seq_file.c:48:0: note: 'seq_open' was previously declared here
 int seq_open(struct file *file, const struct seq_operations *op)

I found a fix for some of these issues attached to
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83954
but am still doing more randconfig build testing.

        Arnd
