Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:56422 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbeKHESp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Nov 2018 23:18:45 -0500
Date: Wed, 7 Nov 2018 10:47:05 -0800
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] scripts/kconfig/merge_config: don't redefine 'y' to 'm'
Message-ID: <20181107184705.GA95239@fedora.eng.vmware.com>
References: <20181102114119.23859-1-anders.roxell@linaro.org>
 <CAK7LNARda14b9_8Yh7vC2PFa_w=yw+qD0YTriAVQ_Aw5PoXkNw@mail.gmail.com>
 <CADYN=9L2kEVJMiVRBUBU7z4B4_YrvkNefCE5FO3qjACgm=FugA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADYN=9L2kEVJMiVRBUBU7z4B4_YrvkNefCE5FO3qjACgm=FugA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On Tue, Nov 06, 2018 at 02:57:40PM +0100, Anders Roxell wrote:
> On Mon, 5 Nov 2018 at 09:35, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Hi Anders,
> >
> > On Fri, Nov 2, 2018 at 8:41 PM Anders Roxell <anders.roxell@linaro.org> wrote:
> > >
> > > In today's merge_config.sh the order of the config fragment files dictates
> > > the output of a config option. With this approach we will get different
> > > .config files depending on the order of the config fragment files.
> > > Adding a switch to add precedence for builtin over modules, this will
> > > make the .config file the same
> > >
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > > ---
> >
> > I think this patch makes sense.
> >
> > Just in case, could you please provide me the context of the discussion?
> 
> For instance we don't want to force X86 from DRM=y to DRM=m, when
> enabling selftest, that would surely break somebody's setup and you also
> don't want to force ARM64 from DRM=m to DRM=y, that seems
> unnecessary for a big subsystem like DRM.
> 
> >
> > Does the real problem exist in the kernel tree,
> 
> Not that I'm aware about.
> 
> Cheers,
> Anders
> 
> > or for local fragment files?

This is really about ordering of fragment files and not "making a symbol
'less'", I think were Arnd's words.

So, doing something like:

$ make arm64-selftest.config drm.config

where arm64-selftest.config defines DRM=y and drm.config defines DRM=m, the
result should be "DRM=y".

So the first step is to make merge_config.sh support it. A follow up step would
be to integrate this into the kernel Makefile system if we determine this is the
correct behavior, or to provide a parameter if we don't want to change the
default behavior.


-- 
Darren Hart
VMware Open Source Technology Center
