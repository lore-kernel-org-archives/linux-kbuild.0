Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727180AbfDHOkl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Apr 2019 10:40:41 -0400
Date: Mon, 8 Apr 2019 10:40:39 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: Re: 5.0.7 regression: .config file not found
Message-ID: <20190408144039.GE4689@sasha-vm>
References: <38a457e5-ed95-f71b-3f31-fb54ba1b4da7@afaics.de>
 <CAK7LNATyKv3oMF7fnGr9+itBLgXEG+YGe=nAbckPz4=R=QjTWg@mail.gmail.com>
 <c00b3055-e08f-fa0f-e1c7-9172fc7e2138@afaics.de>
 <CAK7LNASb+r_ny69GtF6=wc6JT9Q74ZoB4fZmGmkNCE7icaHcxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNASb+r_ny69GtF6=wc6JT9Q74ZoB4fZmGmkNCE7icaHcxw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-stable@vger.kernel.org, Harald Dunkel <harri@afaics.de>

On Mon, Apr 08, 2019 at 03:10:54PM +0900, Masahiro Yamada wrote:
>Hi Greg,
>
>On Mon, Apr 8, 2019 at 3:04 PM Harald Dunkel <harri@afaics.de> wrote:
>>
>> Dear Masahiro-san,
>>
>> On 4/7/19 6:32 AM, Masahiro Yamada wrote:
>> >
>> > I think the problem will be fixed
>> > by back-porting the following commit:
>> >
>> > commit 175209cce23d6b0669ed5366add2517e26cd75cd
>> > Author: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>> Seems to work. Thanx very much for your fix.
>>
>> I wonder if this could be included in the 5.0 branch?
>
>Greg,
>We have a regression in the build system for v5.0.7
>
>Could you please backport 175209cce23d6b0669ed5366add2517e26cd75cd
>to fix the problem?

I've queued it for 5.0, thanks.

--
Thanks,
Sasha
