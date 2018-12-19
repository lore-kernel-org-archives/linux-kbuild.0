Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55494 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728199AbeLSRVb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Dec 2018 12:21:31 -0500
Date: Wed, 19 Dec 2018 11:21:27 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] kbuild: use -flive-patching when CONFIG_LIVEPATCH is
 enabled
Message-ID: <20181219172127.o753af7pkrsttcgl@treble>
References: <20181219141744.32392-1-mbenes@suse.cz>
 <20181219165428.5udrppedpdvf2u7k@treble>
 <nycvar.YFH.7.76.1812191756450.17216@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.1812191756450.17216@cbobk.fhfr.pm>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, jeyu@kernel.org, pmladek@suse.com, linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 19, 2018 at 05:58:53PM +0100, Jiri Kosina wrote:
> On Wed, 19 Dec 2018, Josh Poimboeuf wrote:
> 
> > This option only makes sense for source-based patch generation, so isn't 
> > it a bit premature to make this change without proper source-based patch 
> > tooling?
> 
> The reality is though that before the full-fledged patch tooling exists, 
> people are actually already writing livepatches by hand, so this option is 
> useful for them.

Fair enough.

Though, upstream, almost everybody seems to use kpatch-build, for which
this patch doesn't help.  And people will continue to do so until we
have decent source-based tooling.  Will the klp-convert patches be
revived soon?

-- 
Josh
