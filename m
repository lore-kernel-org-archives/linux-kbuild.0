Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37655 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753151AbbIWJuy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2015 05:50:54 -0400
Subject: Re: [RFC PATCH 1/2] scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG
 to be a target
References: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au>
From: Michal Marek <mmarek@suse.com>
Message-ID: <560275FC.60104@suse.com>
Date: Wed, 23 Sep 2015 11:50:52 +0200
MIME-Version: 1.0
In-Reply-To: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On 2015-09-23 07:40, Michael Ellerman wrote:
> +else ifneq ($(wildcard arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
>  	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
>  	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
> +else
> +	@$(kecho) "*** Default configuration is based on target '$(KBUILD_DEFCONFIG)'"
> +	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
>  endif

What is the anticipated usage of this? The patch is not needed to make

  make ppc64le_defconfig

work with the second patch. If it was, this would create a loop anyway.

Michal
