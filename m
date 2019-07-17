Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:59430 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfGQOoN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 10:44:13 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <seth.forshee@canonical.com>)
        id 1hnlAC-0003E9-12
        for linux-kbuild@vger.kernel.org; Wed, 17 Jul 2019 14:44:12 +0000
Received: by mail-io1-f72.google.com with SMTP id y13so27313413iol.6
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jul 2019 07:44:11 -0700 (PDT)
Date: Wed, 17 Jul 2019 09:44:07 -0500
From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [kbuild:kbuild 5/19] drivers/atm/eni.o: warning: objtool:
 eni_init_one()+0xe42: indirect call found in RETPOLINE build
Message-ID: <20190717144407.GU5418@ubuntu-xps13>
References: <201907160706.9xUSQ36X%lkp@intel.com>
 <CAK7LNATqxQnen2Tzcici8GnJuc-qNeCYcCYisKM2OkNow1FDnQ@mail.gmail.com>
 <20190716124249.GP5418@ubuntu-xps13>
 <20190716162014.iu47g6o7ralxhcf5@treble>
 <CAK7LNASDRFuwC4jxvjgs0bUU8EJ93k1_eQTynK2wRfJCRfmFjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASDRFuwC4jxvjgs0bUU8EJ93k1_eQTynK2wRfJCRfmFjw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kbuild test robot <lkp@intel.com>

On Wed, Jul 17, 2019 at 11:52:07AM +0900, Masahiro Yamada wrote:
> On Wed, Jul 17, 2019 at 1:20 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > On Tue, Jul 16, 2019 at 07:42:49AM -0500, Seth Forshee wrote:
> > > On Tue, Jul 16, 2019 at 03:57:24PM +0900, Masahiro Yamada wrote:
> > > > (+ Josh Poimboeuf)
> > > >
> > > > On Tue, Jul 16, 2019 at 8:44 AM kbuild test robot <lkp@intel.com> wrote:
> > > > >
> > > > > tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> > > > > head:   0ff0c3753e06c0420c80dac1b0187a442b372acb
> > > > > commit: 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f [5/19] kbuild: add -fcf-protection=none to retpoline flags
> > > > > config: x86_64-randconfig-s2-07160214 (attached as .config)
> > > > > compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> > > > > reproduce:
> > > > >         git checkout 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f
> > > > >         # save the attached .config to linux build tree
> > > > >         make ARCH=x86_64
> > > >
> > > > 0-day bot reports objtool warnings with the following applied:
> > > > https://patchwork.kernel.org/patch/11037379/
> > > >
> > > > I have no idea about objtool.
> > > >
> > > > Is it better to drop this patch for now?
> > >
> > > I'm surprised that the change would have any impact on a build with
> > > gcc-4.9, since -fcf-protection seems to have been introduced in gcc-8. I
> > > guess there's no full build log that would let us see the actual flags
> > > passed to the compiler.
> > >
> > > I'll try to reproduce this result. If you think the patch should be
> > > dropped in the meantime, that's fine.
> >
> > The problem with this patch is that it's breaking the following check in
> > arch/x86/Makefile.  GCC 4.9 doesn't support retpolines, so it's supposed
> > to fail with the below error.
> >
> > ifdef CONFIG_RETPOLINE
> > ifeq ($(RETPOLINE_CFLAGS),)
> >         @echo "You are building kernel with non-retpoline compiler." >&2
> >         @echo "Please update your compiler." >&2
> >         @false
> > endif
> > endif
> >
> > Maybe the flags should be placed in another variable other than
> > RETPOLINE_CFLAGS.
> 
> 
> 
> Josh,
> Thanks. You are right.
> 
> 
> Seth,
> I think you can add the flag to KBUILD_CFLAGS.
> 
> If you want to make sure this does not affect non-retpoline
> build, you can surround the code with ifdef.
> 
> ifdef CONFIG_RETPOLINE
> KBUILD_CFLAGS  += $(call cc-option,-fcf-protection=none)
> endif

Thanks, I'll send an updated patch shortly.

Seth
