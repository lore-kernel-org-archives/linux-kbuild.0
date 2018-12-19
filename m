Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60240 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728205AbeLSSKu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Dec 2018 13:10:50 -0500
Date: Wed, 19 Dec 2018 19:10:47 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] kbuild: use -flive-patching when CONFIG_LIVEPATCH is
 enabled
In-Reply-To: <20181219172127.o753af7pkrsttcgl@treble>
Message-ID: <nycvar.YFH.7.76.1812191909490.17216@cbobk.fhfr.pm>
References: <20181219141744.32392-1-mbenes@suse.cz> <20181219165428.5udrppedpdvf2u7k@treble> <nycvar.YFH.7.76.1812191756450.17216@cbobk.fhfr.pm> <20181219172127.o753af7pkrsttcgl@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Miroslav Benes <mbenes@suse.cz>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, jeyu@kernel.org, pmladek@suse.com, linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, Joao Moreira <jmoreira@suse.de>

On Wed, 19 Dec 2018, Josh Poimboeuf wrote:

> > > This option only makes sense for source-based patch generation, so isn't 
> > > it a bit premature to make this change without proper source-based patch 
> > > tooling?
> > 
> > The reality is though that before the full-fledged patch tooling exists, 
> > people are actually already writing livepatches by hand, so this option is 
> > useful for them.
> 
> Fair enough.
> 
> Though, upstream, almost everybody seems to use kpatch-build, for which
> this patch doesn't help.  And people will continue to do so until we
> have decent source-based tooling.  Will the klp-convert patches be
> revived soon?

Let me add Joao, who's working on that.

Joao, I think you had something basically ready for upstream exposure, 
right?

Thanks,

-- 
Jiri Kosina
SUSE Labs
