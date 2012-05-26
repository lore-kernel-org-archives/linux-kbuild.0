Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52416 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754576Ab2EZVAG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 May 2012 17:00:06 -0400
Date: Sat, 26 May 2012 23:00:05 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] scripts/package/builddeb: include generated header files
Message-ID: <20120526210005.GB32523@sepie.suse.cz>
References: <4FC0F29C.9050508@afaics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4FC0F29C.9050508@afaics.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Harald Dunkel <harri@afaics.de>
Cc: linux-kbuild@vger.kernel.org

On Sat, May 26, 2012 at 05:11:24PM +0200, Harald Dunkel wrote:
> Building the linux-headers*.deb file on amd64 it seems that scripts/\
> package/builddeb forgets to include some generated header files from
> the build directory. It uses other header files generated in the
> source directory instead.
> 
> 	arch/x86/include/generated/asm/unistd_32_ia32.h
> 	arch/x86/include/generated/asm/unistd_64_x32.h
> 
> are lost. AFAICS this problem was introduced by
> 9b4ce7bce5f30712fd926ab4599a803314a07719 .
> 
> Below is a patch.

Thanks. There was already a patch fixing this by someone else:
http://www.spinics.net/lists/linux-kbuild/msg06313.html, so I applied
that one.


> This is the very first patch I am trying to get into the kernel source
> tree. Please excuse and correct me if I don't follow the blessed
> procedure.

You make easier for the receiving party if you send patches using git
send-email. And lkml should be always CCed in addition to the maintainer
and/or subsystem mailing list. Otherwise, the patch itself was OK.

Michal
