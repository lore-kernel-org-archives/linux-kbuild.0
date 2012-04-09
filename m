Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from jdl.com ([208.123.74.7]:54949 "EHLO jdl.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752046Ab2DINtM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Apr 2012 09:49:12 -0400
Message-Id: <E1SHExs-0001cI-6E@jdl.com>
Subject: Re: [PATCH] Rename _B to _XBYTE in libfdt_env.h.
In-reply-to: <1333434921-14153-1-git-send-email-andree@andree.sk>
References: <E1SEpdZ-0000dW-8Z@jdl.com> <1333434921-14153-1-git-send-email-andree@andree.sk>
Date: Mon, 09 Apr 2012 08:49:04 -0500
From: Jon Loeliger <jdl@jdl.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrej Krutak <andree@andree.sk>
Cc: devtree-discuss@lists.ozlabs.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

> The _B macro is also defined by cygwin in ctype.h.
> Rename _B to _XBYTE to better avoid name collisions.
> 
> Signed-off-by: Andrej Krutak <andree@andree.sk>
> ---
>  scripts/dtc/libfdt/libfdt_env.h |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/dtc/libfdt/libfdt_env.h b/scripts/dtc/libfdt/libfdt_env.h
> index 449bf60..4ec8565 100644
> --- a/scripts/dtc/libfdt/libfdt_env.h
> +++ b/scripts/dtc/libfdt/libfdt_env.h

This patch is against the kernel _copy_ of the DTC sources.
Technically, we'll need it against the upstream sources
as found here:

    git://git.jdl.com/software/dtc.git

Later, the patch will appear in the kernel when it updates
with a newer source drop.

Thanks,
jdl
