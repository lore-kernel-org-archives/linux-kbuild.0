Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:34883 "EHLO
        mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932418AbdEKR0H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 May 2017 13:26:07 -0400
Received: by mail-pf0-f177.google.com with SMTP id n23so12113875pfb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 May 2017 10:26:07 -0700 (PDT)
Date: Thu, 11 May 2017 10:25:59 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH 1/2] kbuild: cleanup signing keys with mrproper
Message-ID: <20170511102559.52de2854@xeon-e3>
In-Reply-To: <CAK7LNAR8fr21ZkjsC4C57XuAp8WQWarHgawjSMdYFU65cF2PxA@mail.gmail.com>
References: <20170414215450.18307-1-sthemmin@microsoft.com>
        <20170414215450.18307-2-sthemmin@microsoft.com>
        <CAK7LNAR8fr21ZkjsC4C57XuAp8WQWarHgawjSMdYFU65cF2PxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, David Woodhouse <dwmw2@infradead.org>, David Howells <dhowells@redhat.com>

On Wed, 3 May 2017 13:37:08 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> +CC David Woodhouse
> +CC David Howells
> 
> 
> 2017-04-15 6:54 GMT+09:00 Stephen Hemminger <stephen@networkplumber.org>:
> > When 'make mrproper' is run it was supposed to remove the signing
> > keys in the certs directory, but only the filename is given
> > rather than the pathanme which is necessary to cause cleanup.
> >
> > Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
> > ---
> >  Makefile | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index efa267a92ba6..04ca211552f7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1274,9 +1274,9 @@ MRPROPER_DIRS  += include/config usr/include include/generated          \
> >                   arch/*/include/generated .tmp_objdiff
> >  MRPROPER_FILES += .config .config.old .version .old_version \
> >                   Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
> > -                 signing_key.pem signing_key.priv signing_key.x509     \
> > -                 x509.genkey extra_certificates signing_key.x509.keyid \
> > -                 signing_key.x509.signer vmlinux-gdb.py
> > +                 certs/signing_key.pem certs/signing_key.priv certs/signing_key.x509   \
> > +                 certs/x509.genkey certs/extra_certificates certs/signing_key.x509.keyid \
> > +                 certs/signing_key.x509.signer vmlinux-gdb.py
> >  
> 
> The logic seems quite simple,
> but I am not quite sure which file is still valid?
> 
> 
> [1] signing_key.pem - OK, this should be certs/signing_key.pem
>                          and removed by 'make mrproper'
> 
> [2] signing_key.priv - deprecated by commit fb1179499134 ?
> 
> [3] signing_key.x509 - OK, this should be certs/signing_key.x509
>                          and removed by 'make mrproper'
> 
> [4] x509.genkey - this is an intermediate file for generating signing_key.pem,
>                   but unneeded for installing external modules.
>                   Does it make more sense to delete this by 'make clean'?
> 
> [5] extra_certificates - I am not sure where this is generated, and used
> 
> [6] siging_key.x509.keyid - same as [5]
> 
> [7] signing_key.x509.signer - same as [5]

Retested with current Linus tree:

After build, these files are present:
	signing_key.x509

This file is never cleaned up by clean or proper.

The changes that I think are necessary:
     certs/extra_certificates is no longer used, remove it from Makefile

     certs/signing_key.x509 should be removed by mrproper

     

