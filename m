Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:50389 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfCHVKl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 16:10:41 -0500
Subject: Re: Debian build polishing
References: <1552049064-32044-1-git-send-email-info@metux.net>
 <20190308175703.GA7178@lambda>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <fe53cd84-5953-786a-3a4f-6eac652a1cdd@metux.net>
Date: Fri, 8 Mar 2019 22:10:19 +0100
MIME-Version: 1.0
In-Reply-To: <20190308175703.GA7178@lambda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, "Enrico Weigelt, metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org

On 08.03.19 18:57, Theodore Ts'o wrote:
> On Fri, Mar 08, 2019 at 01:44:19PM +0100, Enrico Weigelt, metux IT consult wrote:
>> One point still puzzling me: once the debian/rules is applied and
>> somebody calls `make deb-pkg`, he'll end up w/ unclean tree, as
>> now a git-tracked file is changed.
> 
> This is not something I've noticed, but I build my Debian packages
> like this:
> 
> make O=/build/linux-build bindeb-pkg

This doesn't work for my environment:

The requirement is that every debian source tree has a ./debian/rules
file (w/ the standard rules like binary, clean, ...). This is called by
upper level build machinery (git-buildpackage, dpkg-buildpackage, ...)

The idea behind is building all packages exactly the same way - one
standard workflow, that just takes a source tree (from git) and spits
out some .deb files.

> So I really hope your patches don't break this.  

It shouldn't (at least I dont intend to). Haven't tried where exactly
the generated debian/rules file lands in your case.

> Also, are there any changes the performance of building the Debian
> packages before and after your changes?  And are there any differences 
> in the packages in terms of any pre-or-post install/removal scripts?

I don't think so. In essence I just replace the generated rules file by
a fixed one. Okay, it will take *a little* bit longer, as the rules file
now calls `make kernelarch`, `make kernelrelease` and `make
kernellocalversion`, before starting actual build. But that shouldn't be
the big deal, IMHO.

> There are a lot of things I really dislike about the "official" Debian
> kernel build processes (they're optimzied for distribution release
> engineers, not kernel developers), 

I try to bring these two world a bit closer together.

> so I'm really hoping that making
> things more like the "official Debian way" doesn't break some of the
> things I really like about the existing "make bindeb-pkg" build
> system.

I intend not to.

Actually, the official Debian way for Kernel build is entirely
different, and that's really complicated and hard to really understand
(that's why I'm  doing this here).

But here I'm just coping w/ the first entry point into the build
process, which now becomes `./debian/rules binary` instead of
`make bindeb-pkg`. The final result (in the .deb files) should be
the time (unless I did something wrong).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
