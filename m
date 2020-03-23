Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:3004 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbgCWFiF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Mar 2020 01:38:05 -0400
Subject: Re: using libbpf in external projects
References: <CAHmME9ptzBzzn+jOo=azZagB=TTFbc2vzdcYurfsE0_1nvKF+g@mail.gmail.com>
From: Yonghong Song <yhs@fb.com>
Message-ID: <50c6bd77-fb16-852a-adcc-3976550f6f81@fb.com>
Date: Sun, 22 Mar 2020 22:37:56 -0700
In-Reply-To: <CAHmME9ptzBzzn+jOo=azZagB=TTFbc2vzdcYurfsE0_1nvKF+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, bpf@vger.kernel.org
Cc: nicolas@serveur.io, linux-kbuild@vger.kernel.org



On 3/22/20 11:50 AM, Jason A. Donenfeld wrote:
> Hi,
> 
> Nicolas (CC'd) and I are working on a small utility that does some bpf
> things. What it actually does isn't important. But I did just clean up
> its use of libbpf by way of a Makefile:
> 
>> KERNEL_VERSION := 5.5.11
>> PKG_CONFIG ?= pkg-config
>>
>> all: linux-$(KERNEL_VERSION)/.prepared
>>      @$(MAKE) --no-print-directory netifexec
>>
>> linux-$(KERNEL_VERSION)/.prepared:
>>      curl https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$(KERNEL_VERSION).tar.xz | tar xJf -
>>      touch $@
>>
>> CFLAGS ?= -O3
>> CFLAGS += -Ilinux-$(KERNEL_VERSION)/tools/lib/bpf -Ilinux-$(KERNEL_VERSION)/tools/include -Ilinux-$(KERNEL_VERSION)/tools/include/uapi
>> CFLAGS += -DHAVE_LIBELF_MMAP_SUPPORT
>> CFLAGS += -MMD -MP
>> CFLAGS += -std=gnu99 -D_GNU_SOURCE
>> CFLAGS += -Wall
>> CFLAGS += $(shell $(PKG_CONFIG) --cflags libelf zlib)
>> LDLIBS += $(shell $(PKG_CONFIG) --libs libelf zlib)
>>
>> netifexec: $(sort $(patsubst %.c,%.o,$(wildcard *.c linux-$(KERNEL_VERSION)/tools/lib/bpf/*.c)))
>>
>> clean:
>>      $(RM) netifexec *.o *.d linux-$(KERNEL_VERSION)/tools/lib/bpf/*.o linux-$(KERNEL_VERSION)/tools/lib/bpf/*.d
>>
>> mrproper: clean
>>      $(RM) -r linux-$(KERNEL_VERSION)
>>
>> .PHONY: all clean mrproper
> 
> Ignoring that piping curl to tar with no hash checking is unsafe, is
> this kind of embedding something you intended people would do to use
> this code externally? Or is there another distribution of this library
> from elsewhere that you'd recommend?

Jason, we have libbpf github mirror
    https://github.com/libbpf/libbpf
for the libbpf codes here.
Please take a look. The Makefile in the kernel tree contains some kernel
specific definitions/paths etc. The Makefile in the github is more 
suitable to be included/adapted for user space application.
You are welcome to contribute there (w.r.t. easy-to-use Makefile).

> 
> Jason
> 
