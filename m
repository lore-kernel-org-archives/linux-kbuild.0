Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727653AbfAKJ72 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Jan 2019 04:59:28 -0500
Date: Fri, 11 Jan 2019 10:59:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] firmware_loader: move firmware/ to
 drivers/base/firmware_loader/builtin/
Message-ID: <20190111095924.GA555@kroah.com>
References: <1547200321-17120-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547200321-17120-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, "Rafael J. Wysocki" <rafael@kernel.org>

On Fri, Jan 11, 2019 at 06:52:00PM +0900, Masahiro Yamada wrote:
> Currently, the 'firmware' directory only contains a single Makefile
> to embed extra firmware into the kernel.
> 
> Move it to the more relevant place.

So this moves any "build in" firmware to need to be placed in
drivers/base/firmare_loader/builtin/ instead of firmware/builtin/ ?  If
so, why?  That seems like a lot of extra work for people now.  And
burrying it down in the drivers/base/ directory is not obvious at all.

thanks,

greg k-h
