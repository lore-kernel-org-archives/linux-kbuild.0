Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:58329 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfGQOQ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 10:16:59 -0400
Subject: Re: [PATCH 4/4] debian: add generic rule file
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net>
 <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
 <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
 <20190715191245.GD3068@mit.edu>
 <CAK7LNASps6JBAvtJshjMbqMk8QaSrMaH8pm-wHsEySTRJzu0Kw@mail.gmail.com>
 <20190716123431.GB2999@mit.edu>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <77f82ca2-f89b-e8e2-507a-c37bce1343a5@metux.net>
Date: Wed, 17 Jul 2019 16:16:39 +0200
MIME-Version: 1.0
In-Reply-To: <20190716123431.GB2999@mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-riscv@lists.infradead.org, clang-built-linux <clang-built-linux@googlegroups.com>

On 16.07.19 14:34, Theodore Y. Ts'o wrote:

Hi,

> In practice, that's not going to be a problem for most distributions.
> The traditional way Debian-derived systems have done builds is
> completely outside of git.  So there will be a linux_5.2.orig.tar.gz
> and a linux_5.2-1.debian.tar.xz.  dpkg_source -x will first unpackage
> the orig.tar.gz, and then the debian.tar.xz, and if the second
> overwrites the first, it's no big deal.

ACK. IIRC they already filter out debian/ directories when generating
upstream tarballs - other upstreams already provide their debian/
stuff, too.

> First, once it's checked in, I expect changes to the default
> debian/rules file will be relatively rare.  

ACK. I currently don't see much reasons for future changes. If anybody
sees something missing, just let me know, and I'll take it up for the
next review round.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
