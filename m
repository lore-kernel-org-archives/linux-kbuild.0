Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726886AbgFIGUO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 02:20:14 -0400
Date: Tue, 9 Jun 2020 08:20:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: make module name conflict fatal error
Message-ID: <20200609062012.GA499862@kroah.com>
References: <20200511042149.1712876-1-masahiroy@kernel.org>
 <20200608020256.GA256950@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608020256.GA256950@roeck-us.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Lucas De Marchi <lucas.demarchi@intel.com>, Michal Marek <michal.lkml@markovi.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org

On Sun, Jun 07, 2020 at 07:02:56PM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Mon, May 11, 2020 at 01:21:49PM +0900, Masahiro Yamada wrote:
> > I think all the warnings have been fixed by now. Make it a fatal error.
> > 
> 
> Not entirely. With this patch in the tree, I get:
> 
> Building sparc64:allmodconfig ... failed
> --------------
> Error log:
> error: the following would cause module name conflict:
>   drivers/char/adi.ko
>   drivers/input/joystick/adi.ko
> make[1]: *** [modules_check] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [__sub-make] Error 2
> 
> Reverting this patch fixes the problem.

As it doesn't look like either of these drivers can be "auto-loaded"
based on hardware detection, I don't know what to suggest as for
renaming either of them.

Any ideas?

thanks,

greg k-h
