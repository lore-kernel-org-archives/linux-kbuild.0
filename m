Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:38312 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755834AbdLOT70 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Dec 2017 14:59:26 -0500
Date: Fri, 15 Dec 2017 20:50:59 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/3] kbuild,kconfig: generate lexer/parser C files
 instead of copying _shipped files
Message-ID: <20171215195059.GA10168@ravnborg.org>
References: <1512835350-8646-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAROtWVcpwpaKYAyr=jpPrOu3iMHVCJcVN+4SVp6ZtEd5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAROtWVcpwpaKYAyr=jpPrOu3iMHVCJcVN+4SVp6ZtEd5g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Kate Stewart <kstewart@linuxfoundation.org>, Markus Heiser <markus.heiser@darmarit.de>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, SeongJae Park <sj38.park@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Max Filippov <jcmvbkbc@gmail.com>

Hi Masahiro.

> > In Linux build system convention, pre-generated files are version-
> > controlled with a "_shipped" suffix.  During the kernel building,
> > they are simply shipped (copied) removing the suffix.
> >
> > From users' point of view, this approach can reduce external tool
> > dependency for the kernel build,
> >
> > From developers point of view, it is tedious to manually regenerate
> > such artifacts.  In fact, we see several patches to regenerate
> > _shipped files.  They are noise commits.
...

Nice cleanup we should have does years ago.
When we introduced this we did this to minimize the time
it took to configure a clean kernel - as one of the reasons.
Since then the average computer has been significantly faster
so the time to run flex/bison is not an issue anymore.

	Sam
