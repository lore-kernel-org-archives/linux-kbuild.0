Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391544AbfGYLNA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 07:13:00 -0400
Date: Thu, 25 Jul 2019 13:12:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: detect missing "WITH Linux-syscall-note" for
 uapi headers
Message-ID: <20190725111256.GA30958@kroah.com>
References: <20190725080513.4071-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725080513.4071-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 25, 2019 at 05:05:13PM +0900, Masahiro Yamada wrote:
> UAPI headers licensed under GPL are supposed to have exception
> "WITH Linux-syscall-note" so that they can be included into non-GPL
> user space application code.
> 
> Unfortunately, people often miss to add it. Break 'make headers'
> when any of exported headers lacks the exception note so that the
> 0-day bot can easily catch it.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> This patch depends on the following:
> 
> https://lore.kernel.org/patchwork/patch/1105289/
> 
> I will turn on the error after all headers are fixed.

I've taken the dependancy here in the spdx tree and will send it to
Linus for 5.3-rc2.  I can also take this now through that tree, or you
can add it to yours afterward, which ever is easier for you.

thanks,

greg k-h
