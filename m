Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:56048 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfIJGax (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Sep 2019 02:30:53 -0400
Message-ID: <644ff48481f3dd7295798dcef88b4abcc8695260.camel@oracle.com>
Subject: Re: [RFC 03/19] ktf: Introduce a generic netlink protocol for test
 result communication
From: Knut Omang <knut.omang@oracle.com>
Date: Tue, 10 Sep 2019 08:30:25 +0200
In-Reply-To: <20190909012837.GA33048@google.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
         <a29b3d27234a7ad3f5d6f7571d08167077dc0350.1565676440.git-series.knut.omang@oracle.com>
         <20190909012837.GA33048@google.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>

On Sun, 2019-09-08 at 18:28 -0700, Brendan Higgins wrote:
> On Tue, Aug 13, 2019 at 08:09:18AM +0200, Knut Omang wrote:
> > The generic netlink protocol used to communicate between
> > kernel and user space about tests and test results, as well as some
> > means for configuring tests within the kernel.
> > 
> > Unlike other kernel side test code in the kernel, ktf does not print
> > anything from inside the kernel (except for optional debugging
> > features to help "internal" debugging of ktf or ktf tests).
> > Instead all test results are communicated back to the user space
> > frontend, which decides how to do the reporting.
> 
> So why netlink? Why not just a file interface?

Netlink allows more flexibility in that it is bidirectional and asynchronous.
User space may query the kernel for available tests and then decide which tests
to invoke. User land test frameworks like Googletest allows use of wildcards and
exceptions to select particular tests to run. This is in my opinion very
important functionality as we want the tests to be valuable as developer tools,
not just to check the code as part of a later QA cycle. 
Being able to run a single test or a small subset of the tests is very useful.

Wrt test reporting, the kernel side just dispatches off messages about test
results as they are gathered. Compare this to the complexities, side effects and
limitations of printk.

Besides, for hybrid tests, bidirectional communication allows a test to contain
a mix (or a function) of results gathered in the kernel and in user space.

We also use it for network tests, where user space needs to tell the kernel 
what peer(s) to communicate with, and for certain minimal configuration, such as
which device instance to use for device testing. Test nodes may vary in what
they offer of hardware. Although we'd like to minimize the need for
configuration, as results should be easily reproducable, sometimes there is no
good way around.

Thanks,
Knut

> [...]
> 
> Cheers
