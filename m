Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:56272 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752451AbeESSDA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 May 2018 14:03:00 -0400
Subject: Re: [PATCH 4/5] kconfig: refactor ncurses package checks for building
 mconf
References: <1526619146-1895-1-git-send-email-yamada.masahiro@socionext.com>
 <1526619146-1895-5-git-send-email-yamada.masahiro@socionext.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1e943db9-1340-2a23-be43-2bde85e3535b@infradead.org>
Date: Sat, 19 May 2018 11:02:55 -0700
MIME-Version: 1.0
In-Reply-To: <1526619146-1895-5-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arvind Prasanna <arvindprasanna@gmail.com>

On 05/17/18 21:52, Masahiro Yamada wrote:
> The mconf (or its infrastructure, lxdiaglog) depends on ncurses.
> check-lxdialog.sh has additional checks in case pkg-config is not
> available.  However, qconf and gconf already rely on pkg-config to
> check necessary packages.  For simplification, drop the fallback
> code from check-lxdialog.sh and move/rename to mconf-cfg.sh to
> make it work in the same way as the other GUI frontends.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Hi,

I began by testing "make menuconfig" first and immediately got this:

*
* Unable to find the ncurses.
* Install ncurses (ncurses-devel or libncurses-dev
* depending on your distribution)
*

I do have ncurses-devel installed.  However, it seems that
pkg-config on openSUSE is not very reliable.  zypper (package management
tool) says:

$ zypper info ncurses-devel
Loading repository data...
Reading installed packages...

Information for package ncurses-devel:
--------------------------------------
Repository     : openSUSE-Leap-42.3-Update                            
Name           : ncurses-devel                                        
Version        : 5.9-62.1                                             
Arch           : x86_64                                               
Vendor         : openSUSE                                             
Installed Size : 25.0 MiB                                             
Installed      : Yes                                                  
Status         : up-to-date                                           
Source package : ncurses-5.9-62.1.src                                 
Summary        : Include Files and Libraries mandatory for Development
Description    :                                                      
    This package contains all necessary include files and libraries needed
    to develop applications that require these.
<END>

but there doesn't seem to be a way to get cflags and libs (name).


> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> new file mode 100755
> index 0000000..7d5a4b2
> --- /dev/null
> +++ b/scripts/kconfig/mconf-cfg.sh
> @@ -0,0 +1,24 @@
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
> +echo >&2 "*"
> +echo >&2 "* Unable to find the ncurses."

                              the ncurses package."

> +echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
> +echo >&2 "* depending on your distribution)"

                                 distribution)."

> +echo >&2 "*"
> +exit 1
> 

(more on the other patches later.)

thanks.
-- 
~Randy
