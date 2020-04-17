Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:17012 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730563AbgDQOB0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 10:01:26 -0400
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
In-Reply-To: <20200417122827.GD5100@ziepe.ca>
References: <20200417011146.83973-1-saeedm@mellanox.com> <87v9ly3a0w.fsf@intel.com> <20200417122827.GD5100@ziepe.ca>
Date: Fri, 17 Apr 2020 17:01:18 +0300
Message-ID: <87h7xi2oup.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, leon@kernel.org, kieran.bingham+renesas@ideasonboard.com, jonas@kwiboo.se, airlied@linux.ie, jernej.skrabec@siol.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>

On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Fri, Apr 17, 2020 at 09:23:59AM +0300, Jani Nikula wrote:
>
>> Which means that would have to split up to two. Not ideal, but
>> doable.
>
> Why is this not ideal?
>
> I think the one per line is easier to maintain (eg for merge
> conflicts) and easier to read than a giant && expression.
>
> I would not complicate things further by extending the boolean
> language..

Fair enough. I only found one instance where the patch at hand does not
cut it:

drivers/hwmon/Kconfig:  depends on !OF || IIO=n || IIO

That can of course be left as it is.

As to the bikeshedding topic, I think I'm now leaning towards Andrzej's
suggestion:

	optionally depends on FOO

in [1]. But I reserve my right to change my mind. ;)

BR,
Jani.


[1] http://lore.kernel.org/r/01f964ae-9c32-7531-1f07-2687616b6a71@samsung.com

-- 
Jani Nikula, Intel Open Source Graphics Center
