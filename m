Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:55828 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751062AbdKMCWH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Nov 2017 21:22:07 -0500
Date: Mon, 13 Nov 2017 10:22:02 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: CONFIG_DEBUG_INFO_SPLIT impacts on faddr2line
Message-ID: <20171113022202.yvkqeiukkc5j5mrd@wfg-t540p.sh.intel.com>
References: <20171107102156.3fgxt6y6v5y2kqnf@wfg-t540p.sh.intel.com>
 <CA+55aFwqxZiN_XrZqvbtCsc8W=w895RaB1sjuVP1aTj8JStxzg@mail.gmail.com>
 <20171108094832.qxvkawpw2snpcbvh@wfg-t540p.sh.intel.com>
 <CA+55aFwK7935r325nmR-eQvanVCN3A+v3wEQHsW4NpSeBsybeA@mail.gmail.com>
 <20171108171230.ccf7lwutjysk26fc@wfg-t540p.sh.intel.com>
 <CA+55aFx0O+NTbBjavPm_jPucqHdXFYPmUya4kw=ps7LSqTFd5w@mail.gmail.com>
 <20171113011338.3qmnp64pttyscuus@wfg-t540p.sh.intel.com>
 <1510538727.2418.41.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1510538727.2418.41.camel@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Network Development <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, intel-wired-lan@lists.osuosl.org, Andi Kleen <ak@linux.intel.com>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, linux-kbuild@vger.kernel.org, "Lu, Aaron" <aaron.lu@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>

[...]
>> > Oh - and talking about "big step forward" - does the 0day robot do
>> > any
>> > suspend/resume testing at all?
>> Yes, we do. CC Rui and Aaron on power testing.
>>
>yes, we have added suspend/resume test in 0day, including both
>functionality and suspend/resume performance. It is not widely run
>because most of the 0Day testboxes are servers/desktops, now we've just
>added some client laptops as testboxes, and will add more in the near
>future. :)
>> >
>> > Even on non-laptop hardware, it should be possible to do something
>> > like
>> >
>> >    echo platform > /sys/power/pm_test
>> >    echo freeze > /sys/power/state
>> >
>> > or similar (assuming CONFIG_PM_DEBUG is enabled).
>> >
>
>yes.
>
>I will run native suspend/resume test on laptops and other test boxes
>that really support it, and run suspend/resume test in pm_test modes on
>the others to help us find more issues.

It's a good plan, thanks! Client devices can be much cheaper than servers.
They have more diversities in HW while being more general available.

On the other hand, if there are PM functionalities that can be tested
inside QEMU, it'll be good to have. Since no real HW can be tested as
cheap and extensive as the large amount of VMs.

Thanks,
Fengguang
