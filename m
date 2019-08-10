Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:37694 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfHJGqR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 02:46:17 -0400
Date: Sat, 10 Aug 2019 08:46:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/5] kbuild: allow big modules to sub-divide Makefiles
Message-ID: <20190810064611.GC13020@ravnborg.org>
References: <20190806063923.1266-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806063923.1266-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Michal Marek <michal.lkml@markovi.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org

Hi Masahiro

On Tue, Aug 06, 2019 at 03:39:18PM +0900, Masahiro Yamada wrote:
> 
> Recently, Jani Nikula requests a better build system support
> for drivers spanning multiple directories.
> (better kbuild support for drivers spanning multiple directories?)
> 
> I implemented it, so please take a look at it.
> 
> Note:
> The single targets do not work correctly.
> 
> The single targets have never worked correctly:

It works in most cases, but now always.
I dunno how much it is used.
Myself I almost always do make /drivers/foo/bar/
> 
> [1] For instance, "make drivers/foo/bar/baz.o" will descend into
>     drivers/foo/bar/Makefile, which may not necessarily specify
>     the build rule of baz.o
> 
>     It is possible for drivers/foo/Makefile having
>         obj-$(CONFIG_BAZ) += bar/baz.o
> 
> [2] subdir-ccflags-y does not work.
> 
>     The single targets directly descend into the directory of
>     that file resides.
> 
>     It missed subdir-ccflags-y if it is specifies in parent
>     Makefiles.
> 
> Perhaps, I will have to manage correct implementation of single targets.
The day that kbuild has a separate step to read all Makefiles
and then without using recursive make can build the kernel we can have
this fixed.
Until then we can accpet it as is - as fixing this may not be simple.

	Sam
