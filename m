Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f173.google.com ([209.85.214.173]:41033 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbeJEDs0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Oct 2018 23:48:26 -0400
Date: Thu, 4 Oct 2018 13:53:19 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [kconfig-sat] [ANN] init-kconfig - easy way to embrace Linux's
 kconfig
Message-ID: <20181004205319.GO5238@garbanzo.do-not-panic.com>
References: <20181004200249.GL5238@garbanzo.do-not-panic.com>
 <20181004200859.GA10237@localhost>
 <20181004203950.GN5238@garbanzo.do-not-panic.com>
 <20181004204117.GA10640@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181004204117.GA10640@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Petr Vorel <pvorel@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Johannes Berg <johannes@sipsolutions.net>, Valentin Rothberg <valentinrothberg@gmail.com>, Vegard Nossum <vegard.nossum@oracle.com>, Felix Fietkau <nbd@nbd.name>, kconfig-sat@googlegroups.com

On Thu, Oct 04, 2018 at 01:41:18PM -0700, Josh Triplett wrote:
> I would *love* to see Kconfig in Linux evolved to be more easily reused.

This *can* happen. Let me itemize a few things off of my head I think
would need to be done as its at least fresh in my head now:

All we need from scripts/Kbuild.include is filechk and kecho (what I
have in my scripts/Kbuild.include). This could be moved to
scripts/Kbuild.basic, and so would make sync'ing easier.

The scripts/kconfig/Makefile would need a respective modifications to
make it work independently, see my scripts/kconfig/Makefile. Perhaps
the biggest pain was resolving the target for
scripts/kconfig/.mconf-cfg. If somehow we end up with a file which could
work for both environments we're set.

Other than this we'd need a simple script, say scripts/copy-kconfig.sh
which would copy over only those files I took from scripts/kconfig.

There's a few things to consider for a split copy / demo:

  * versioning *is not* part of kconfig
  * object building *is not* part of kconfig

But the problem I faced was that to demo kconfig I had to use *something*
for versioning and object building. The object building is simple, and
the versioning scheme was just copied from Linux.

What I ended up with the smallest demo I could come up with.

  Luis
