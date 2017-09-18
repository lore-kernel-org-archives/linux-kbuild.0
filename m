Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:57540 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753079AbdIRJYC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Sep 2017 05:24:02 -0400
Date: Mon, 18 Sep 2017 11:24:12 +0200
From: Greg K-H <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: rpm-pkg: delete firmware_install to fix build
 error
Message-ID: <20170918092412.GA21910@kroah.com>
References: <1505725956-11012-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505725956-11012-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Markus Trippelsdorf <markus@trippelsdorf.de>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

On Mon, Sep 18, 2017 at 06:12:36PM +0900, Masahiro Yamada wrote:
> Commit 5620a0d1aacd ("firmware: delete in-kernel firmware") deleted
> in-kernel firmware support, including "make firmware_install".
> 
> Since then, "make rpm-pkg" / "make binrpm-pkg" fails to build with
> the error:
> 
>   make[2]: *** No rule to make target `firmware_install'.  Stop.
> 
> Commit df85b2d767aa ("firmware: Restore support for built-in firmware")
> restored the build infrastructure for CONFIG_EXTRA_FIRMWARE, but this
> is out of the scope of "make firmware_install".  So, the right thing to
> do is to kill the use of "make firmware_install".
> 
> Fixes: 5620a0d1aacd ("firmware: delete in-kernel firmware")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  scripts/package/mkspec | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Nice find, what's the odds the debian package "script" also needs this
fix?

thanks,

greg k-h
