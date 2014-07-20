Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:54261 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753684AbaGTVFQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Jul 2014 17:05:16 -0400
Date: Sun, 20 Jul 2014 23:04:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: add support to generate LLVM bitcode files
Message-ID: <20140720210458.GA5019@ravnborg.org>
References: <1405733677-16650-1-git-send-email-viniciustinti@gmail.com>
 <20140720100239.GA3496@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140720100239.GA3496@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?iso-8859-1?Q?Vin=EDcius?= Tinti <viniciustinti@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Behan Webster <behanw@converseincode.com>

> >  
> > +ifeq ($(COMPILER),clang)
> > +quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
> > +cmd_cc_ll_c       = $(CC) $(c_flags) $(DISABLE_LTO) -fverbose-asm -emit-llvm -S -o $@ $<
> 
> Can we drop the test for COMPILER here too?
> Do -fverbose-asm make sense when generating .ll files?
> It looks like a leftover from what you copied.

Also  $(DISABLE_LTO) looks like a left-over.
It was added to avoid LTO when generating asm-offstes.s which
the original rule is also used for.
So this should be skipped too.

	Sam
