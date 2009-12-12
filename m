Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:36346 "HELO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S932140AbZLMBO5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Dec 2009 20:14:57 -0500
Date: Sat, 12 Dec 2009 15:22:08 -0800 (PST)
From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [resend][GIT PULL] kbuild updates for 2.6.33
In-Reply-To: <20091212144730.GA6788@sepie.suse.cz>
Message-ID: <alpine.LFD.2.00.0912121519490.3535@localhost.localdomain>
References: <20091212144730.GA6788@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org



On Sat, 12 Dec 2009, Michal Marek wrote:
> 
>   git://repo.or.cz/linux-kbuild.git for-33
> 
> 
>  .gitignore                                      |    7 +-
>  Documentation/dontdiff                          |    1 +
>  Documentation/kbuild/kbuild.txt                 |   14 +
>  Documentation/kbuild/kconfig.txt                |    8 +-
> ...

That's not at all the diffstat I get. I just get

 Makefile                 |    5 +-
 include/linux/Kbuild     |    1 +
 scripts/Makefile.lib     |    2 +-
 scripts/mod/modpost.c    |  164 ----------------------------------------------
 scripts/mod/modpost.h    |    3 -
 scripts/package/Makefile |   20 +++++-
 scripts/package/buildtar |    6 ++-
 7 files changed, 28 insertions(+), 173 deletions(-)

Not pulled, since I suspect you meant me to pull something else.

		Linus
