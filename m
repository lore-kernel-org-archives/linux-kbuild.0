Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44354 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753249Ab0KKPh1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Nov 2010 10:37:27 -0500
Date: Thu, 11 Nov 2010 16:37:25 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild, deb-pkg: Fix build with paranoid umask
Message-ID: <20101111153725.GA7979@sepie.suse.cz>
References: <1288360550-26710-1-git-send-email-max@stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1288360550-26710-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org

On Fri, Oct 29, 2010 at 03:55:50PM +0200, maximilian attems wrote:
> umask 077
> make deb-pkg
> <snipp ..>
> dpkg-deb: building package `linux-image-2.6.36+' in `../linux-image-2.6.36+_2.6.36+-4_amd64.deb'.
> dpkg-deb: control directory has bad permissions 700 (must be >=0755 and <=0775)
> make[1]: *** [deb-pkg] Error 2
> 
> Reported-by: Bastian Blank <waldi@debian.org>
> Signed-off-by: maximilian attems <max@stro.at>
> ---
>  scripts/package/builddeb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Thanks, applied.

Michal 
