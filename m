Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:49000 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730996AbfHOKgJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 06:36:09 -0400
Message-ID: <9629068a41a160de0145a18dd22924bce70f37fe.camel@oracle.com>
Subject: Re: [RFC 06/19] ktf: A simple debugfs interface to test results
From: Knut Omang <knut.omang@oracle.com>
Date: Thu, 15 Aug 2019 12:35:26 +0200
In-Reply-To: <20190815084921.GE3512@kroah.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
         <ae6c38384e2338aa3cfb8a4e4dd1002833789253.1565676440.git-series.knut.omang@oracle.com>
         <20190813082152.GA17627@kroah.com>
         <a63bea757e02656a38463cc794da7da15273dd16.camel@oracle.com>
         <20190815084921.GE3512@kroah.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>

On Thu, 2019-08-15 at 10:49 +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 14, 2019 at 07:17:07PM +0200, Knut Omang wrote:
> > I notice the discussion and your response here: 
> > http://linux-kernel.2935.n7.nabble.com/debugfs-and-module-unloading-td865175.html
> > I assume that means that protection against module unload while a debugfs file
> > is open is now safe.
> 
> It should be, if you set the *owner field of your file_operations
> properly.  Try it and see!

Might be a case for a KTF selftest to play with the timing to increase the chance :)
Wasn't able to make it crash with these simple, short files.

I notice I had set the .owner field correctly myself in that driver 
code I referred to, so that's a "copy regression".

> > On older kernels, having this code in place is far better than an unprotected 
> > debugfs entry/exit - I have tested it extensively in the past :-)
> 
> Yes, it seems to work, but again, it really is racy and will fail.
> Please don't use it.
> 
> > I perfectly agree with you that reducing the hole for a race condition 
> > is generally a bad idea, but from the above mail thread 
> > it seems that's the only available choice for older kernels?
> 
> I have no idea, but please, do not use that pattern of code as it is
> racy in all kernels, from all of time.

Ok, will remove it :-)

I tried in vain to find the commit from Al Viro that made the code safe,
to identify which kernels that are safe from this issue,
but he has a **lot** of commits, do you have a clue for what/where to look?

It will be good to have a mention/comment on this for future reference, 
like the earliest kernel version where this is safe.

Maybe we can even get rid of some more of the remaining of these too..
(I notice there's 65 cases of 'if (!try_module_get(THIS_MODULE))'
right now)

Thanks!
Knut

> 
> thanks,
> 
> greg k-h
