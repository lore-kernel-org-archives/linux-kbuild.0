Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51414 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732874AbeLTOq3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Dec 2018 09:46:29 -0500
Date: Thu, 20 Dec 2018 08:46:26 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] kbuild: use -flive-patching when CONFIG_LIVEPATCH is
 enabled
Message-ID: <20181220144626.2uwuzsmdowbrmxxq@treble>
References: <20181219141744.32392-1-mbenes@suse.cz>
 <20181219165428.5udrppedpdvf2u7k@treble>
 <nycvar.YFH.7.76.1812191756450.17216@cbobk.fhfr.pm>
 <20181219172127.o753af7pkrsttcgl@treble>
 <nycvar.YFH.7.76.1812191909490.17216@cbobk.fhfr.pm>
 <alpine.LSU.2.21.1812200919210.28185@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.1812200919210.28185@pobox.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Jiri Kosina <jikos@kernel.org>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, jeyu@kernel.org, pmladek@suse.com, linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, Joao Moreira <jmoreira@suse.de>

On Thu, Dec 20, 2018 at 09:33:05AM +0100, Miroslav Benes wrote:
> > > Though, upstream, almost everybody seems to use kpatch-build, for which
> > > this patch doesn't help.  And people will continue to do so until we
> > > have decent source-based tooling.  Will the klp-convert patches be
> > > revived soon?
> >
> > Let me add Joao, who's working on that.
> > 
> > Joao, I think you had something basically ready for upstream exposure, 
> > right?
> 
> I think that when Joao posted it a long time ago, the conclusion was that 
> it would be better to wait for the source-based tooling and have the 
> complete solution. I may misremember though.
> 
> If Josh thinks that it would be acceptable to have klp-convert merged even 
> without the tooling, I'm all for it.
> 
> We're about to start using it at SUSE and staying close to upstream would 
> definitely be better.

A complete toolchain should definitely be the end goal.

But as a usable first step, only *some* of the tooling is required,
since some of the steps can be done manually, right?

So starting out, for something usable, I believe the following would be
the bare minimum:

  * -flive-patching

  * The analysis tool which analyzes the -fdump-ipa-clones files

  * klp-convert

  * Documentation describing the end-to-end patch creation process,
    including the manual steps and how to use the above tools

Did I miss anything?

Then over time we can fill in the gaps (manual steps) with automation.

-- 
Josh
