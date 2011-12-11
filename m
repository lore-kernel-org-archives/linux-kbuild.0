Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59364 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752269Ab1LKUaH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Dec 2011 15:30:07 -0500
Date: Sun, 11 Dec 2011 21:30:06 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: fix set but not used warnings
Message-ID: <20111211203005.GB21410@sepie.suse.cz>
References: <alpine.LNX.2.00.1110221400040.59156@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1110221400040.59156@linux>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Foley <pefoley2@verizon.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>

On Sat, Oct 22, 2011 at 02:01:24PM -0400, Peter Foley wrote:
> Remove set but not used variables to fix warnings.
> 
>   HOSTCC  scripts/kconfig/gconf.o
> /usr/src/lto/scripts/kconfig/gconf.c: In function 'change_sym_value':
> /usr/src/lto/scripts/kconfig/gconf.c:833:11: warning: variable 'oldval' set but not used [-Wunused-but-set-variable]
> /usr/src/lto/scripts/kconfig/gconf.c: In function 'update_tree':
> /usr/src/lto/scripts/kconfig/gconf.c:1281:19: warning: variable 'prop' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Peter Foley <pefoley2@verizon.net>
> ---
>  scripts/kconfig/gconf.c |    5 +----
>  1 files changed, 1 insertions(+), 4 deletions(-)

Applied to kbuild.git#kconfig.

Michal
