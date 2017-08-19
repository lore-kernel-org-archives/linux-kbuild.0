Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:43948 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751101AbdHSPBY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2017 11:01:24 -0400
Date: Sat, 19 Aug 2017 17:01:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: special handle of scripts/kconfig/zconf.tab.o
Message-ID: <20170819150121.GA9084@ravnborg.org>
References: <5992D4DF.2080405@cn.fujitsu.com>
 <CAK7LNATGwrMBsaps1oVOi_21R8jzTadeWSwaK1dA8nMaJs7KpQ@mail.gmail.com>
 <20170819145441.GA5940@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170819145441.GA5940@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, Michal Marek <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

> > The difference between with/without _shipped is,
> > zconf.{tab,hash,lex}.c_shipped reside under $(srctree),
> > whereas zconf.{tab,hash,lex}.c under $(objtree).
> 
> The whole idea behind the *_shipped file was to have less dependencies
> on the host system buildign the kernel.
> So we did not rely on users having all of flex, bison, gperf
> installed in the right versions.
Another reason to use the _shipped files was to make
the "make *config" step faster for a clean kernel.

It is much faster to copy a file than to runn the tools.
The build machines has become significant faster since
then so maybe this is less than an issue today.

	Sam
