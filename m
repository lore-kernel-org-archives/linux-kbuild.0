Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:58805 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725753AbeKQGPB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Nov 2018 01:15:01 -0500
Date: Fri, 16 Nov 2018 21:01:09 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/8] kbuild: refactor modversions build rules
Message-ID: <20181116200109.GC15240@ravnborg.org>
References: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
 <1542270435-11181-4-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542270435-11181-4-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Hi Masahiro

On Thu, Nov 15, 2018 at 05:27:10PM +0900, Masahiro Yamada wrote:
> Let $(CC) compile objects into normal files *.o instead of .tmp_*.o
> whether CONFIG_MODVERSIONS is enabled or not. This will help simplify
> build rules a lot.

Another approach would be to move more of the build stuff to
one or a few build scripts.

Using build scripts makes is much easier to add comments and
still keep it readable.
And when the build logic list a set of serialized actions
they thay can be included in a build script nicely.

But that said - I also like the simplifications you made.
Everytime you trim the core kbuild files it is a win for
readability.

	Sam
