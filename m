Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:32867 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752489Ab0HLWwt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Aug 2010 18:52:49 -0400
Date: Fri, 13 Aug 2010 00:50:31 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/2] kconfig: Fix warning: ignoring return value of
 'fwrite'
Message-ID: <20100812225031.GA19690@sepie.suse.cz>
References: <20100804220102.GA10534@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100804220102.GA10534@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jean Sacren <sakiwit@gmail.com>
Cc: Jiri Kosina <jkosina@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

On Wed, Aug 04, 2010 at 04:01:02PM -0600, Jean Sacren wrote:
> This fix facilitates fwrite() in both confdata.c and expr.c, either it
> succeeds in writing, or an error occurs, or the end of file is reached.
> 
> Signed-off-by: Jean Sacren <sakiwit@gmail.com>
> Cc: stable <stable@kernel.org>
> ---
>  scripts/kconfig/confdata.c |    6 +++---
>  scripts/kconfig/expr.c     |    2 +-
>  scripts/kconfig/lkc.h      |    7 +++++++
>  3 files changed, 11 insertions(+), 4 deletions(-)

I applied this and the second patch (sorry for the delay), but I dropped
the Cc: stable line. It's just a warning, nothing critical, and the
context is different in released kernels, so why bother Greg with
manually resolving conflicts.

Michal
