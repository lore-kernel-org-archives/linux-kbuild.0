Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:52721 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455AbZK0VEE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Nov 2009 16:04:04 -0500
Date: Fri, 27 Nov 2009 22:04:08 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] unifdef: update to upstream revision 1.189
Message-ID: <20091127210408.GA16310@merkur.ravnborg.org>
References: <E1NE3M6-0003Za-OJ@hermes-1.csi.cam.ac.uk> <20091127181749.GA16177@merkur.ravnborg.org> <alpine.LSU.2.00.0911271901430.6581@hermes-1.csi.cam.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.00.0911271901430.6581@hermes-1.csi.cam.ac.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tony Finch <dot@dotat.at>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "Justin P. Mattock" <justinmattock@gmail.com>

On Fri, Nov 27, 2009 at 07:15:01PM +0000, Tony Finch wrote:
> On Fri, 27 Nov 2009, Sam Ravnborg wrote:
> >
> > Can you confirm that this does not regress with respect to the changes
> > that Russell King implemented in the commit:
> > eedc9d83eaab2d35fb9dd1ec25b765dec964e26c
> > ("kbuild: fix headers_exports with boolean expression")
> 
> Yes. I ran the following commands:
> 
>   git checkout master
>   gmake distclean
>   gmake headers_install ARCH=i386 INSTALL_HDR_PATH=../include-master
>   git checkout fanf-unifdef
>   gmake distclean
>   gmake headers_install ARCH=i386 INSTALL_HDR_PATH=../include-fanf
>   diff -Nru -x ..install.cmd ../include-master ../include-fanf
> 
> and diff produced no output.

Good.

Michael - you can add my:

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
