Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:50617 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751446AbZCLP3y (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2009 11:29:54 -0400
Date: Thu, 12 Mar 2009 16:31:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/3] Generic headers implementation
Message-ID: <20090312153150.GA11875@uranus.ravnborg.org>
References: <1236865388-31590-1-git-send-email-remis.developer@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1236865388-31590-1-git-send-email-remis.developer@googlemail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Remis Lima Baima <remis.developer@googlemail.com>
Cc: linux-kbuild@vger.kernel.org

On Thu, Mar 12, 2009 at 02:43:05PM +0100, Remis Lima Baima wrote:
> Generic headers allow ARCH maintainers to remove all dummy
> arch/ARCH/include/asm/XXX.h files or, depending on the architecture, 
> include/asm-ARCH/XXX.h (e.g. arch/x86/include/asm/errno.h) that only 
> include the _name equivalent_ include/asm-generic/XXX.h file 
> (e.g. include/asm-generic/errno.h) with _no_ changes. It was called 
> generic headers for short. Arnd Bergmann gave the original idea and 
> asked me to implement it.

Hi Remis.

I recall having exchanged mails with Arnd about the topic before but
I have lost track of it.

Why is it that we do not implment this using the following scheme:

Create a new directory:
1) include/generic/asm
2) Add the directory to the searchpath _after_ all ARCH supplied search paths.
3) Teach headers install about this new place
4) Move all generic headers from asm-generic to this new home
   and add a dummy "#include <generic/asm/foo.h>" in asm-generic

Then we can delete all the one-liners in $ARCH/include/asm
which simply include the asm-generic version.

	Sam
