Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:47524 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752752AbbBFPuL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Feb 2015 10:50:11 -0500
Date: Fri, 6 Feb 2015 07:50:09 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-3.18.y: Add =?utf-8?Q?=22kconfig?=
 =?utf-8?Q?=3A_Fix_warning_=22=E2=80=98jump?= =?utf-8?B?4oCZ?= may be used
 uninitialized""
Message-ID: <20150206155009.GA23394@kroah.com>
References: <CA+icZUWoPxGgzgjiMEJ1PPXjRp_oa8_C0tceTyK4Ao6_Hco+Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+icZUWoPxGgzgjiMEJ1PPXjRp_oa8_C0tceTyK4Ao6_Hco+Gw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Peter =?iso-8859-1?Q?K=FCmmel?= <syntheticpp@gmx.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Feb 06, 2015 at 04:40:28PM +0100, Sedat Dilek wrote:
> Hi,
> 
> I see the following...
> 
> $ yes "" | make oldconfig && make silentoldconfig </dev/null
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   SHIPPED scripts/kconfig/zconf.tab.c
>   SHIPPED scripts/kconfig/zconf.lex.c
>   SHIPPED scripts/kconfig/zconf.hash.c
>   HOSTCC  scripts/kconfig/zconf.tab.o
> In file included from scripts/kconfig/zconf.tab.c:2537:0:
> scripts/kconfig/menu.c: In function ‘get_symbol_str’:
> scripts/kconfig/menu.c:590:18: warning: ‘jump’ may be used
> uninitialized in this function [-Wmaybe-uninitialized]
>      jump->offset = strlen(r->s);
>                   ^
> scripts/kconfig/menu.c:551:19: note: ‘jump’ was declared here
>   struct jump_key *jump;
>                    ^
>   HOSTLD  scripts/kconfig/conf
> scripts/kconfig/conf --oldconfig Kconfig
> #
> # configuration written to .config
> #
> scripts/kconfig/conf --silentoldconfig Kconfig
> 
> The fix is "kconfig: Fix warning "‘jump’ may be used uninitialized"" upstream.


Sure, what's the git commit id of the patch in Linus's tree?  That's
annoying to me as well, thanks for reminding me about it.

greg k-h
