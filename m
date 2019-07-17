Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:55714 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725948AbfGQPYC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 11:24:02 -0400
Date: Wed, 17 Jul 2019 11:23:26 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH 4/4] debian: add generic rule file
Message-ID: <20190717152326.GC31412@mit.edu>
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net>
 <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
 <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
 <20190715191245.GD3068@mit.edu>
 <CAK7LNASps6JBAvtJshjMbqMk8QaSrMaH8pm-wHsEySTRJzu0Kw@mail.gmail.com>
 <20190716123431.GB2999@mit.edu>
 <77f82ca2-f89b-e8e2-507a-c37bce1343a5@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77f82ca2-f89b-e8e2-507a-c37bce1343a5@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-riscv@lists.infradead.org, clang-built-linux <clang-built-linux@googlegroups.com>

On Wed, Jul 17, 2019 at 04:16:39PM +0200, Enrico Weigelt, metux IT consult wrote:
> 
> > In practice, that's not going to be a problem for most distributions.
> > The traditional way Debian-derived systems have done builds is
> > completely outside of git.  So there will be a linux_5.2.orig.tar.gz
> > and a linux_5.2-1.debian.tar.xz.  dpkg_source -x will first unpackage
> > the orig.tar.gz, and then the debian.tar.xz, and if the second
> > overwrites the first, it's no big deal.
> 
> ACK. IIRC they already filter out debian/ directories when generating
> upstream tarballs - other upstreams already provide their debian/
> stuff, too.

Well, no, actually they don't.  That's because as much as possible
they want the upstream tarball to be bit-for-bit identical to the one
published on the official upstream distribution site.  That allows
them to include the detached PGP signature from the upstream
maintainer, if one is provided.

If there are files in the upstream debian/ directory that they don't
need, they can delete in the distro's debian/rules file.  Ideally, so
we shouldn't include files in the Linux kernel's debian/ directory
willy-nilly.  But the debian/rules file will *always* be present, and
so it will be overwritten by the <package>_<ver>.debian.tar.xz file,
and so it's no big deal.

					- Ted
