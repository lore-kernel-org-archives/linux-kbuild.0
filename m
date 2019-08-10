Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:37174 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfHJGhj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 02:37:39 -0400
Date: Sat, 10 Aug 2019 08:37:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] kbuild: stop compile-testing kernel headers by
 wildcard patterns
Message-ID: <20190810063734.GA13020@ravnborg.org>
References: <20190728173445.10954-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190728173445.10954-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

Hi Masahiro.

On Mon, Jul 29, 2019 at 02:34:44AM +0900, Masahiro Yamada wrote:
> This compile-test started from the strong belief that (almost) all
> headers should be able to be compiled as a standalone unit, but this
> requirement seems to be annoying.
> 
> I believe it is nice to compile-test all the exported headers. On the
> other hand, in-kernel headers are not necessarily always compilable.
> Actually, some headers are only included under a certain combination
> of CONFIG options, and that is definitely fine.
> 
> Currently, newly added headers are compile-tested by default. It
> sometimes catches (not fatal) bugs, but sometimes raises false
> positives.
The current set of include files in include/ may benefit from
a positive list only.

But we have ~7000 headers in drivers/ alone.
And new headers are added all the time.
So with a positive only approach this will be an afterthought
as most headers will not be added to header-test-y

It would be better to keep the possibility so we on a directory
basis can determine if we want a positive list only, or a negative list.

In this way we could in drivers/gpu/drm/ say that all headers must be
checked except foo.h and bar.h that are know buggy.
And in drivers/vidoe/ we only want to check vfoo.h and vbar.h as we do
not want to invest time in fixing the other 100 headers.

Therefore the removal of header-test-pattern-y should be left out.

And since things did not explode after -rc1 I dunno if we really
want to change it to a positive list only in include/??

That is did not explode is obviously because you have put a big
effort into creating a good negative list.

In other words - I am not fan of this patch.

	Sam
