Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f171.google.com ([209.85.167.171]:45978 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbeJFMzN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Oct 2018 08:55:13 -0400
MIME-Version: 1.0
References: <20181004200249.GL5238@garbanzo.do-not-panic.com>
In-Reply-To: <20181004200249.GL5238@garbanzo.do-not-panic.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sat, 6 Oct 2018 07:53:02 +0200
Message-ID: <CAFkk2KQk8ZZhjo3aC1hi2Kph5okuS-UVApboajUXEcu0JFGPOg@mail.gmail.com>
Subject: Re: [ANN] init-kconfig - easy way to embrace Linux's kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R . Rodriguez" <mcgrof@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, pvorel@suse.cz, rostedt@goodmis.org, johannes@sipsolutions.net, valentinrothberg@gmail.com, vegard.nossum@oracle.com, nbd@nbd.name, kconfig-sat@googlegroups.com

On Thu, Oct 4, 2018 at 10:03 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> Every now and then a project is born, and they decide to use Linux's
> kconfig to enable configuration of their project. As it stands we *know*
> kconfig is now used in at least over 12 different projects [0]. I myself
> added kconfig to one as well years ago. Even research reveals that
> kconfig has become one of the leading industrial variability modeling
> languages [1] [2].
>
> What is often difficult to do though is to start off using kconfig and
> integrating it into a project. Or updating / syncing to the latest
> kconfig from upstream Linux.
>
> I had yet another need to use kconfig for another small project so
> decided to make a clean template others can use and help keep it in sync.
> This is a passive fork which aims to keep in sync with the Linux
> kernel's latest kconfig to make it easier to keep up to date and to
> enable new projects to use and embrace kconfig on their own.  The goal
> is *not* to fork kconfig and evolve it separately, but rather keep in
> sync with the evolution of kconfig on Linux to make it easier for
> projects to use kconfig and also update their own kconfig when needed.
>
> This may also be useful if folks want to test R&D code on a smaller
> compartamentalized codebase.
>
> If you find this useful and you'd like to help keep it in sync, send
> patches my way as the kernel's kconfig evolves. The code is up on
> gitlab).) [3].
>
> Do we want to document this option on Linux in case folks want to try
> and embrace kconfig on their own for other projects?
>
> [0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
> [1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
> [2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
> [3] https://gitlab.com/mcgrof/init-kconfig
>
>   Luis

Shameless self-plug:

There's also a Python Kconfig implementation that's starting to get
picked up by several projects: https://github.com/ulfalizer/kconfiglib

It has a terminal menuconfig interface with a lot more features than
mconf (a demonstration is available at
https://raw.githubusercontent.com/ulfalizer/Kconfiglib/screenshots/screenshots/menuconfig.gif),
and can also be used e.g. to generate cross-referenced Kconfig
documentation that includes propagated dependencies:
https://docs.zephyrproject.org/latest/reference/kconfig/index.html
(note: heavy page).

Kconfiglib is based around a library (an old version appears in e.g.
U-Boot and Yocto, and a newer version in e.g. Espressif). The
documentation generation is just a script
(https://github.com/zephyrproject-rtos/zephyr/blob/master/doc/scripts/genrest.py),
and the same goes for the menuconfig and the other tools. The core
library takes part of all the trickiness related to evaluating
symbols.

I realize there would probably be massive opposition to adding a
Python dependency to a core part of the kernel, so I'm not going for
that. For most other projects, I think it's a good fit though.

Cheers,
Ulf
