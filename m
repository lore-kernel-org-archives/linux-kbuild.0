Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:35394 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751197AbcDYPbZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 11:31:25 -0400
Received: by mail-qg0-f51.google.com with SMTP id f74so77431072qge.2
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2016 08:31:25 -0700 (PDT)
Date: Mon, 25 Apr 2016 11:31:22 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 1/3] kbuild: call adjust_autoksyms.sh from source
 directory
In-Reply-To: <7296896.uWM0Bol2Ir@wuerfel>
Message-ID: <alpine.LFD.2.20.1604251122270.5091@knanqh.ubzr>
References: <1461590265-1397577-1-git-send-email-arnd@arndb.de> <alpine.LFD.2.20.1604251015000.5091@knanqh.ubzr> <7296896.uWM0Bol2Ir@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>

On Mon, 25 Apr 2016, Arnd Bergmann wrote:

> On Monday 25 April 2016 10:18:56 Nicolas Pitre wrote:
> > On Mon, 25 Apr 2016, Arnd Bergmann wrote:
> > 
> > > When building with separate object trees, scripts/adjust_autoksyms.sh
> > > cannot be called from the object directory:
> > > 
> > > /bin/bash: scripts/adjust_autoksyms.sh: No such file or directory
> > > 
> > > This adds a $(src) prefix, as we do for all other shell scripts.
> > > 
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > I posted fixes for all those problems already, plus another.
> > 
> > You may grab them all at once from this branch where I committed them on 
> > top of Michal's kbuild branch:
> > 
> >         git://git.linaro.org/people/nicolas.pitre/linux kbuild
> > 
> 
> Ok, thanks!
> 
> I liked the idea of moving the samples from Documentation to samples,
> but with your patches that is no longer required to fix the bug.
> 
> If the respective maintainers want to pick up my patches 2 and 3
> independent of your fixes, I can rewrite the changelogs for those,
> otherwise I'll just drop them all.

I agree this was a bit unexpected to have compiled code in the docs 
directory.  Whatever the reason, I didn't want autoksyms to interfere 
here.  Still, I think it is still a good idea you rewrite your changelog 
to judge those patches in the context of the reasons for having code 
there in the first place.


Nicolas
