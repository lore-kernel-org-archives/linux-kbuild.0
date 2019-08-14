Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:34163 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbfHNJxi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 05:53:38 -0400
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
 <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com>
 <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net>
 <CALYGOBXEZOk3k+tWCLjRhWmJ5e__ZwoAN2PvpOsFB0JYBox42w@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <e14fa0ff-e12c-85d1-7fc8-69e1d937b04f@metux.net>
Date: Wed, 14 Aug 2019 11:53:30 +0200
MIME-Version: 1.0
In-Reply-To: <CALYGOBXEZOk3k+tWCLjRhWmJ5e__ZwoAN2PvpOsFB0JYBox42w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Albers <thomas.gameiro@googlemail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 10.08.19 17:44, Thomas Albers wrote:
> Hello!
> 
>>> Somehow, kconfig is not linked against libtinfow.
>>
>> can you make sure you don't have any ncurses pieces in your sysroot and
>> retry ?
> 
> No ncurses in sysroot. The kconfig script worked when the sysroot's
> pkg-config was disabled. Right now I think there are issues with the
> way OpenWRT uses pkg-config.

hmm, has been a long time since last time I used openwrt.

Maybe have a closer look what it passes in $PKG_CONFIG (probably a
wrapper script) and what the actual call behind is.

Maybe you have a really ancient pkg-config that doesn't have sysroot
support yet ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
