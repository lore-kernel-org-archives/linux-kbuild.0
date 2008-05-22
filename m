Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:52461 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751980AbYEVGXN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 May 2008 02:23:13 -0400
Date: Wed, 21 May 2008 23:22:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [2.6 patch] run all userspace headers through unifdef
Message-Id: <20080521232243.bca09103.akpm@linux-foundation.org>
In-Reply-To: <20080521174143.GE15355@cs181133002.pp.htv.fi>
References: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain>
	<20080520000835.80f7b14a.akpm@linux-foundation.org>
	<alpine.LFD.1.10.0805210434180.7101@localhost.localdomain>
	<20080521014337.1543ff20.akpm@linux-foundation.org>
	<1211360434.21380.319.camel@pmac.infradead.org>
	<20080521100245.GC18352@cs181133002.pp.htv.fi>
	<1211366874.21380.341.camel@pmac.infradead.org>
	<20080521174143.GE15355@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, sam@ravnborg.org, "Robert P. J. Day" <rpjday@crashcourse.ca>, kbuild devel list <linux-kbuild@vger.kernel.org>

On Wed, 21 May 2008 20:41:43 +0300 Adrian Bunk <bunk@kernel.org> wrote:

> Facts:
> - installing userspace headers is nothing that is required as part of a 
>   normal kernel build
> - unifdef is relatively fast
> - there are sometimes patches moving headers from header-y to unifdef-y 
>   or the other way round
> 
> Instead of constantly seeing headers moving between header-y and 
> unifdef-y this patch removes unifdef-y and runs all userspace headers 
> through unifdef.
> 
> It also contains some unrelated sorting corrections in the Kbuild files 
> since I used GNU sort for the semi-automatic conversion of the Kbuild 
> files.
> 
> Signed-off-by: Adrian Bunk <bunk@kernel.org>
> 
> ---
> 
>  include/asm-alpha/Kbuild              |   11 
>  include/asm-arm/Kbuild                |    2 
>  include/asm-cris/Kbuild               |    5 
>  include/asm-frv/Kbuild                |    5 
>  include/asm-generic/Kbuild            |    9 
>  include/asm-generic/Kbuild.asm        |   61 +--
>  include/asm-ia64/Kbuild               |    9 
>  include/asm-parisc/Kbuild             |    2 
>  include/asm-powerpc/Kbuild            |   59 +--
>  include/asm-s390/Kbuild               |    7 
>  include/asm-sh/Kbuild                 |    9 
>  include/asm-sparc/Kbuild              |    7 
>  include/asm-sparc64/Kbuild            |    5 
>  include/asm-x86/Kbuild                |   27 -
>  include/linux/Kbuild                  |  399 ++++++++++++--------------
>  include/linux/byteorder/Kbuild        |    6 
>  include/linux/dvb/Kbuild              |    7 
>  include/linux/netfilter/Kbuild        |   17 -
>  include/linux/netfilter_arp/Kbuild    |    3 
>  include/linux/netfilter_bridge/Kbuild |    5 
>  include/linux/netfilter_ipv4/Kbuild   |    5 
>  include/linux/netfilter_ipv6/Kbuild   |    3 
>  include/linux/nfsd/Kbuild             |   12 
>  include/linux/sunrpc/Kbuild           |    2 
>  include/sound/Kbuild                  |    9 
>  include/video/Kbuild                  |    4 
>  scripts/Makefile.headersinst          |   27 -
>  27 files changed, 343 insertions(+), 374 deletions(-)

This is going to be a bit of a pain for everyone - people are forever
patching those Kbuild files.

Is there a way in which we can do this in stages?  Treat header-y in
the same manner as unifdef-y, then get all the unifdef-y's switched over
to header-y and once that is done, remove the "treat header-y in the same
manner as unifdef-y" support?
