Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f193.google.com ([209.85.213.193]:33538 "EHLO
	mail-ig0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914AbcE0F0v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 May 2016 01:26:51 -0400
MIME-Version: 1.0
In-Reply-To: <20160526203346.GA4734@pobox.suse.cz>
References: <20160526203346.GA4734@pobox.suse.cz>
Date: Thu, 26 May 2016 22:26:50 -0700
Message-ID: <CA+55aFzQxws_ipKZhV9cFrJdV8CvKy=m9AxGe5cjM=FYceNbZQ@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild updates for v4.7-rc1
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, mussitantesmortem@gmail.com, nicolas.ferre@atmel.com, Nicolas Pitre <nicolas.pitre@linaro.org>, robert.jarzmik@free.fr, yamada.masahiro@socionext.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, May 26, 2016 at 1:33 PM, Michal Marek <mmarek@suse.com> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

This pull results in new warnings.

I get new "may be uninitialized" warnings now for me allmodconfig
build, and while I didn't look at them all, the one I looked at was
just entirely crap:

   fs/gfs2/dir.c: In function ‘dir_split_leaf.isra.16’:
   fs/gfs2/dir.c:1021:8: warning: ‘leaf_no’ may be used uninitialized
in this function [-Wmaybe-uninitialized]
     error = get_leaf(dip, leaf_no, &obh);
           ^

yeah no, leaf_no is initialized a few lines up by

        error = get_leaf_nr(dip, index, &leaf_no);

and the fact that gcc can't follow the trivial  error handling is not
our fault. It looks *so* trivial that I wonder why.

That said, I don't see exactly what in the pull request causes this.

My reading of the diff seems to say that you are actually adding
*more* cases of -Wno-maybe-uninitialized, not less.

So I suspect it's almost accidental in just how the Kconfig option
CC_OPTIMIZE_FOR_PERFORMANCE happened, which in turn probably just
changes the options for "make allmiodconfig", and it now picks a
non-size-optimized build that always showed those warnings and I just
didn't see them.

Annoying. I've pulled it, but I wish you would look at this.

              Linus
