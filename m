Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:50013 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750928AbeETKGG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 May 2018 06:06:06 -0400
Date: Sun, 20 May 2018 12:06:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 4/5] kconfig: refactor ncurses package checks for
 building mconf
Message-ID: <20180520100601.GB18441@ravnborg.org>
References: <1526804213-8238-1-git-send-email-yamada.masahiro@socionext.com>
 <1526804213-8238-5-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526804213-8238-5-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arvind Prasanna <arvindprasanna@gmail.com>

Hi Masahiro

On Sun, May 20, 2018 at 05:16:52PM +0900, Masahiro Yamada wrote:
> The mconf (or its infrastructure, lxdiaglog) depends on ncurses.
> Move and rename check-lxdialog.sh to mconf-cfg.sh to make it work in
> the same way as for qconf and gconf.
> 
> According to Randy's report, we still need to carry the fallback code
> in case the pkg-config fails to find ncurses.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> -
> -# Use recursively expanded variables so we do not call gcc unless
> -# we really need to do so. (Do not call gcc as part of make mrproper)
> -HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
> -                    -DLOCALE
...

>  # Add environment specific flags
> -HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
> -HOST_EXTRACXXFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCXX) $(HOSTCXXFLAGS))
> -
> +HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS)) \
> +		    -DLOCALE
> +HOST_EXTRACXXFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCXX) $(HOSTCXXFLAGS)) \
> +		    -DLOCALE

Any chance that the ugly hack in check.sh could be ported over to use pkg-config?

There should be no need to specify both $(shell ...) AND $(CONFIG_SHELL)
This was not introduced by this commit, but as the Makefile is cleaned up include this too.

	Sam
