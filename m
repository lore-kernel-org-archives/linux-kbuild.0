Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:49548 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751650AbeETXlE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 May 2018 19:41:04 -0400
Subject: Re: [PATCH v2 5/5] kconfig: refactor ncurses package checks for
 building nconf
References: <1526804213-8238-1-git-send-email-yamada.masahiro@socionext.com>
 <1526804213-8238-6-git-send-email-yamada.masahiro@socionext.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7819f81c-2de6-4202-1349-ae4ce01caa26@infradead.org>
Date: Sun, 20 May 2018 16:41:01 -0700
MIME-Version: 1.0
In-Reply-To: <1526804213-8238-6-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: "Luis R . Rodriguez" <mcgrof@suse.com>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

On 05/20/2018 01:16 AM, Masahiro Yamada wrote:
> Building nconf requires ncurses, but its presence is not checked.
> Check and configure necessary packages by a shell script like the
> other GUI frontends.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 

> diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
> new file mode 100644
> index 0000000..8eb7948
> --- /dev/null
> +++ b/scripts/kconfig/nconf-cfg.sh
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +PKG="ncursesw menuw panelw"
> +PKG2="ncurses menu panel"
> +
> +if pkg-config --exists $PKG; then
> +	echo libs=\"$(pkg-config --libs $PKG)\"
> +	exit 0
> +fi
> +
> +if pkg-config --exists $PKG2; then
> +	echo libs=\"$(pkg-config --libs $PKG2)\"
> +	exit 0
> +fi
> +

I guess this one needs clags, especially -I, like the mconf patch contains...


> +# Unfortunately, some distributions (e.g. openSUSE) cannot find ncurses
> +# by pkg-config.
> +if [ -f /usr/include/ncursesw/ncurses.h ]; then
> +	echo libs=\"-lncursesw -lmenuw -lpanelw\"
> +	exit 0
> +fi
> +
> +if [ -f /usr/include/ncurses.h ]; then
> +	echo libs=\"-lncurses -lmenu -lpanel\"
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
