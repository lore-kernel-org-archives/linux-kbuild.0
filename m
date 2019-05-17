Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.fireflyinternet.com ([109.228.58.192]:64206 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727065AbfEQIfl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 04:35:41 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190516194818.29230-1-jani.nikula@intel.com>
References: <20190516194818.29230-1-jani.nikula@intel.com>
Message-ID: <155808211071.12244.10320883277188429270@skylake-alporthouse-com>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are self-contained
Date: Fri, 17 May 2019 09:35:10 +0100
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@intel.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

Quoting Jani Nikula (2019-05-16 20:48:16)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 8a1f64f17740..c2839de06485 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -66,6 +66,9 @@ extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
>  extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
>  endif
>  
> +# Test self-contained headers
> +extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.o,$(header-test-y))

This didn't get pulled into clean-files.

clean-files-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.c,$(header-test-y))
?

Not enough. Nor is clean-files-y +=...

And it should also be put into the global gitignore I think.
-Chris
