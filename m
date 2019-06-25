Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gateway24.websitewelcome.com ([192.185.50.45]:28223 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726663AbfFYR2s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 13:28:48 -0400
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 872B51564C3
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Jun 2019 12:06:18 -0500 (CDT)
References: <20190625160103.GA13133@embeddedor>
 <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
Message-ID: <3e40f8c1-9699-2723-4e70-9e91ff256257@embeddedor.com>
Date: Tue, 25 Jun 2019 12:06:17 -0500
MIME-Version: 1.0
In-Reply-To: <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>, Jingoo Han <jingoohan1@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>



On 6/25/19 11:52 AM, Joe Perches wrote:
> On Tue, 2019-06-25 at 11:01 -0500, Gustavo A. R. Silva wrote:
>> In preparation to enabling -Wimplicit-fallthrough, mark switch
>> cases where we are expecting to fall through.
> []
>> This patch is part of the ongoing efforts to enable
>> -Wimplicit-fallthrough.
> 
> Just enable the thing already.
> 
> If you stopped trying to do it all yourself, others

What are you talking about?

Anyone can enable it, I'm adding this to every commit:

Warning level 3 was used: -Wimplicit-fallthrough=3

And I'll send a PR with a proper patch for the Makefile
during the next merge window.

If had the power I would have enabled this option since day 1,
so every developer can take care of their own code.

Lately, you are not being of much help, Joe.

--
Gustavo
