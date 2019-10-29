Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:41612 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfJ2WBN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 18:01:13 -0400
Subject: Re: [RFC PATCH] kconfig: Add option to get the full help text with
 listnewconfig
References: <20191029181702.21460-1-labbott@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <53da077f-b4d6-c123-bcbc-ae531fdcc410@infradead.org>
Date: Tue, 29 Oct 2019 15:01:12 -0700
MIME-Version: 1.0
In-Reply-To: <20191029181702.21460-1-labbott@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, jcline@redhat.com, dzickus@redhat.com

Hi Laura,

On 10/29/19 11:17 AM, Laura Abbott wrote:
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index ef2f2336c469..aaaf1f62300c 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -66,7 +66,9 @@ localyesconfig localmodconfig: $(obj)/conf
>  #  syncconfig has become an internal implementation detail and is now
>  #  deprecated for external use
>  simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
> -	alldefconfig randconfig listnewconfig olddefconfig syncconfig
> +	alldefconfig randconfig listnewconfig olddefconfig syncconfig \
> +	extendedlistnewconfig
> +
>  PHONY += $(simple-targets)
>  
>  $(simple-targets): $(obj)/conf
> @@ -134,6 +136,7 @@ help:
>  	@echo  '  alldefconfig    - New config with all symbols set to default'
>  	@echo  '  randconfig	  - New config with random answer to all options'
>  	@echo  '  listnewconfig   - List new options'
> +	@echo  '  extendedlistnewconfig   - List new options'

This text should also say " and help text" similar to what conf.c does.

>  	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
>  	@echo  '                    default value without prompting'
>  	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'

I can't say that I like the name, but I won't try to paint it a
different color.

-- 
~Randy
