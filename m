Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725758AbeJEFBW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Oct 2018 01:01:22 -0400
Date: Thu, 4 Oct 2018 18:05:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [kconfig-sat] [ANN] init-kconfig - easy way to embrace Linux's
 kconfig
Message-ID: <20181004180555.0421b300@gandalf.local.home>
In-Reply-To: <20181004205319.GO5238@garbanzo.do-not-panic.com>
References: <20181004200249.GL5238@garbanzo.do-not-panic.com>
        <20181004200859.GA10237@localhost>
        <20181004203950.GN5238@garbanzo.do-not-panic.com>
        <20181004204117.GA10640@localhost>
        <20181004205319.GO5238@garbanzo.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Petr Vorel <pvorel@suse.cz>, Johannes Berg <johannes@sipsolutions.net>, Valentin Rothberg <valentinrothberg@gmail.com>, Vegard Nossum <vegard.nossum@oracle.com>, Felix Fietkau <nbd@nbd.name>, kconfig-sat@googlegroups.com

On Thu, 4 Oct 2018 13:53:19 -0700
Luis Chamberlain <mcgrof@kernel.org> wrote:

> On Thu, Oct 04, 2018 at 01:41:18PM -0700, Josh Triplett wrote:
> > I would *love* to see Kconfig in Linux evolved to be more easily reused.  
> 
> This *can* happen. Let me itemize a few things off of my head I think
> would need to be done as its at least fresh in my head now:
> 
> All we need from scripts/Kbuild.include is filechk and kecho (what I
> have in my scripts/Kbuild.include). This could be moved to
> scripts/Kbuild.basic, and so would make sync'ing easier.
> 
> The scripts/kconfig/Makefile would need a respective modifications to
> make it work independently, see my scripts/kconfig/Makefile. Perhaps
> the biggest pain was resolving the target for
> scripts/kconfig/.mconf-cfg. If somehow we end up with a file which could
> work for both environments we're set.
> 
> Other than this we'd need a simple script, say scripts/copy-kconfig.sh
> which would copy over only those files I took from scripts/kconfig.
> 
> There's a few things to consider for a split copy / demo:
> 
>   * versioning *is not* part of kconfig
>   * object building *is not* part of kconfig
> 
> But the problem I faced was that to demo kconfig I had to use *something*
> for versioning and object building. The object building is simple, and
> the versioning scheme was just copied from Linux.
> 
> What I ended up with the smallest demo I could come up with.
> 

Are you attending Linux Plumbers in Vancouver? Because I think this
would be a very interesting BoF there.

-- Steve
