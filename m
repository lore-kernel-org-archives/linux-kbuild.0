Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37389 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753528AbbJOH1Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2015 03:27:16 -0400
Subject: Re: [PATCH] scripts/kconfig/Makefile: Fix KBUILD_DEFCONFIG check when
 building with O=
References: <1444889150-23609-1-git-send-email-mpe@ellerman.id.au>
From: Michal Marek <mmarek@suse.com>
Message-ID: <561F5552.4070902@suse.com>
Date: Thu, 15 Oct 2015 09:27:14 +0200
MIME-Version: 1.0
In-Reply-To: <1444889150-23609-1-git-send-email-mpe@ellerman.id.au>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@ozlabs.org, Olof Johannsson <olof@lixom.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

Dne 15.10.2015 v 08:05 Michael Ellerman napsal(a):
> My recent commit d2036f30cfe1 ("scripts/kconfig/Makefile: Allow
> KBUILD_DEFCONFIG to be a target"), contained a bug in that when it
> checks if KBUILD_DEFCONFIG is a file it forgets to prepend $(srctree) to
> the path.
> 
> This causes the build to fail when building out of tree (with O=), and
> when the value of KBUILD_DEFCONFIG is 'defconfig'. In that case we will
> fail to find the 'defconfig' file, because we look in the build
> directory not $(srctree), and so we will call Make again with
> 'defconfig' as the target. From there we loop infinitely calling 'make
> defconfig' again and again.
> 
> The fix is simple, we need to look for the file under $(srctree).
> 
> Fixes: d2036f30cfe1 ("scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be a target")
> Reported-by: Olof Johansson <olof@lixom.net>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Michal Marek <mmarek@suse.com>

I could have spotted it myself :-/.

Michal

