Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46736 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfCANdB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Mar 2019 08:33:01 -0500
Date: Fri, 1 Mar 2019 14:32:56 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH] scripts/package/mkdebian: expose KCONFIG_CONFIG to
 debian/rules
Message-ID: <20190301133254.GA20771@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20190221215901.23970-1-ar@cs.msu.ru>
 <20190221215901.23970-3-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190221215901.23970-3-ar@cs.msu.ru>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arseny Maslennikov <ar@cs.msu.ru>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>

Hi,

> If KCONFIG_CONFIG is passed to `make deb-pkg` as a makeflag or
> environment variable, the source tarball produced contains whatever
> specified by that variable instead of the usual `.config'.

> While `make deb-pkg' yields a correct Debian binary package (at least
> on amd64), the generated source package's debian/rules does not pass
> KCONFIG_CONFIG to make(1), thus rendering the source package unable to
> be rebuilt.

> Steps to reproduce the kind of failure being fixed:
> 1)  Produce a source and binary package with:
> 	% KCONFIG_CONFIG=my.config make deb-pkg
> 2)  In the parent directory:
> 	% dpkg-source -x linux-*.dsc
> 3)  In the unpacked source directory:
> 	% debuild -i -us -uc

> Here is an excerpt from an example output of `debuild -i -us -uc':

> make[2]: *** No rule to make target '.config', needed by 'kernel/config_data.gz'.  Stop.
> make[1]: *** [Makefile:1043: kernel] Error 2
> make[1]: Leaving directory '/home/ar/linux-kernel/deb/linux-5.0.0-rc5-tks-gitd6ff78479ec5-57-5.0.0-rc5-tks-gitd6ff78479ec5-57'
> make: *** [debian/rules:4: build] Error 2
> dpkg-buildpackage: error: debian/rules build subprocess returned exit status 2
> debuild: fatal error at line 1182:
> dpkg-buildpackage -us -uc -ui -i failed

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>


Kind regards,
Petr
