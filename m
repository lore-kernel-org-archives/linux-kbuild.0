Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727099AbfHMIXj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 04:23:39 -0400
Date: Tue, 13 Aug 2019 10:23:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC 00/19] Integration of Kernel Test Framework (KTF) into the
 kernel tree
Message-ID: <20190813082336.GB17627@kroah.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Knut Omang <knut.omang@oracle.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>

On Tue, Aug 13, 2019 at 08:09:15AM +0200, Knut Omang wrote:
> and in the making::
> 
> kunit/			  (kernel only (UML))

You are going to have to integrate this with kunit, to come up with a
superset of both in the end.

And I do not think that kunit is only UML, it's just that seems to be
what Brendan tests with, but should work with other arches as well.

thanks,

greg k-h
