Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:55318 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752911AbZBXVBr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Feb 2009 16:01:47 -0500
Date: Tue, 24 Feb 2009 22:03:39 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: potential linking bug in recursive directory descent
Message-ID: <20090224210339.GA16943@uranus.ravnborg.org>
References: <b493f8670902241105l48bd7cdbmb99608e802d2454a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b493f8670902241105l48bd7cdbmb99608e802d2454a@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fred Isaman <iisaman@citi.umich.edu>
Cc: linux-kbuild@vger.kernel.org

On Tue, Feb 24, 2009 at 02:05:25PM -0500, Fred Isaman wrote:
> The pnfs tree base of of 2.6.29-rc5 uses the new find_last_bit
> function (defined in
> lib/find_last_bit.c) in a file in the fs/nfs directory.  Myself and
> another developer (though no one else so far) get the following error
> during compile:
> 
>    Kernel: arch/x86/boot/bzImage is ready  (#5)
>      Building modules, stage 2.
>      MODPOST 515 modules
>    ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!
>    make[2]: *** [__modpost] Error 1
>    make[1]: *** [modules] Error 2
>    make: *** [sub-make] Error 2
> 
> 
> Note that find_last_bit() is not used in any file in the fs directory.
> If I add it to any function that is EXPORT_SYMBOL'ed
> from the fs directory, suddenly the compile errors go away.  (See the
> below patch for a more concrete example.)
> 
> I am not sure what is going on, and why it only affects some
> developers, but it looks a lot like the kbuild system
> is deciding that the library does not need to be included at the fs
> directory level, so isn't including it in fs/nfs where
> it is needed.

kbuild only links in libaries if there is any users of siad library.
And your normal config has no users of lib/find_last_bit.c so
it is not linked into the kernel.

The general rule is that if any in tree module uses a library
then the library is always linked in.
And to always link in a library you need to patch the Makefile
as Randy suggest in his mail.

	Sam
