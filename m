Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:41096 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbfLEDgf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 22:36:35 -0500
Subject: Re: [PATCH 2/2] fix the SPDX syntax and bash interprester pointer
References: <20191203095339.615774-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <56303cd3-fcf8-49cd-f66a-4db7e382774c@infradead.org>
Date: Wed, 4 Dec 2019 19:36:32 -0800
MIME-Version: 1.0
In-Reply-To: <20191203095339.615774-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/3/19 1:53 AM, Bhaskar Chowdhury wrote:
> SPDX syntax was complining by checkpatch fixed it,added space before it.
> And add bash interpreter to find by the env .
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/kernel_modules_info.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_info.sh
> index f005c47a3aa6..3a9b00988ed3 100755
> --- a/scripts/kernel_modules_info.sh
> +++ b/scripts/kernel_modules_info.sh
> @@ -1,5 +1,5 @@
> -#!/bin/bash - 
> -#SPDX-License-Identifier: GPL-2.0
> +#!/usr/bin/env bash 
> +# SPDX-License-Identifier: GPL-2.0
>  #===============================================================================
>  #
>  #          FILE: kernel_modules_info.sh
> 

a.  There is no good reason for patch 2/2.  Just merge the 2 patches.

b.  The big header comment in patch 1/2 is not needed and is unwanted.
Just put some or all of that in the patch description/comment message.


-- 
~Randy
