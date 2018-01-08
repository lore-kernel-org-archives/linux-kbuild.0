Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:49676 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932136AbeAHLqk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jan 2018 06:46:40 -0500
Date: Mon, 8 Jan 2018 14:45:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] tools: fix cross-compile var export
Message-ID: <20180108114553.37buovfs7qimokzq@mwanda>
References: <20180106201601.11074-1-martin@martingkelly.com>
 <20180107161140.GM6273@windriver.com>
 <549cf839-9ae7-78ce-58df-3d84fc7b3d05@martingkelly.com>
 <c021c0f9-4504-6323-98ed-455a196463fc@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c021c0f9-4504-6323-98ed-455a196463fc@martingkelly.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Kelly <martin@martingkelly.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Matt Mackall <mpm@selenic.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Sun, Jan 07, 2018 at 10:51:21AM -0800, Martin Kelly wrote:
> Urg, I accidentally sent to kernel-kbuild instead of linux-kbuild, changed
> now. It appears that past changes to tools/scripts/Makefile.include have
> been handled by linux-kbuild and often Masahiro Yamada.
> 
> Perhaps the best sequence here is to send a patch to kbuild adding the
> call-override function and calls to it to the main common Makefile. Then I
> can send individual subsystem patches dropping the individual CC = lines and
> similar. It will be 13 patches instead of 1 but will eventually result in
> the same thing.
> 
> Paul, any thoughts?
> 

That sounds good.

regards,
dan carpenter
