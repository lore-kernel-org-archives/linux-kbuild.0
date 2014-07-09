Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:40395 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754562AbaGIJ0C (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2014 05:26:02 -0400
Date: Wed, 09 Jul 2014 18:25:42 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: Use symbolic link to the source tree for out-of-tree build
In-Reply-To: <53BD048F.4000800@suse.cz>
References: <1404887241-14455-1-git-send-email-yamada.m@jp.panasonic.com> <53BD048F.4000800@suse.cz>
Message-Id: <20140709182542.B0CB.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Hi Michal,


On Wed, 09 Jul 2014 10:59:59 +0200
Michal Marek <mmarek@suse.cz> wrote:

> On 2014-07-09 08:27, Masahiro Yamada wrote:
> > Since commit 9da0763bd, the variable 'srctree' is set as follows:
> > 
> > [1] Building in the source tree
> >       => srctree is set to '.'
> > [2] Building in a subdir right under the source tree
> >       => srctree is set to '..'
> > [3] Other cases
> >       => srctree is set to the absolute path to the source tree
> > 
> > Pros are more readable compiler messages, WARN_ON() etc.
> > for case [1] and [2]. (but not [3])
> > 
> > Cons are we have to do build-test for 3 cases when adding
> > some changes to the build infrastructure.
> > 
> > We want to treat case [2] and [3] in the same way like prior to
> > commit 9da0763bd, keeping the compact log messages.
> > 
> > The idea here is to create a symbolic link 'srctree' pointing
> > to $(KBUILD_SRC) at the very early stage of the build process.
> 
> If the symlink points to an absolute path, then you can't move the
> source and build tree around anymore.


In which cases do we need to do this?


Anyway, even if we move the source and build tree around,
it is much faster to rebuild it.

The point here is that the absolute paths do not appear
in .*.cmd files.


For example,

$ make O=foo/bar defconfig all
  [ full build ]
$ cd ..
$ mkdir baz
$ move linux baz
$ cd baz/linux
$ make O=foo/bar
  [ much faster re-build ]



Best Regards
Masahiro Yamada

