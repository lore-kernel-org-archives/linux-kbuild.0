Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59301 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752349Ab1LKU10 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Dec 2011 15:27:26 -0500
Date: Sun, 11 Dec 2011 21:27:22 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: fix warnings by specifing format arguments
Message-ID: <20111211202722.GA21410@sepie.suse.cz>
References: <alpine.LNX.2.00.1110221317230.59156@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1110221317230.59156@linux>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Foley <pefoley2@verizon.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>

On Sat, Oct 22, 2011 at 01:19:02PM -0400, Peter Foley wrote:
> Specify format arguments to fix warnings.
> 
>   HOSTCC  scripts/kconfig/gconf.o
> /usr/src/lto/scripts/kconfig/gconf.c: In function 'on_introduction1_activate':
> /usr/src/lto/scripts/kconfig/gconf.c:686:6: warning: format not a string literal and no format arguments
> /usr/src/lto/scripts/kconfig/gconf.c: In function 'on_about1_activate':
> /usr/src/lto/scripts/kconfig/gconf.c:704:6: warning: format not a string literal and no format arguments
> /usr/src/lto/scripts/kconfig/gconf.c: In function 'on_license1_activate':
> /usr/src/lto/scripts/kconfig/gconf.c:723:6: warning: format not a string literal and no format arguments
> 
> Signed-off-by: Peter Foley <pefoley2@verizon.net>
> ---
>  scripts/kconfig/gconf.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Applied to kbuild.git#kconfig.

Michal
