Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:57898 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbfHMJvp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 05:51:45 -0400
Message-ID: <f0e1a6efa8f21ab93935c4c19e13b904d4a71f98.camel@oracle.com>
Subject: Re: [RFC 00/19] Integration of Kernel Test Framework (KTF) into the
 kernel tree
From: Knut Omang <knut.omang@oracle.com>
Date: Tue, 13 Aug 2019 11:51:05 +0200
In-Reply-To: <20190813082336.GB17627@kroah.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
         <20190813082336.GB17627@kroah.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>

On Tue, 2019-08-13 at 10:23 +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 13, 2019 at 08:09:15AM +0200, Knut Omang wrote:
> > and in the making::
> > 
> > kunit/			  (kernel only (UML))
> 
> You are going to have to integrate this with kunit, to come up with a
> superset of both in the end.

Yes, I agree - getting to a unified approach has been my intention since I first brought this
up at LPC'17.

> And I do not think that kunit is only UML, it's just that seems to be
> what Brendan tests with, but should work with other arches as well.

If I get Brendan right, it is UML only now but can be extended to also support 
kernels running on real hardware. Still it is kernel only, while KTF also has the 
hybrid mode, where a test can have code and assertions both in user mode and kernel mode.
This is made easier and more streamlined by letting all reporting happen from user mode.

Thanks!
Knut

> thanks,
> 
> greg k-h
