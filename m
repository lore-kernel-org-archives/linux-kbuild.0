Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:42221 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfGQLIl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 07:08:41 -0400
Subject: Re: [PATCH 4/4] debian: add generic rule file
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net>
 <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
 <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
 <20190715191245.GD3068@mit.edu>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <9dace139-ab0d-f1bd-436e-d95a4ff4a7f7@metux.net>
Date: Wed, 17 Jul 2019 13:08:20 +0200
MIME-Version: 1.0
In-Reply-To: <20190715191245.GD3068@mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-riscv@lists.infradead.org, clang-built-linux <clang-built-linux@googlegroups.com>

On 15.07.19 21:12, Theodore Y. Ts'o wrote:

Hi,

> It's possible I'm not remembering some of the feedback, but the only> thing I recall was the comment I made that I'd really like this use>
case:> > make O=/build/linux-build bindeb-pkg
ah, I yet wanted to test that - thx for reminding me. > to not break.
And as far as I can tell from the proposed patch series> (I haven't had
a chance to experimentally verify it yet), I don't> think it should
break anything --- I'm assuming that we will still> have a way of
creating the debian/rules file in> /build/linux-build/debian/rules when
doing a O= build, and that the> intdeb-pkg rule remains the same.  At
least, it appears to be the case> from my doing a quick look at the patches.
Yes (unless i've missed something), everything should remain as it is.
One thing that could happen (not checked yet) is that running good old
'make bindeb-pkg' without O=... could overwrite the now already existing
debian/rules file.

If that's really a problem, we could tweak the machinery to use a
different name for the rule file (for now, one the preceeding patch
just allows giving a different name for just *generating* the rules
file). Another idea could be rewriting the whole process so that no
rules file needs to be generated at all.

> Yeah, the official Debian debian/rules is optimized for doing a
> distribution release, and in addition to the issues Enrico has raised,
> last time I tried it, it was S-L-O-W since it was building a fully
> generic kernel.  It's not at all useable for general developer use.

I'm a bit reluctant calling this 'optimized' :p

The strangest aspect (IMHO) is they're building several different trees
(w/ different huge patch queues) from only one source package. Instead
I'd rather:
* try to get as much as possible in one tree
* have separate source packages if there really need to be separate
  patche queues (IMHO, these things, like RT stuff, just need proper
  Kconfig's)
* do all the patching in git and skip the text-based patches entirely

Haven't found out, why they're actually doing it that complicated way
(didn't get any useful answers from debian kernel folks)

> It sounds like what Enrico is trying to do is to enable running
> "dpkg-buildpackage -us -uc -b" from the the top-level kernel package
> as being easier than running "make bindeb-pkg".  I suspect this might
> be because his goal is to integrate individual kernel builds from
> using Debian's hermetic build / chroot systems (e.g., sbuild, pbuilder)?

Yes, I'm building all deb's by the same process / infrastructure.
In my case it's dck-buildpackage (*1) which runs the build in a docker
container (kinda pbuilder w/ docker). It always starts with a fresh
(minimal) base image, calls debian/rules to create debian/control
(if necessary) deploys the dependencies found in the control file
and finally fire's up dpkg-buildpackage - the output is collected
in an ready-to-use apt repo.

The goal of this is having a canonical build process for all deb
packages, not having to care of any special cases anymore. I also
have another tool ontop of that, which runs the whole show for dozens
of packages and targets (*2).

My first approach was trying to use Debian source packages with new
kernel trees, but had to give up after a few days. Then I've found out
that the kernel already has *almost* what I needed. The difference
between almost and fine is this patch queue (minus local .config files)


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
