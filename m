Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:36619 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751915AbeEVPxn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 May 2018 11:53:43 -0400
Date: Tue, 22 May 2018 17:53:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 0/4] kconfig: refactor package checks for GUI frontends
Message-ID: <20180522155339.GB23783@ravnborg.org>
References: <1526973741-664-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526973741-664-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Philippe Ombredanne <pombredanne@nexb.com>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arvind Prasanna <arvindprasanna@gmail.com>

Hi Masahiro.

On Tue, May 22, 2018 at 04:22:17PM +0900, Masahiro Yamada wrote:
> 
> Kconfig supports 4 GUI frontends.
> Each of them needs some support packages, but checks them differently:
> 
>   qconf, gconf: check packages in Makefile (pkg-config is required)
>   mconf: lxdialog/check-lxdialog.sh
>   nconf: needs ncurses, but its presence is not checked
> 
> This series refactor the package checks so that all of them work
> in the same way.
> 
> The package check scripts have been moved to scripts/kconfig/*conf-cfg.sh
> 
> The motivation of this clean-up is Randy's following patch:
> https://patchwork.kernel.org/patch/10277723/
> 
> I want to clean up existing code before adding more checks.

All patches in the series reviewed - fine.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
