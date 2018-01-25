Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3.wp.pl ([212.77.101.9]:23128 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751200AbeAYTru (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jan 2018 14:47:50 -0500
Date: Thu, 25 Jan 2018 11:47:40 -0800
From: Jakub Kicinski <kubakici@wp.pl>
Subject: Re: Mutli-directory module Makefiles
Message-ID: <20180125114740.076b7583@cakuba.netronome.com>
In-Reply-To: <CAK7LNAT9_fB_NaZzT3fLsaoJhMmKeb3=m98w_=oLGN3Y9uSz=w@mail.gmail.com>
References: <20180122134607.00d77101@cakuba.netronome.com>
        <CAK7LNAT9_fB_NaZzT3fLsaoJhMmKeb3=m98w_=oLGN3Y9uSz=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, 25 Jan 2018 22:08:34 +0900, Masahiro Yamada wrote:
> 2018-01-23 6:46 GMT+09:00 Jakub Kicinski <kubakici@wp.pl>:
> > Hi!
> >
> > in drivers/net/ethernet/netronome/nfp there is a module which is built
> > from C sources in 4 directories.  What is the best way to handle that?
> >
> > Currently we just add all the objects in one Makefile:
> >
> > nfp-objs := \
> >             nfpcore/nfp6000_pcie.o \
> >             nfpcore/nfp_cppcore.o \
> > etc.  
> 
> 
> I recommend you to refactor the Makefile,
> adding Makefiles into nfpcore, nic, flower, bpf sub-directories.
> 
> 
> Also, ifeq is ugly,
> can you rewrite like follows?
> 
> 
> nfp-$(CONFIG_NFP_APP_FLOWER)    += flower/
> nfp-$(CONFIG_BPF_SYSCALL)       += bpf/
> nfp-$(CONFIG_NFP_DEBUG)         += nfp_net_debugfs.o

I tried that, but what do I build inside the directories?  I tried
adding the objects to nfp-objs, building a lib.a, or trying to build a
separate object, but it's either ignored or dependency is not obeyed
and nfp.o complains that the subdirectory object doesn't exist yet
when the build of subdirectory finishes later :(

Sorry for not spotting your response earlier!  It went into Spam for
some reason :S

