Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:46237 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730993AbfHHOMG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 10:12:06 -0400
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
 <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net>
Date: Thu, 8 Aug 2019 16:11:59 +0200
MIME-Version: 1.0
In-Reply-To: <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Albers <thomas.gameiro@googlemail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 04.08.19 19:08, Thomas Albers wrote:

Hi,

> Somehow, kconfig is not linked against libtinfow. Please let me know
> how I can be of assistance here, I'm still wrapping my head around the
> code. This is a 4.14 kernel, but 4.19, which different architectures
> use, fails in a similar manner.

can you make sure you don't have any ncurses pieces in your sysroot and
retry ?


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
