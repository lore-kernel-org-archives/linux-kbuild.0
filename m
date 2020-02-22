Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35028 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728010AbgBVCQW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 21:16:22 -0500
Date: Fri, 21 Feb 2020 19:16:19 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
Message-ID: <20200222021619.GA51223@ubuntu-m2-xlarge-x86>
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
 <20200222003820.220854-1-alex_y_xu@yahoo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200222003820.220854-1-alex_y_xu@yahoo.ca>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: linux-kbuild@vger.kernel.org, michal.lkml@markovi.net, masahiroy@kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>

Hi Alex,

On Fri, Feb 21, 2020 at 07:38:20PM -0500, Alex Xu (Hello71) wrote:
> -pipe reduces unnecessary disk wear for systems where /tmp is not a
> tmpfs, slightly increases compilation speed, and avoids leaving behind
> files when gcc crashes.
> 
> According to the gcc manual, "this fails to work on some systems where
> the assembler is unable to read from a pipe; but the GNU assembler has
> no trouble". We already require GNU ld on all platforms, so this is not
> an additional dependency. LLVM as also supports pipes.
> 
> -pipe has always been used for most architectures, this change
> standardizes it globally. Most notably, arm, arm64, riscv, and x86 are
> affected.
> 
> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>

Do you have any numbers to show this is actually beneficial from a
compilation time perspective? I ask because I saw an improvement in
compilation time when removing -pipe from x86's KBUILD_CFLAGS in
commit 437e88ab8f9e ("x86/build: Remove -pipe from KBUILD_CFLAGS").

For what it's worth, clang ignores -pipe so this does not actually
matter for its integrated assembler.

That type of change could have been a fluke but I guarantee people
will care more about any change in compilation time than any of the
other things that you mention so it might be wise to check on major
architectures to make sure that it doesn't hurt.

Cheers,
Nathan
