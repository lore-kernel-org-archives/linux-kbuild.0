Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:57034 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751963AbeDRROy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Apr 2018 13:14:54 -0400
Subject: Re: [PATCH] ARM: omap2: Fix build when using split object directories
References: <20180411211543.7923-1-d-gerlach@ti.com>
 <20180412082157.GB4002@localhost.localdomain>
 <CAK7LNAQiq-4daX2K4dPyzN7zr+yfkQWSJ-yy9JHgacPpYFp94w@mail.gmail.com>
 <4343a047-18b1-409d-ccda-94e72ea63e2a@ti.com>
 <20180418170903.GG5671@atomide.com>
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Message-ID: <01112996-beb6-8baf-ff87-db7b3adde245@oracle.com>
Date: Wed, 18 Apr 2018 10:14:07 -0700
MIME-Version: 1.0
In-Reply-To: <20180418170903.GG5671@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>, Dave Gerlach <d-gerlach@ti.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Anders Roxell <anders.roxell@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux-OMAP <linux-omap@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On 4/18/2018 10:09 AM, Tony Lindgren wrote:
> * Dave Gerlach <d-gerlach@ti.com> [180413 14:08]:
>> This is the version of this patch that we want to use, will this go through you?
> 
> Sorry for the delay, I just noticed this. Somehow I thought Santosh
> would queue it, but as the regression was introduced by a commit in
> my tree I'll pick this patch into omap-for-v4.17/fixes.
> 
I wasn't sure since the patch has both driver and platform code.
Thanks for picking up Tony !!

Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
