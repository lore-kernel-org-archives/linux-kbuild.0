Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:8617 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753486AbdKABjV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Oct 2017 21:39:21 -0400
Subject: Re: [PATCH] kbuild: comments correction & update
From: Cao jin <caoj.fnst@cn.fujitsu.com>
References: <20171101013135.3989-1-caoj.fnst@cn.fujitsu.com>
Message-ID: <d9fa4839-5c4b-f8da-02cc-40a398ead229@cn.fujitsu.com>
Date: Wed, 1 Nov 2017 09:38:59 +0800
MIME-Version: 1.0
In-Reply-To: <20171101013135.3989-1-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net



On 11/01/2017 09:31 AM, Cao jin wrote:
> host-cmulti means the composite host program that is compiled/linked
> from several .c file, not .o file, because .o file could also be
> compiled from .cpp file.
> 
> Bonus: update the stale comment.
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  scripts/Makefile.host | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 9cfd5c84d76f..103a4bec4ba5 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -25,11 +25,11 @@ host-cshlib := $(sort $(hostlibs-y) $(hostlibs-m))
>  host-cxxshlib := $(sort $(hostcxxlibs-y) $(hostcxxlibs-m))
>  
>  # C code
> -# Executables compiled from a single .c file
> +# C Executables compiled from a single .c file
>  host-csingle	:= $(foreach m,$(__hostprogs), \
>  			$(if $($(m)-objs)$($(m)-cxxobjs),,$(m)))
>  
> -# C executables linked based on several .o files
> +# C executables compiled from several .c files, and only .c files
>  host-cmulti	:= $(foreach m,$(__hostprogs),\
>  		   $(if $($(m)-cxxobjs),,$(if $($(m)-objs),$(m))))
>  
> @@ -50,7 +50,7 @@ host-cxxshobjs	:= $(sort $(foreach m,$(host-cxxshlib),$($(m:.so=-objs))))
>  
>  # output directory for programs/.o files
>  # hostprogs-y := tools/build may have been specified.
> -# Retrieve also directory of .o files from prog-objs or prog-cxxobjs notation
> +# Retrieve also directory of .o files from host-objs or host-cxxobjs notation>  host-objdirs := $(dir $(__hostprogs) $(host-cobjs) $(host-cxxobjs))
>  
>  host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
> 

Sorry for a tiny error(host-objs) here, I will send v2 right now.
-- 
Sincerely,
Cao jin


