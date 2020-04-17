Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728561AbgDQM2a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 08:28:30 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7E7C061A41
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2020 05:28:30 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id j4so2080103qkc.11
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2020 05:28:30 -0700 (PDT)
Date: Fri, 17 Apr 2020 09:28:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Message-ID: <20200417122827.GD5100@ziepe.ca>
References: <20200417011146.83973-1-saeedm@mellanox.com>
 <87v9ly3a0w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9ly3a0w.fsf@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, leon@kernel.org, kieran.bingham+renesas@ideasonboard.com, jonas@kwiboo.se, airlied@linux.ie, jernej.skrabec@siol.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org

On Fri, Apr 17, 2020 at 09:23:59AM +0300, Jani Nikula wrote:

> Which means that would have to split up to two. Not ideal, but
> doable.

Why is this not ideal?

I think the one per line is easier to maintain (eg for merge
conflicts) and easier to read than a giant && expression.

I would not complicate things further by extending the boolean
language..

Jason
