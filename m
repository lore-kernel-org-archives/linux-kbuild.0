Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46102 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753445Ab2HaOq4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Aug 2012 10:46:56 -0400
Date: Fri, 31 Aug 2012 16:46:54 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] scripts/kernel-doc: drop maintainer
Message-ID: <20120831144654.GC11531@sepie.suse.cz>
References: <50219DD4.7020406@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50219DD4.7020406@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Rob Landley <rob@landley.net>

On Tue, Aug 07, 2012 at 03:59:32PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> Drop maintainership of scripts/kernel-doc.
> Patches can go thru the kbuild tree.
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc:	Michal Marek <mmarek@suse.cz>
> Cc:	Rob Landley <rob@landley.net>
> ---
>  MAINTAINERS |    5 -----
>  1 file changed, 5 deletions(-)
> 
> 
> Michal, is this OK with you?
> If so, please merge, and then I have 3 patches to
> scripts/kernel-doc for you (from someone else).

Sorry for the delay. Yes, it's OK with me, I can apply the patches to
the kbuild.git tree. Your review is of course appreciated.

Michal
