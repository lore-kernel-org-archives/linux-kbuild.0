Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51144 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751341AbdITHCF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 03:02:05 -0400
Date: Wed, 20 Sep 2017 09:00:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild/mkspec: remove firmware from rpm package
Message-ID: <20170920070038.GB26059@kroah.com>
References: <20170920023529.10881-1-shuwang@redhat.com>
 <20170920061012.GA32032@kroah.com>
 <1542341479.7952083.1505889541234.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542341479.7952083.1505889541234.JavaMail.zimbra@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shu Wang <shuwang@redhat.com>
Cc: yamada masahiro <yamada.masahiro@socionext.com>, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, chuhu@redhat.com, yizhan@redhat.com


A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Wed, Sep 20, 2017 at 02:39:01AM -0400, Shu Wang wrote:
> Hi
> 
> Do you mean the patch for deb package? The patch didn't fix rpm
> package. or there's another patch I didn't get on the mailing list.
> 
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1492398.html

There's a lot of patches on the list for this issue, odds are one of
them fixed this, but maybe not.  If so, please say that in your patch so
that the developers/maintainer does not get confused.

thanks,

greg k-h
