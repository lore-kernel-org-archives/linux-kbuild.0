Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60174 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751170AbbJBHrK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Oct 2015 03:47:10 -0400
In-Reply-To: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au>
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC, 1/2] scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be a target
Message-Id: <20151002074708.CF4DC14076A@ozlabs.org>
Date: Fri,  2 Oct 2015 17:47:08 +1000 (AEST)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Cc: mmarek@suse.com, linux-kernel@vger.kernel.org, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org

On Wed, 2015-23-09 at 05:40:34 UTC, Michael Ellerman wrote:
> Arch Makefiles can set KBUILD_DEFCONFIG to tell kbuild the name of the
> defconfig that should be built by default.
> 
> However currently there is an assumption that KBUILD_DEFCONFIG points to
> a file at arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG).
> 
> We would like to use a target, using merge_config, as our defconfig, so
> adapt the logic in scripts/kconfig/Makefile to allow that.
> 
> To minimise the chance of breaking anything, we first check if
> KBUILD_DEFCONFIG is a file, and if so we do the old logic. If it's not a
> file, then we call the top-level Makefile with KBUILD_DEFCONFIG as the
> target.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Acked-by: Michal Marek <mmarek@suse.com>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/d2036f30cfe1daa19e63ce75

cheers
