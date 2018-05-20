Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:49526 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751639AbeETXhL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 May 2018 19:37:11 -0400
Subject: Re: [PATCH v2 4/5] kconfig: refactor ncurses package checks for
 building mconf
References: <1526804213-8238-1-git-send-email-yamada.masahiro@socionext.com>
 <1526804213-8238-5-git-send-email-yamada.masahiro@socionext.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <51f8c32f-f9ba-dc20-dd04-a2848ff7f8f1@infradead.org>
Date: Sun, 20 May 2018 16:36:59 -0700
MIME-Version: 1.0
In-Reply-To: <1526804213-8238-5-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: "Luis R . Rodriguez" <mcgrof@suse.com>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arvind Prasanna <arvindprasanna@gmail.com>

On 05/20/2018 01:16 AM, Masahiro Yamada wrote:
> The mconf (or its infrastructure, lxdiaglog) depends on ncurses.
> Move and rename check-lxdialog.sh to mconf-cfg.sh to make it work in
> the same way as for qconf and gconf.
> 
> According to Randy's report, we still need to carry the fallback code
> in case the pkg-config fails to find ncurses.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> new file mode 100755
> index 0000000..f5fe183
> --- /dev/null
> +++ b/scripts/kconfig/mconf-cfg.sh
> @@ -0,0 +1,38 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +PKG="ncursesw"
> +PKG2="ncurses"
> +
> +if pkg-config --exists $PKG; then
> +	echo cflags=\"-DNCURSES_WIDECHAR=1 $(pkg-config --cflags $PKG)\"
> +	echo libs=\"$(pkg-config --libs $PKG)\"
> +	exit 0
> +fi
> +
> +if pkg-config --exists $PKG2; then
> +	echo cflags=\"$(pkg-config --cflags $PKG2)\"
> +	echo libs=\"$(pkg-config --libs $PKG2)\"
> +	exit 0
> +fi
> +
> +# Unfortunately, some distributions (e.g. openSUSE) cannot find ncurses
> +# by pkg-config.
> +if [ -f /usr/include/ncursesw/ncurses.h ]; then
> +	echo cflags=\"-DNCURSES_WIDECHAR=1 -I/usr/include/ncursesw\"
> +	echo libs=\"-lncursesw\"
> +	exit 0
> +fi
> +
> +if [ -f /usr/include/ncurses.h ]; then
> +	echo cflags=\"\"
> +	echo libs=\"-lncurses\"
> +	exit 0
> +fi
> +
> +echo >&2 "*"
> +echo >&2 "* Unable to find the ncurses."

                              the ncurses package."

> +echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
> +echo >&2 "* depending on your distribution)"

                                 distribution)."

> +echo >&2 "*"
> +exit 1
> 


-- 
~Randy
