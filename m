Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:49797 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752020AbdJAAj1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Sep 2017 20:39:27 -0400
Date: Sat, 30 Sep 2017 19:38:53 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] kbuild: clang: remove crufty HOSTCFLAGS
Message-ID: <20171001003853.GX8421@gate.crashing.org>
References: <20170926022835.30916-1-nick.desaulniers@gmail.com> <CAK7LNARwbqviGS4THmftO3mCkxpjPmQHxDbFjTsBXptyEG5cMg@mail.gmail.com> <20170930231450.cggvysrt4zedsbkq@lostoracle.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170930231450.cggvysrt4zedsbkq@lostoracle.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Behan Webster <behanw@converseincode.com>, dl9pf@gmx.de, Mark Charlebois <charlebm@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvmlinux@lists.linuxfoundation.org

On Sat, Sep 30, 2017 at 04:14:50PM -0700, Nick Desaulniers wrote:
> On Thu, Sep 28, 2017 at 07:52:35PM +0900, Masahiro Yamada wrote:
> > 2017-09-26 11:28 GMT+09:00 Nick Desaulniers <nick.desaulniers@gmail.com>:
> > >  HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
> > > +               $(call hostcc-option,-fno-delete-null-pointer-checks) \
> > >                 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
> > 
> > You call hostcc-option
> > before Kbuild.include is included around line 341.
> > 
> > So, $(call hostcc-option, ...) returns always an empty string here
> > whether the compiler supports the option or not.
> 
> So calling a yet-to-be defined variable results in an empty string
> rather than a loud failure?  Chalk that up there with language features
> no one ever asked for.  That kind of implicit conversion gets languages
> like JavaScript (with its loose type system, not that C is without its
> own implicit type conversions/promotions) in a lot of hot water.

make --warn-undefined-variables

(and it warns all over the place during a kernel build -- having undefined
variables expand to the empty string is a useful feature, too, not just a
trap for the unwary).


Segher
