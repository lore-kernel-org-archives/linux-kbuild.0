Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:45451 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbeHPWYL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Aug 2018 18:24:11 -0400
Received: by mail-qt0-f193.google.com with SMTP id y5-v6so6083352qti.12
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Aug 2018 12:23:52 -0700 (PDT)
Subject: Re: [PATCH] kbuild: Fix LOADLIBES rename in
 Documentation/kbuild/makefiles.txt
References: <20180816170555.21623-1-msuchanek@suse.de>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <4f6673db-5b59-c3b1-042c-b36057c31c13@redhat.com>
Date: Thu, 16 Aug 2018 12:23:48 -0700
MIME-Version: 1.0
In-Reply-To: <20180816170555.21623-1-msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Suchanek <msuchanek@suse.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/16/2018 10:05 AM, Michal Suchanek wrote:
> Fixes: 8377bd2b9ee1 ("kbuild: Rename HOST_LOADLIBES to
> 		KBUILD_HOSTLDLIBS")
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Acked-by: Laura Abbott <labbott@redhat.com>

> ---
>   Documentation/kbuild/makefiles.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 766355b1d221..7b6a2b2bdc98 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -680,7 +680,7 @@ Both possibilities are described in the following.
>   
>   	Example:
>   		#scripts/kconfig/Makefile
> -		HOSTLOADLIBES_qconf := -L$(QTDIR)/lib
> +		HOSTLDLIBS_qconf := -L$(QTDIR)/lib
>   
>   	When linking qconf, it will be passed the extra option
>   	"-L$(QTDIR)/lib".
> 
