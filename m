Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:52710 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752855AbYLHWvw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Dec 2008 17:51:52 -0500
Date: Mon, 8 Dec 2008 23:53:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Message-ID: <20081208225318.GA29419@uranus.ravnborg.org>
References: <20081208205814.GA22697@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081208205814.GA22697@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

> 
> With the above construct we do the "right thing" also for
> headers exported to userspace.
> But actually none of the headers using the above are
> subject for export at the moment so we could use a
> CONFIG_ symbol for the same.

One thing worth adding is that this patch fixes:

    make ARCH=m68knommu headers_check

It did not work before - but with this patch is works
as expected.

	Sam
