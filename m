Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:48255 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751157AbeEWEsP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 May 2018 00:48:15 -0400
Date: Wed, 23 May 2018 06:48:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] fixup! kconfig: refactor ncurses package checks for
 building mconf and nconf
Message-ID: <20180523044812.GA24650@ravnborg.org>
References: <1527041491-12647-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527041491-12647-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org

On Wed, May 23, 2018 at 11:11:31AM +0900, Masahiro Yamada wrote:
> It is redundant to pass -DNCURSES_WIDECHAR=1 explicitly; when we use
> 'pkg-config --cflags', it takes care of appropriate flags.
> 
> Actually, 'pkg-config --cflags' will add -D_GNU_SOURCE, which will
> define _XOPEN_SOURCE_EXTENDED, and NCURSES_WIDECHAR=1, anyway.
> 
> I added -D_GNU_SOURCE to follow the suggestion of pkg-config
> for cases where pkg-config is not useful.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> The v3 (https://patchwork.kernel.org/patch/10417413/) was
> reviewed and tested.
> 
> I'd like to squash this into it.

Looks good.
Reviewed-off-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
