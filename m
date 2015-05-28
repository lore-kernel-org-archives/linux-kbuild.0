Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud2.xs4all.net ([194.109.24.29]:40031 "EHLO
	lb3-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753430AbbE1Ilc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 04:41:32 -0400
Message-ID: <1432802488.8508.26.camel@x220>
Subject: Re: [PATCH 1/5] init/Kconfig: Fix break in middle of EXPERT menu
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 28 May 2015 10:41:28 +0200
In-Reply-To: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2015-05-14 at 08:35 -0700, Josh Triplett wrote:
> Commit e1abf2cc8d5 ("bpf: Fix the build on BPF_SYSCALL=y &&
> !CONFIG_TRACING kernels, make it more configurable") made BPF_SYSCALL no
> longer hidden with !EXPERT, but left it in the middle of the EXPERT
> menu.  menuconfig stops putting config items under a submenu once it
> encounters an item that doesn't depend on the menu's config item, so

s/that/whose visibility/?

As far as I can see what suffices for menuconfig is that the visibility
of an item is influenced by that menu's symbol. Whether that item is
actually not set at all (the depends on case) or only not visible (the
"prompt" if EXPERT case) doesn't matter here.

> this caused the remainder of the EXPERT menu to spill out into the
> containing menu around it.  Fix by moving BPF_SYSCALL before the EXPERT
> menu, next to BPF.
> 
> Fixes: e1abf2cc8d5 ("bpf: Fix the build on BPF_SYSCALL=y && !CONFIG_TRACING kernels, make it more configurable")
> Signed-off-by: Josh Triplett <josh@joshtriplett.org>

Provided you somehow tweak the commit explanation to reflect my remark:
    Acked-by: Paul Bolle <pebolle@tiscali.nl>

>  init/Kconfig | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Who's in charge of init/Kconfig?

Thanks,


Paul Bolle

