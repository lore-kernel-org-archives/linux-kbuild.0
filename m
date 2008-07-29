Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:12387 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751826AbYG2GkE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jul 2008 02:40:04 -0400
Date: Tue, 29 Jul 2008 08:40:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kill include symlinks for sh?
Message-ID: <20080729064049.GA28656@uranus.ravnborg.org>
References: <20080728115735.GA32089@uranus.ravnborg.org> <20080728231922.GB28055@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080728231922.GB28055@linux-sh.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Paul

> This didn't end up being _too_ painful, though it did take a bit of time
> to hunt down all of the guilty parties. I've pushed out what I have now,
> which you can see at:
> 
> http://git.kernel.org/?p=linux/kernel/git/lethal/sh-2.6.git;a=commitdiff;h=f15cbe6f1a4b4d9df59142fc8e4abb973302cf44
> 
> It's been holding up to all of the random builds I've thrown at it so
> far, so there shouldn't be any really nasty surprises left over.

I took a quick look at it and the header re-org looks good.
I like that you added the 'mach-' prefix to the directory names.

But I also noticed several changes like this:
-#include <asm/landisk/iodata_landisk.h>
+#include <mach/iodata_landisk.h>

In this case you _know_ that this is a landisk so
the less magic option would have been the longer
include form like this:
+#include <mach-landisk/mach/iodata_landisk.h>

It would be preferable that we use the gcc -I
directive:

    -Iarch/sh/include/mach-$MACH

only to automagically select between identical named
files for the different platforms and not like
the above where we use it simply to cut off the include
path a little.

Another note is that you decided to move the generated
file over to arch/sh/include too.
I really do not know if I think this is the right approach.
What I like is that we some day end up with generated files
in a common place. But I have not really thought it through
and thus I have no final idea how to do it.
So in other words - keep it as is and lets re-visit it should
we one day decide to do this in a common way across architectures.

Thanks for looking into this so quickly!

	Sam
