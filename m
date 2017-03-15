Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33285 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751375AbdCOAxv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Mar 2017 20:53:51 -0400
Date: Wed, 15 Mar 2017 01:53:48 +0100
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH v2] firmware/Makefile: force recompilation if makefile
 changes
Message-ID: <20170315005348.GK28800@wotan.suse.de>
References: <20170118173156.16060-1-mcgrof@kernel.org>
 <20170123150727.4883-1-mcgrof@kernel.org>
 <CAK7LNASzfaBQVTk94=eZ347ZhkZVhqwjrqfhWOro8Cg7pCykKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASzfaBQVTk94=eZ347ZhkZVhqwjrqfhWOro8Cg7pCykKg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, ming.lei@canonical.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, teg@jklm.no, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>

On Sat, Mar 11, 2017 at 02:37:02PM +0900, Masahiro Yamada wrote:
> Hi Luis,
> 
> 
> 2017-01-24 0:07 GMT+09:00 Luis R. Rodriguez <mcgrof@kernel.org>:
> > If you modify the target asm we currently do not force the
> > recompilation of the firmware files. The target asm is in
> > the firmware/Makefile, peg this file as a dependency to
> > require re-compilation of firmware targets when the asm
> > changes.
> >
> > Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
> > ---
> >
> > Michal,
> >
> > I had this patch as part of my linker table series [0] but have split it
> > off as its a small atomic separate change and can go in separately. Greg
> > prefers this be reviewed by the kbuild tree so sending it your way.
> > This v2 has no modifications, just resending it to the kbuild tree.
> >
> > [0] https://lkml.kernel.org/r/20170115211057.17167-1-mcgrof@kernel.org
> >
> >  firmware/Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/firmware/Makefile b/firmware/Makefile
> > index e297e1b52636..fa3e81c2a97b 100644
> > --- a/firmware/Makefile
> > +++ b/firmware/Makefile
> > @@ -176,7 +176,8 @@ quiet_cmd_fwbin = MK_FW   $@
> >  wordsize_deps := $(wildcard include/config/64bit.h include/config/32bit.h \
> >                 include/config/ppc32.h include/config/ppc64.h \
> >                 include/config/superh32.h include/config/superh64.h \
> > -               include/config/x86_32.h include/config/x86_64.h)
> > +               include/config/x86_32.h include/config/x86_64.h \
> > +               firmware/Makefile)
> >
> >  $(patsubst %,$(obj)/%.gen.S, $(fw-shipped-y)): %: $(wordsize_deps)
> >         $(call cmd,fwbin,$(patsubst %.gen.S,%,$@))
> 
> 
> Why don't you use  $(call filechk,...) or $(call if_changed,...)
> instead of wordsize_deps ?

Care to send a patch?

  Luis
