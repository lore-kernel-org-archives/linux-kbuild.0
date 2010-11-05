Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:35771 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751757Ab0KENgp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Nov 2010 09:36:45 -0400
Date: Fri, 5 Nov 2010 13:36:43 +0000
From: maximilian attems <maks@vostochny.stro.at>
Subject: Re: [PATCH] kbuild, deb-pkg: select userland architecture based on
	UTS_MACHINE
Message-ID: <20101105133643.GP15146@vostochny.stro.at>
References: <4CD406C7.8090801@asbjorn.biz> <1288963808-7057-1-git-send-email-asbjorn@asbjorn.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1288963808-7057-1-git-send-email-asbjorn@asbjorn.biz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, debian-kernel@lists.debian.org

On Fri, Nov 05, 2010 at 01:30:08PM +0000, Asbjoern Sloth Toennesen wrote:
> Instead of creating the debian package for the compiling userland,
> create it for a userland matching the kernel thats being compiled.
> 
> This patch supports all Lenny release architectures,
> and Linux-based architecture candidates for Squeeze.
> 
> If it can't find a proper Debian userspace it displays a warning,
> and fallback to let deb-gencontrol use the host's userspace arch.
> 
> Eg. with this patch the following make command:
> 
> 	make ARCH=i386 deb-pkg
> 
> will output an i386 Debian package instead of an amd64 one,
> when run on an amd64 machine.
> 
> Signed-off-by: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>

please add my ack as Debian linux-2.6 maintainer.

Acked-by: maximilian attems <max@stro.at>
> ---
>  scripts/package/builddeb |   35 ++++++++++++++++++++++++++++++++++-
>  1 files changed, 34 insertions(+), 1 deletions(-)
> 
