Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48541 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932299Ab0JAOFN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Oct 2010 10:05:13 -0400
Message-ID: <4CA5EA97.3060405@suse.cz>
Date: Fri, 01 Oct 2010 16:05:11 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] Kbuild: Treat KBUILD_DEFCONFIG=old as request to
 use .config as the base
References: <20100913143830.GK2919@stro.at>  <4C8E3B15.2040807@suse.cz> <1284436209.5323.744.camel@localhost>
In-Reply-To: <1284436209.5323.744.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org, Bastian Blank <waldi@debian.org>

On 14.9.2010 05:50, Ben Hutchings wrote:
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
> This should work as a substitute for Debian's updateoldconfig.
> 
> Ben.
> 
>  scripts/kconfig/Makefile |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index cef3f75..19558a7 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -112,9 +112,13 @@ defconfig: $(obj)/conf
>  ifeq ($(KBUILD_DEFCONFIG),)
>  	$< --defconfig $(Kconfig)
>  else
> +ifeq ($(KBUILD_DEFCONFIG),old)
> +	$< --defconfig=.config $(Kconfig)
> +else
>  	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
>  	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
>  endif
> +endif

KBUILD_DEFCONFIG is an internal variable used by arch Makefiles to
select the defconfig file, it should not be abused for a completely
different purpose. Also, the same can be achieved with 'make
oldnoconfig' or 'yes "" | make oldconfig' in older kernels.

Michal
