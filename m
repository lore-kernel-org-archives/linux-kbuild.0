Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729040AbgFHNwO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 09:52:14 -0400
Subject: Re: [PATCH v5] kbuild: add variables for compression tools
References: <20200514131234.380097-1-efremov@linux.com>
 <20200605073955.6384-1-efremov@linux.com>
 <20200608013012.GA216607@roeck-us.net>
 <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
 <d7e4a235-35eb-1c13-09dc-19a523cbf4ea@linux.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <adafe608-7502-fae2-9ff4-deefaec4783f@roeck-us.net>
Date: Mon, 8 Jun 2020 06:52:11 -0700
MIME-Version: 1.0
In-Reply-To: <d7e4a235-35eb-1c13-09dc-19a523cbf4ea@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 6/8/20 3:28 AM, Denis Efremov wrote:
> 
> 
> On 6/8/20 7:59 AM, Masahiro Yamada wrote:
>> On Mon, Jun 8, 2020 at 10:30 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> Hi,
>>>
>>> On Fri, Jun 05, 2020 at 10:39:55AM +0300, Denis Efremov wrote:
>>>> Allow user to use alternative implementations of compression tools,
>>>> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
>>>> speed up the build:
>>>> $ make GZIP=pigz BZIP2=pbzip2
>>>>
>>>> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
>>>> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
>>>> since 2015. However, alternative implementations (e.g., pigz) still rely
>>>> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
>>>>
>>>
>>> When building mips:defconfig, this patch results in:
>>>
>>> Building mips:defconfig ... failed
>>> --------------
>>> Error log:
>>> /bin/sh: -n: command not found
>>> make[3]: *** [kernel/config_data.gz] Error 127
>>> make[3]: *** Deleting file 'kernel/config_data.gz'
>>> make[3]: *** Waiting for unfinished jobs....
>>> make[2]: *** [kernel] Error 2
>>> make[2]: *** Waiting for unfinished jobs....
>>> make[1]: *** [autoksyms_recursive] Error 2
>>> make: *** [__sub-make] Error 2
>>>
>>> Reverting this patch fixes the problem. Bisect log is attached.
>>>
>>> Guenter
>>
> 
> I tried to reproduce it with cross-compilation on Fedora32.
> $ export ARCH=mips
> $ export CROSS_COMPILE=mips64-linux-gnu-
> $ make defconfig
> $ make -j12
> 
> And the kernel builds successfully. Could you please provide details about your
> compilation steps and environment, esp. what "env | grep ZIP" shows,
> "gzip --version", "sh --version", "bash --version"? This will be very helpful.
> 
> Additionally:
> $ make GZIP=gzip -j12 # works
> $ make GZIP=pigz -j12 # works
> $ make GZIP=nosuchcommand -j12 # fails, as expected
>  

I use

make -j30 ARCH=mips CROSS_COMPILE=mips64-linux- ...

ie I don't use environment variables. Using environment variables indeed makes
the problem "disappear". Also, it is important to run "make mrproper" first
to ensure that the generated file does not already exist.

make -j30 ARCH=mips CROSS_COMPILE=mips64-linux- GZIP=gzip ...

does not work for me.

Guenter
