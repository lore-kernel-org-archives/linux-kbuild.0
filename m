Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-01.nifty.com ([202.248.20.66]:51016 "EHLO
        condef-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755220AbdCTOVz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Mar 2017 10:21:55 -0400
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-01.nifty.com with ESMTP id v2KDthk8029897
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Mar 2017 22:55:43 +0900
MIME-Version: 1.0
In-Reply-To: <20161122213434.14788-2-mmarek@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com> <20161122213434.14788-2-mmarek@suse.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 20 Mar 2017 22:53:36 +0900
Message-ID: <CAK7LNASD-aW2084hhHM0N6jcLyRYJ1ZKQr9xtiuf4BUUuvGHHA@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm: Use full path in KBUILD_IMAGE definition
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Russell King <linux@armlinux.org.uk>

2016-11-23 6:34 GMT+09:00 Michal Marek <mmarek@suse.com>:
> The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
> expect it to point to the image file in the build directory. The
> builddeb script has a workaround for architectures which only provide
> the basename, but let's provide a clean interface for packaging tools.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Michal Marek <mmarek@suse.com>



Applied to linux-kbuild/misc.  Thanks!


-- 
Best Regards
Masahiro Yamada
