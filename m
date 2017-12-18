Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20003 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752847AbdLRPc6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Dec 2017 10:32:58 -0500
MIME-Version: 1.0
In-Reply-To: <c871326fca27c1b8fd81f838a604c634@codeaurora.org>
References: <56cef2a644acc458b9457e3147abc4c0@codeaurora.org>
 <20171207062602.GA12561@kroah.com> <c871326fca27c1b8fd81f838a604c634@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Dec 2017 00:32:14 +0900
Message-ID: <CAK7LNAQAtPQOXPKyhrs4w7cLXoO5vpM9_Yi_=_G0gNYmNNv_FA@mail.gmail.com>
Subject: Re: unused-variable warning is getting disabled with clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sodagudi Prasad <psodagud@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Marek <mmarek@suse.com>, Greg Hackmann <ghackmann@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-12-08 11:16 GMT+09:00 Sodagudi Prasad <psodagud@codeaurora.org>:
> On 2017-12-06 22:26, Greg Kroah-Hartman wrote:
>>
>> On Wed, Dec 06, 2017 at 01:24:51PM -0800, Sodagudi Prasad wrote:
>>>
>>>
>>> Hi All,
>>>
>>> When kernel compiled with clang, following line is disabling the
>>> unused-variable warning. This is not the case with gcc.
>>> KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>>>
>>> Are there any specific reasons for disabling unused-variable with clang?
>>
>>
>> Try it and see why it is disabled :)
>
>
> Hi Greg,
>
> When I have enabled -Wunused-variable warnings with clang, observed both
> -Wunused-variable and -Wunused-const-variable as expected.
> It looks that, -Wunused-const-variable warnings are disabled explicitly with
> GCC as well.
> commit -  c9c6837d39311b0c - "kbuild: move -Wunused-const-variable to W=1
> warning level"
>
> I could see following warnings along with couple of -Wunused-variables
> warnings with downstream code.
> arch/arm64/crypto/sha1-ce-glue.c:118:1: warning: unused variable
> 'cpu_feature_match_SHA1' [-Wunused-const-variable]
> include/linux/cpufeature.h:48:33: note: expanded from macro
> 'module_cpu_feature_match'
> arch/arm64/crypto/sha2-ce-glue.c:148:1: warning: unused variable
> 'cpu_feature_match_SHA2' [-Wunused-const-variable]
> arch/arm64/crypto/ghash-ce-glue.c:597:33: warning: unused variable
> 'ghash_cpu_feature' [-Wunused-const-variable]
> arch/arm64/crypto/aes-ce-cipher.c:280:1: warning: unused variable
> 'cpu_feature_match_AES' [-Wunused-const-variable]
> arch/arm64/crypto/aes-glue.c:674:1: warning: unused variable
> 'cpu_feature_match_AES' [-Wunused-const-variable]
> kernel/trace/ftrace.c:1092:27: warning: unused variable 'ftrace_swapper_pid'
> [-Wunused-const-variable]
> drivers/usb/host/ehci-platform.c:406:36: warning: unused variable
> 'ehci_acpi_match' [-Wunused-const-variable]
> drivers/usb/host/xhci-plat.c:416:36: warning: unused variable
> 'usb_xhci_acpi_match' [-Wunused-const-variable]
>
> So I have made following change and I will share patch for the same.
>
> diff --git a/Makefile b/Makefile
> index 4e6da2f..8a6c14e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -711,7 +711,7 @@ endif
>  KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) -meabi gnu
>  KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
>  KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
>  KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
>
> Please let me know if you have any concerns with this approach to identify
> all unused local variables.
>
> -Thanks, Prasad

This approach seems good, but
KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
will be common for GCC and Clang.


Please move it out of  "ifeq ... else .. endif"




-- 
Best Regards
Masahiro Yamada
