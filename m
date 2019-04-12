Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:41852 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfDLGGd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Apr 2019 02:06:33 -0400
Subject: Re: [PATCH] memory: ti-emif-sram: move driver-specific asm-offset.h
 to drivers/memory/
References: <20190412030941.11373-1-yamada.masahiro@socionext.com>
From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Message-ID: <cc07c258-20fe-9f34-2c73-639ac98bc5ce@oracle.com>
Date: Thu, 11 Apr 2019 23:06:11 -0700
MIME-Version: 1.0
In-Reply-To: <20190412030941.11373-1-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <treding@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>, Dmitry Osipenko <digetx@gmail.com>

On 4/11/19 8:09 PM, Masahiro Yamada wrote:
> <generated/ti-emif-asm-offsets.h> is only generated and included
> by drivers/memory/, so it does not need to reside in the globally
> visible include/generated/.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> I will apply this to linux-kbuild since this depends on
> another patch there.
> 
Sure.
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
