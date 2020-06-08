Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45227 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729294AbgFHK2P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 06:28:15 -0400
References: <20200514131234.380097-1-efremov@linux.com>
 <20200605073955.6384-1-efremov@linux.com>
 <20200608013012.GA216607@roeck-us.net>
 <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Subject: Re: [PATCH v5] kbuild: add variables for compression tools
Message-ID: <d7e4a235-35eb-1c13-09dc-19a523cbf4ea@linux.com>
Date: Mon, 8 Jun 2020 13:28:07 +0300
MIME-Version: 1.0
In-Reply-To: <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On 6/8/20 7:59 AM, Masahiro Yamada wrote:
> On Mon, Jun 8, 2020 at 10:30 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Hi,
>>
>> On Fri, Jun 05, 2020 at 10:39:55AM +0300, Denis Efremov wrote:
>>> Allow user to use alternative implementations of compression tools,
>>> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
>>> speed up the build:
>>> $ make GZIP=pigz BZIP2=pbzip2
>>>
>>> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
>>> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
>>> since 2015. However, alternative implementations (e.g., pigz) still rely
>>> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
>>>
>>
>> When building mips:defconfig, this patch results in:
>>
>> Building mips:defconfig ... failed
>> --------------
>> Error log:
>> /bin/sh: -n: command not found
>> make[3]: *** [kernel/config_data.gz] Error 127
>> make[3]: *** Deleting file 'kernel/config_data.gz'
>> make[3]: *** Waiting for unfinished jobs....
>> make[2]: *** [kernel] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>> make[1]: *** [autoksyms_recursive] Error 2
>> make: *** [__sub-make] Error 2
>>
>> Reverting this patch fixes the problem. Bisect log is attached.
>>
>> Guenter
>

I tried to reproduce it with cross-compilation on Fedora32.
$ export ARCH=mips
$ export CROSS_COMPILE=mips64-linux-gnu-
$ make defconfig
$ make -j12

And the kernel builds successfully. Could you please provide details about your
compilation steps and environment, esp. what "env | grep ZIP" shows,
"gzip --version", "sh --version", "bash --version"? This will be very helpful.

Additionally:
$ make GZIP=gzip -j12 # works
$ make GZIP=pigz -j12 # works
$ make GZIP=nosuchcommand -j12 # fails, as expected
 
> 
> Agh, this is because of CONFIG_TRIM_UNUSED_KSYMS.
> 

Hmm, it somehow works on my machine. But yes, this call looks like a problem
for these env vars:

autoksyms_recursive: descend modules.order                                       
        $(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \             
          "$(MAKE) -f $(srctree)/Makefile vmlinux" 

> Also, the distro package builds are broken
> e.g.  make GZIP=gzip bindeb-pkg
> 

Yes, thanks.

> Denis,
> 
> I think we should go back to the original
> KGZIP, KBZIP2, KLZOP.
> 

Given that the original patch is already in the Linus tree,
I've sent a hotfix. Commit message is not perfect, because I
didn't have enough time to deeply debug it. I just hope that
the original patch didn't broke too many builds. Maybe later
I will try to prepare a patch with GZIP again when I will fully
debug these corner cases.

Thanks,
Denis
