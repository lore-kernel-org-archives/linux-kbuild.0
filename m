Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37545 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933153AbbENPq5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 May 2015 11:46:57 -0400
Date: Thu, 14 May 2015 08:46:51 -0700
From: josh@joshtriplett.org
Subject: Re: [PATCH 1/5] init/Kconfig: Fix break in middle of EXPERT menu
Message-ID: <20150514154651.GB27231@cloud>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 14, 2015 at 08:35:23AM -0700, Josh Triplett wrote:
> Commit e1abf2cc8d5 ("bpf: Fix the build on BPF_SYSCALL=y &&
> !CONFIG_TRACING kernels, make it more configurable") made BPF_SYSCALL no
> longer hidden with !EXPERT, but left it in the middle of the EXPERT
> menu.  menuconfig stops putting config items under a submenu once it
> encounters an item that doesn't depend on the menu's config item, so
> this caused the remainder of the EXPERT menu to spill out into the
> containing menu around it.  Fix by moving BPF_SYSCALL before the EXPERT
> menu, next to BPF.
> 
> Fixes: e1abf2cc8d5 ("bpf: Fix the build on BPF_SYSCALL=y && !CONFIG_TRACING kernels, make it more configurable")
> Signed-off-by: Josh Triplett <josh@joshtriplett.org>
> ---

This series should have been labeled as "v2".  Changes in v2: added CCs
to Michal Marek <mmarek@suse.cz> and linux-kbuild@vger.kernel.org, split
patch 4/4 into two patches, and added Paul's ack to those last two
patches.

>  init/Kconfig | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index dc24dec..e2f16f1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1341,6 +1341,16 @@ config HAVE_PCSPKR_PLATFORM
>  config BPF
>  	bool
>  
> +# syscall, maps, verifier
> +config BPF_SYSCALL
> +	bool "Enable bpf() system call"
> +	select ANON_INODES
> +	select BPF
> +	default n
> +	help
> +	  Enable the bpf() system call that allows to manipulate eBPF
> +	  programs and maps via file descriptors.
> +
>  menuconfig EXPERT
>  	bool "Configure standard kernel features (expert users)"
>  	# Unhide debug options, to make the on-by-default options visible
> @@ -1535,16 +1545,6 @@ config EVENTFD
>  
>  	  If unsure, say Y.
>  
> -# syscall, maps, verifier
> -config BPF_SYSCALL
> -	bool "Enable bpf() system call"
> -	select ANON_INODES
> -	select BPF
> -	default n
> -	help
> -	  Enable the bpf() system call that allows to manipulate eBPF
> -	  programs and maps via file descriptors.
> -
>  config SHMEM
>  	bool "Use full shmem filesystem" if EXPERT
>  	default y
> -- 
> 2.1.4
> 
