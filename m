Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:37043 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753467AbeGFI7d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 04:59:33 -0400
Subject: Re: [PATCH] kbuild: document the KBUILD_KCONFIG env. variable
References: <70d08f42-27e4-ccc2-00f6-266568123d8c@infradead.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <a8a9fa55-3dcc-f13f-ad4a-6f7ee2c23aa3@cn.fujitsu.com>
Date: Fri, 6 Jul 2018 16:58:17 +0800
MIME-Version: 1.0
In-Reply-To: <70d08f42-27e4-ccc2-00f6-266568123d8c@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>



On 07/05/2018 10:47 AM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Add usage info for the Kbuild environment variable KBUILD_KCONFIG.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

I can recall this variable does take me a little while to find out its
meaning during my earliest time in kbuild, so,

Acked-by: Cao jin <caoj.fnst@cn.fujitsu.com>

-- 
Sincerely,
Cao jin

> ---
>  Documentation/kbuild/kbuild.txt |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> --- lnx-418-rc3.orig/Documentation/kbuild/kbuild.txt
> +++ lnx-418-rc3/Documentation/kbuild/kbuild.txt
> @@ -50,6 +50,11 @@ LDFLAGS_MODULE
>  --------------------------------------------------
>  Additional options used for $(LD) when linking modules.
>  
> +KBUILD_KCONFIG
> +--------------------------------------------------
> +Set the top-level Kconfig file to the value of this environment
> +variable.  The default name is "Kconfig".
> +
>  KBUILD_VERBOSE
>  --------------------------------------------------
>  Set the kbuild verbosity. Can be assigned same values as "V=...".
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 




