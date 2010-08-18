Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail1-relais-roc.national.inria.fr ([192.134.164.82]:29819 "EHLO
	mail1-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752564Ab0HRJVf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Aug 2010 05:21:35 -0400
Message-ID: <4C6BA524.2040308@inria.fr>
Date: Wed, 18 Aug 2010 11:17:24 +0200
From: Brice Goglin <Brice.Goglin@inria.fr>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Makefile: "make kernelrelease" should show the correct
 full kernel version
References: <20100628030507.5187.95903.sendpatchset@localhost.localdomain> <20100628030516.5187.49089.sendpatchset@localhost.localdomain> <4C6B88A5.4050305@inria.fr> <4C6B957C.1090308@redhat.com> <4C6B9BFE.1030308@inria.fr> <4C6BA077.2080306@redhat.com> <4C6B9F53.6040100@inria.fr> <4C6BA5C7.5010207@redhat.com>
In-Reply-To: <4C6BA5C7.5010207@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cong Wang <amwang@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Rientjes <rientjes@google.com>, Michal Marek <mmarek@suse.cz>

Le 18/08/2010 11:20, Cong Wang a écrit :
> diff --git a/Makefile b/Makefile
> index f3bdff8..25da252 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1408,8 +1408,8 @@ checkstack:
>  	$(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
>  	$(PERL) $(src)/scripts/checkstack.pl $(CHECKSTACK_ARCH)
>  
> -kernelrelease: include/config/kernel.release
> -	@echo $(KERNELRELEASE)
> +kernelrelease:
> +	@echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
>  
>  kernelversion:
>  	@echo $(KERNELVERSION)
>   

It works, thanks!

Tested-by: Brice Goglin <Brice.Goglin@inria.fr>

Brice

