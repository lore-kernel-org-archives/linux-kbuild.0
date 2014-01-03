Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60930 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750863AbaACQ3n (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jan 2014 11:29:43 -0500
Message-ID: <52C6E56F.8000903@suse.cz>
Date: Fri, 03 Jan 2014 17:29:35 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] deb-pkg: Fix building for MIPS big-endian or ARM
 OABI
References: <1386254351.3000.22.camel@deadeye.wl.decadent.org.uk>
In-Reply-To: <1386254351.3000.22.camel@deadeye.wl.decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Debian kernel maintainers <debian-kernel@lists.debian.org>

On 2013-12-05 15:39, Ben Hutchings wrote:
> These commands will mysteriously fail:
> 
> $ make ARCH=arm versatile_defconfig
> [...]
> $ make ARCH=arm deb-pkg
> [...]
> make[1]: *** [deb-pkg] Error 1
> make: *** [deb-pkg] Error 2
> 
> The Debian architecture selection for these kernel architectures does
> 'grep FOO=y $KCONFIG_CONFIG && echo bar', and after 'set -e' this
> aborts the script if grep does not find the given config symbol.
> 
> Fixes: 10f26fa64200 ('build, deb-pkg: select userland architecture based on UTS_MACHINE')
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  scripts/package/builddeb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to kbuild.git#misc, thanks.

Michal

