Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:54846 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754734AbcDYPVu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 11:21:50 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] kbuild: call adjust_autoksyms.sh from source directory
Date: Mon, 25 Apr 2016 17:20:22 +0200
Message-ID: <7296896.uWM0Bol2Ir@wuerfel>
In-Reply-To: <alpine.LFD.2.20.1604251015000.5091@knanqh.ubzr>
References: <1461590265-1397577-1-git-send-email-arnd@arndb.de> <alpine.LFD.2.20.1604251015000.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>

On Monday 25 April 2016 10:18:56 Nicolas Pitre wrote:
> On Mon, 25 Apr 2016, Arnd Bergmann wrote:
> 
> > When building with separate object trees, scripts/adjust_autoksyms.sh
> > cannot be called from the object directory:
> > 
> > /bin/bash: scripts/adjust_autoksyms.sh: No such file or directory
> > 
> > This adds a $(src) prefix, as we do for all other shell scripts.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I posted fixes for all those problems already, plus another.
> 
> You may grab them all at once from this branch where I committed them on 
> top of Michal's kbuild branch:
> 
>         git://git.linaro.org/people/nicolas.pitre/linux kbuild
> 

Ok, thanks!

I liked the idea of moving the samples from Documentation to samples,
but with your patches that is no longer required to fix the bug.

If the respective maintainers want to pick up my patches 2 and 3
independent of your fixes, I can rewrite the changelogs for those,
otherwise I'll just drop them all.

	Arnd
