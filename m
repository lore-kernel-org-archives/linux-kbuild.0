Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:50821 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756055AbZIRLPh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Sep 2009 07:15:37 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [patch] Makefile: can't build modules outside the kernel tree if it was built using O=
Date: Fri, 18 Sep 2009 13:15:32 +0200
References: <830a8fa70909161930r518a9644ja954ced2ae5814b4@mail.gmail.com> <200909171345.30988.arnd@arndb.de> <830a8fa70909171449s597931a2t51f37be6378ddef7@mail.gmail.com>
In-Reply-To: <830a8fa70909171449s597931a2t51f37be6378ddef7@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200909181315.32976.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Caveh Jalali <ecaveh@gmail.com>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 17 September 2009, Caveh Jalali wrote:
> sadly, some 3rd party src packages don't quite do the right thing with
> their kernel include paths and still depend on the include2/asm symlink
> to find the platform header files.
> 
> i see your point about include2 being somewhat redundant/legacy, however,
> as long as we are creating it, we should have it point to the intended
> location instead of being a dead link!

I guess we could just as well put something in there to notify such
programs of how to use the kernel Makefiles. External packages should
not try to guess the layout of the kernel source tree, they can only
get it wrong anyway.

There are apparently also user space packages trying to access 
/lib/modules/${krel}/build/arch/${arch}/include/, which is even
more wrong.

I'm thinking about adding something in <linux/kernel.h> to warn
about this when using the kernel headers without either '-D__KERNEL__'
or 'make headers_install'. Is there any valid case that this would
break? It should probably give a warning that includes a http URL
holding a description of what to do.

	Arnd <><
