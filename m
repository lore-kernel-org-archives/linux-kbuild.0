Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgF0VVU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 17:21:20 -0400
Date: Sat, 27 Jun 2020 23:21:12 +0200
From: Domenico Andreoli <domenico.andreoli@linux.com>
Subject: Re: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
Message-ID: <20200627212112.GA18721@dumbo>
References: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
 <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
 <20200626214026.GB25753@dumbo>
 <CAK7LNASRL6jaaxZreFK+iDmFHuw6QLSS0n08gZNkyhcsNunAnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASRL6jaaxZreFK+iDmFHuw6QLSS0n08gZNkyhcsNunAnw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>

On Sat, Jun 27, 2020 at 09:02:52PM +0900, Masahiro Yamada wrote:
> On Sat, Jun 27, 2020 at 6:40 AM Domenico Andreoli <domenico.andreoli@linux.com> wrote:
> > On Fri, Jun 26, 2020 at 03:16:58PM +0900, Masahiro Yamada wrote:
> > > On Fri, Jun 26, 2020 at 5:51 AM Domenico Andreoli <domenico.andreoli@linux.com> wrote:

[...]

> > > >
> > > > +       arm64)
> > > > +               make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> > > > +               ;;
> > > > +esac
> > > > +
> > >
> > >
> > > Or, you can use INSTALL_PATH="${tmpdir}/boot"
> > > to make it shorter.
> >
> > This does not work, INSTALL_DTBS_PATH gets somehow defined along the
> > twisted path to buildtar and therefore needs to be explicitly specified
> > for the new destination.
> 
> It works.
> 
> See line 1002 of the top Makefile
> 
> export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)

Exactly. INSTALL_DTBS_PATH is _exported_ in the top Makefile.


This is what it seems to happen, in the order:

1. outer 'make dir-pkg'
   INSTALL_DTBS_PATH is exported with some content

2. control arrives to buildtar
   INSTALL_DTBS_PATH is there as environment variable

3. inner 'make INSTALL_PATH=${tmpdir}/boot dtbs_install'
   INSTALL_DTBS_PATH is already set, therefore it is not modified


To make the inner invocation work, I see these two options:

1. 'make INSTALL_DTBS_PATH= INSTALL_PATH=${tmpdir}/boot dtb_install' (untested)

2. 'make INSTALL_DTBS_PATH=${tmpdir}/boot/dtbs/${KERNELRELEASE} dtbs_install'

I chose 2 but I can switch to 1, if you prefer. No problem.


Regards,
Domenico

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
