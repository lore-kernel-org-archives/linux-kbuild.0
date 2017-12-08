Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34452 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751904AbdLHCQ5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Dec 2017 21:16:57 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 07 Dec 2017 18:16:56 -0800
From: Sodagudi Prasad <psodagud@codeaurora.org>
Subject: Re: unused-variable warning is getting disabled with clang
In-Reply-To: <20171207062602.GA12561@kroah.com>
References: <56cef2a644acc458b9457e3147abc4c0@codeaurora.org>
 <20171207062602.GA12561@kroah.com>
Message-ID: <c871326fca27c1b8fd81f838a604c634@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Greg Hackmann <ghackmann@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2017-12-06 22:26, Greg Kroah-Hartman wrote:
> On Wed, Dec 06, 2017 at 01:24:51PM -0800, Sodagudi Prasad wrote:
>> 
>> Hi All,
>> 
>> When kernel compiled with clang, following line is disabling the
>> unused-variable warning. This is not the case with gcc.
>> KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>> 
>> Are there any specific reasons for disabling unused-variable with 
>> clang?
> 
> Try it and see why it is disabled :)

Hi Greg,

When I have enabled -Wunused-variable warnings with clang, observed both 
-Wunused-variable and -Wunused-const-variable as expected.
It looks that, -Wunused-const-variable warnings are disabled explicitly 
with GCC as well.
commit -  c9c6837d39311b0c - "kbuild: move -Wunused-const-variable to 
W=1 warning level"

I could see following warnings along with couple of -Wunused-variables 
warnings with downstream code.
arch/arm64/crypto/sha1-ce-glue.c:118:1: warning: unused variable 
'cpu_feature_match_SHA1' [-Wunused-const-variable]
include/linux/cpufeature.h:48:33: note: expanded from macro 
'module_cpu_feature_match'
arch/arm64/crypto/sha2-ce-glue.c:148:1: warning: unused variable 
'cpu_feature_match_SHA2' [-Wunused-const-variable]
arch/arm64/crypto/ghash-ce-glue.c:597:33: warning: unused variable 
'ghash_cpu_feature' [-Wunused-const-variable]
arch/arm64/crypto/aes-ce-cipher.c:280:1: warning: unused variable 
'cpu_feature_match_AES' [-Wunused-const-variable]
arch/arm64/crypto/aes-glue.c:674:1: warning: unused variable 
'cpu_feature_match_AES' [-Wunused-const-variable]
kernel/trace/ftrace.c:1092:27: warning: unused variable 
'ftrace_swapper_pid' [-Wunused-const-variable]
drivers/usb/host/ehci-platform.c:406:36: warning: unused variable 
'ehci_acpi_match' [-Wunused-const-variable]
drivers/usb/host/xhci-plat.c:416:36: warning: unused variable 
'usb_xhci_acpi_match' [-Wunused-const-variable]

So I have made following change and I will share patch for the same.

diff --git a/Makefile b/Makefile
index 4e6da2f..8a6c14e 100644
--- a/Makefile
+++ b/Makefile
@@ -711,7 +711,7 @@ endif
  KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) -meabi gnu
  KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
  KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
+KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
  KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
  KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)

Please let me know if you have any concerns with this approach to 
identify all unused local variables.

-Thanks, Prasad

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
Linux Foundation Collaborative Project
