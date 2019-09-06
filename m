Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389315AbfIFNWj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 09:22:39 -0400
Date: Fri, 6 Sep 2019 15:22:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 10/11] usb-storage: remove single-use define for
 debugging
Message-ID: <20190906132236.GA4107@kroah.com>
References: <20180716122125.175792-1-maco@android.com>
 <20190906103235.197072-1-maennich@google.com>
 <20190906103235.197072-11-maennich@google.com>
 <20190906125942.GA31531@linux-8ccs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906125942.GA31531@linux-8ccs>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org, kernel-team@android.com, arnd@arndb.de, joel@joelfernandes.org, lucas.de.marchi@gmail.com, maco@android.com, sspatil@google.com, will@kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net

On Fri, Sep 06, 2019 at 02:59:42PM +0200, Jessica Yu wrote:
> +++ Matthias Maennich [06/09/19 11:32 +0100]:
> > USB_STORAGE was defined as "usb-storage: " and used in a single location
> > as argument to printk. In order to be able to use the name
> > 'USB_STORAGE', drop the definition and use the string directly for the
> > printk call.
> > 
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Matthias Maennich <maennich@google.com>
> 
> Greg, didn't you pick this patch up for usb-next already (for the 5.4
> merge window)? If that's the case, I could apply the series omitting
> this patch (once there are no more comments or complaints).

Yes, I already have this in my tree, but there's no problem with you
taking it in yours as I think it's needed for the one after this to
build properly.

git will handle it properly when merging :)

thanks!

greg k-h
