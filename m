Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46972 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752536Ab1ANXlc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 18:41:32 -0500
Date: Sat, 15 Jan 2011 00:41:30 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] setlocalversion: update mercurial tag parsing
Message-ID: <20110114234130.GA27291@sepie.suse.cz>
References: <1294811632-23688-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1294811632-23688-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org, Mike Crowe <mcrowe@zipitwireless.com>

On Wed, Jan 12, 2011 at 12:53:52AM -0500, Mike Frysinger wrote:
> From: Mike Crowe <mcrowe@zipitwireless.com>
> 
> The tag output of hg doesn't quite match what setlocalversion currently
> expects, so update it to handle the latest format.
> 
> Signed-off-by: Mike Crowe <mcrowe@zipitwireless.com>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  scripts/setlocalversion |   14 +++++++++-----
>  1 files changed, 9 insertions(+), 5 deletions(-)

Thanks, applied to kbuild-2.6.git#misc.

Michal
