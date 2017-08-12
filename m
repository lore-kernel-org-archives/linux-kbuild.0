Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:41637 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750771AbdHLIHD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Aug 2017 04:07:03 -0400
Date: Sat, 12 Aug 2017 10:06:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: make clean all broken with -j? + question regarding modpost
Message-ID: <20170812080655.GA19083@ravnborg.org>
References: <20170810154251.GA23083@localhost.localdomain>
 <1cb96165-34a1-7f8e-4211-e87af3cfb60a@infradead.org>
 <CA+r1ZhjGfQNO1Z2KR869eP+azB6L+F32ybh-ZuPFSBqFaKLuEg@mail.gmail.com>
 <CAK7LNAS3anskx8+9aWQrg+PKkr4L4AdsdWaha=_uMU5VjKpg5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS3anskx8+9aWQrg+PKkr4L4AdsdWaha=_uMU5VjKpg5A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jim Davis <jim.epost@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Thomas Meyer <thomas@m3y3r.de>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Masahiro
> 
> Kbuild does not cater to the mixture of clean targets and build targets,
> but I do not know why.

The details has long escaped me but in general we do not want to
have a job deleting all .o files running in parallel with a job that
creates .o files.

So we wanted the following to work:

	$make mrproper defconfig

make would in the standard configuration execute "mrproper" and "defconfig"
in parallel which would result in a broken build.

This is the background for some of the ugly hacks in the
top-level makefile.

	Sam

