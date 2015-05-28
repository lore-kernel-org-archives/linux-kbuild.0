Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud2.xs4all.net ([194.109.24.21]:47058 "EHLO
	lb1-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751548AbbE1JYd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 05:24:33 -0400
Message-ID: <1432805068.8508.40.camel@x220>
Subject: Re: [PATCH 2/5] init/Kconfig: Split expert menu into a separate
 file, init/Kconfig.expert
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 28 May 2015 11:24:28 +0200
In-Reply-To: <ed62348c630f41247468e45eb83063d606709cd4.1431589089.git.josh@joshtriplett.org>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
	 <ed62348c630f41247468e45eb83063d606709cd4.1431589089.git.josh@joshtriplett.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>, Andrea Arcangeli <aarcange@redhat.com>, Pavel Emelyanov <xemul@parallels.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2015-05-14 at 08:35 -0700, Josh Triplett wrote:
> The expert menu frequently gets broken by a config item in the middle
> that leaves off the "if EXPERT" from its prompt.  This results in the
> remainder of the menu spilling out into the parent "General setup" menu.
> Move the entire expert menu into a separate Kconfig file,
> init/Kconfig.expert, to make this harder to do accidentally, and to
> break up the exceedingly long init/Kconfig a bit.
> 
> Signed-off-by: Josh Triplett <josh@joshtriplett.org>

> --- a/init/Kconfig
> +++ b/init/Kconfig

> -config ADVISE_SYSCALLS
> -	bool "Enable madvise/fadvise syscalls" if EXPERT
> -	default y
> -	help
> -	  This option enables the madvise and fadvise syscalls, used by
> -	  applications to advise the kernel about their future memory or file
> -	  usage, improving performance. If building an embedded system where no
> -	  applications use these syscalls, you can disable this option to save
> -	  space.
> -

In the meantime commit d6c6ae9b71ad ("userfaultfd: buildsystem
activation") added config USERFAULTFD here in linux-next, pushing
PCI_QUIRKS out of the menu.

USERFAULTFD defaults to 'y'. Perhaps it was intended to make (its
prompt) visible only if EXPERT is set. Andrea, Pavel, Andrew?

> -config PCI_QUIRKS
> -	default y
> -	bool "Enable PCI quirk workarounds" if EXPERT
> -	depends on PCI
> -	help
> -	  This enables workarounds for various PCI chipset
> -	  bugs/quirks. Disable this only if your target machine is
> -	  unaffected by PCI quirks.

Anyhow, applied cleanly with d6c6ae9b71ad reverted.

I had to jump through some hoops to convince myself the patch really
only moves some lines around (except for the added source statement).
There's no git diff option that could have helped me here, is there?

I'm sure we'll figure out a way to handle config USERFAULTFD, so
    Acked-by: Paul Bolle <pebolle@tiscali.nl>

Thanks,


Paul Bolle

