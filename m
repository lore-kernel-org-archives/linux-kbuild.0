Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:34804 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726761AbfCHSHo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 13:07:44 -0500
Date: Fri, 8 Mar 2019 12:57:03 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: Debian build polishing
Message-ID: <20190308175703.GA7178@lambda>
References: <1552049064-32044-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552049064-32044-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org

On Fri, Mar 08, 2019 at 01:44:19PM +0100, Enrico Weigelt, metux IT consult wrote:
> One point still puzzling me: once the debian/rules is applied and
> somebody calls `make deb-pkg`, he'll end up w/ unclean tree, as
> now a git-tracked file is changed.

This is not something I've noticed, but I build my Debian packages
like this:

make O=/build/linux-build bindeb-pkg

This works really well for me, since all of the build-artificats land
in /build, and I can use a HDD (or a PD-HDD when building using Google
Compute Engine) for /build, while I use a SSD for my source tree.  I
find that using a HDD for a target of a build doesn't really slow
things down, and this allows me to save $$$ (when using a Cloud VM)
and reduce flash wearout and capital cost (on my personal machines).

So I really hope your patches don't break this.  Also, are there any
changes the performance of building the Debian packages before and
after your changes?  And are there any differences in the packages in
terms of any pre-or-post install/removal scripts?

There are a lot of things I really dislike about the "official" Debian
kernel build processes (they're optimzied for distribution release
engineers, not kernel developers), so I'm really hoping that making
things more like the "official Debian way" doesn't break some of the
things I really like about the existing "make bindeb-pkg" build
system.

Cheers,

						- Ted
