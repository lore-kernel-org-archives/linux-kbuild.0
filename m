Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgFHCC7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jun 2020 22:02:59 -0400
Date: Sun, 7 Jun 2020 19:02:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] kbuild: make module name conflict fatal error
Message-ID: <20200608020256.GA256950@roeck-us.net>
References: <20200511042149.1712876-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511042149.1712876-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Michal Marek <michal.lkml@markovi.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org

Hi,

On Mon, May 11, 2020 at 01:21:49PM +0900, Masahiro Yamada wrote:
> I think all the warnings have been fixed by now. Make it a fatal error.
> 

Not entirely. With this patch in the tree, I get:

Building sparc64:allmodconfig ... failed
--------------
Error log:
error: the following would cause module name conflict:
  drivers/char/adi.ko
  drivers/input/joystick/adi.ko
make[1]: *** [modules_check] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [__sub-make] Error 2

Reverting this patch fixes the problem.

Guenter
