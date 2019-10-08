Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39453 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbfJHQKH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 12:10:07 -0400
Date: Tue, 8 Oct 2019 17:10:01 +0100
From: Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH RFC] kconfig: add hvconfig for Linux on Hyper-V
Message-ID: <20191008161001.lwiduq4mlyjumw5b@debian>
References: <20191008131508.21189-1-liuw@liuw.name>
 <CAK7LNAQpszkwtp2mAfoPajkRi0SHPspivWn9sUsxO0oua2X6NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQpszkwtp2mAfoPajkRi0SHPspivWn9sUsxO0oua2X6NQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Wei Liu <wei.liu@kernel.org>, Linux on Hyper-V List <linux-hyperv@vger.kernel.org>, Linux Kernel List <linux-kernel@vger.kernel.org>, Linux Kconfig List <linux-kbuild@vger.kernel.org>, Wei Liu <liuwe@microsoft.com>

On Wed, Oct 09, 2019 at 01:03:19AM +0900, Masahiro Yamada wrote:
[...]
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index ef2f2336c469..2ee46301b22e 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -104,6 +104,10 @@ PHONY += xenconfig
> >  xenconfig: xen.config
> >         @:
> >
> > +PHONY += hvconfig
> > +hvconfig: hv_guest.config
> > +       @:
> > +
> 
> 
> Does this need to be hooked up to kconfig Makefile?
> 

It is not strictly necessary. Just thought it would be nice to follow
existing examples.

> In my understanding, this code provides
> "make hvconfig" as a shorthand for "make hv_guest.config"
> 

Yes that's correct.

> Please do not do this.
> 
> 
> See "xenconfig" as a bad example.
> 
> "make xenconfig" is a shorthand of "make xen.config".
> This exists to save just one character typing.
> 
> 
> If I allow this, people would push more and more random pointless shorthands,
> which are essentially unrelated to kconfig.
> 
> 
> kvmconfig and xenconfig are just historical mistakes.
> 
> 
> Please drop the changes to scripts/kconfig/Makefile.

OK.

> 
> Also, please do not use misleading "kconfig:" for the subject prefix.
> You can use the subject prefix "hyper-v:" or something.
> 

OK.

Wei.
