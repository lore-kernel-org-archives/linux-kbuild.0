Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:43662 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750811AbeCLTPk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Mar 2018 15:15:40 -0400
Received: by mail-qk0-f180.google.com with SMTP id j4so12706271qke.10
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Mar 2018 12:15:39 -0700 (PDT)
Date: Mon, 12 Mar 2018 15:15:37 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related
 problems
In-Reply-To: <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1803121331280.28583@knanqh.ubzr>
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com> <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Thomas Lindroth <thomas.lindroth@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, 13 Mar 2018, Masahiro Yamada wrote:

> +CC Nicolas Pitre
> 
> 
> 2018-03-05 22:07 GMT+09:00 Thomas Lindroth <thomas.lindroth@gmail.com>:
> > I upgraded to 4.14.23 from an earlier kernel series a while ago and 
> > turned on some new options. Soon after I noticed one of my virtual 
> > machines didn't work right. It's a kvm based VM using vfio for 
> > assigning a pci device to the VM. The guest OS could no longer 
> > initialize that pci device. After a lot of trial and error I 
> > narrowed down the problem to TRIM_UNUSED_KSYMS, which I enabled in 
> > the upgrade.
> >
> > If and only if TRIM_UNUSED_KSYMS is enabled the guest gets the error 
> > "code 43" which is a generic error code meaning failure to 
> > initialize driver in windows based OS. I don't notice any other 
> > problems besides that.
> >
> > As I understand it TRIM_UNUSED_KSYMS will build the kernel and 
> > modules, then check which symbols are used by the modules and remove 
> > all unused EXPORT_SYMBOL_* from the kernel and rebuild it again. 

Yes, or it may add symbols that were missing before rebuilding again. 
Sometimes both, especially if the difference between "before" and 
"after" numbers doesn't match the "changed" one like your example below.

> > When I build the kernel I get a line like "KSYMS symbols: 
> > before=1872, after=1871, changed=17" followed by rebuild of a few 
> > files. One of the rebuilt files is always drivers/pci/access.c which 
> > looks suspicions based on the error I get.

What exactly did you do between the build that gave you the above KSYMS 
line and the build that preceded it? Did you modify your kernel config?

> > EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
> > EXPORT_SYMBOL_GPL(pci_user_write_config_##size);
> > 
> > drivers/pci/access.c got these two exports. They stand out because 
> > they are macros instead of functions.

If you look in drivers/pci/.access.o.cmd you should see lines like:

    $(wildcard include/config/ksym/pci/bus/read/config/byte.h) \
    $(wildcard include/config/ksym/pci/bus/read/config/word.h) \
    $(wildcard include/config/ksym/pci/bus/read/config/dword.h) \
    $(wildcard include/config/ksym/pci/bus/write/config/byte.h) \
    $(wildcard include/config/ksym/pci/bus/write/config/word.h) \
    $(wildcard include/config/ksym/pci/bus/write/config/dword.h) \

Those are the result of the above two EXPORT_SYMBOL lines when the macro 
containing them are expanded. If you don't have those then 
drivers/pci/access.c would not be rebuilt when needed in some cases.

> > The only place they are used 
> > in the kernel is vfio. All other uses are for accessing pci config 
> > space from userspace. I don't think anything in my userspace tries 
> > to access pci config space so that could explain why I only see a 
> > problem with the vfio based VM. I don't know why TRIM_UNUSED_KSYMS 
> > cause problems with vfio but I suspect those macros are related.
> >
> > When testing various config options I would change an option, run 
> > make clean followed by make. Turns out make clean doesn't clean 
> > include/generated/autoksyms.h. That's why the KSYMS line reported 
> > before=1872 instead of before=0. I guessed the kernel build might be 
> > confused about which files needed rebuilding so I tried to use a 
> > clean build path instead. That did not help to resolve the VM 
> > problem but it did result in build failures.
> >
> > The build failure is intermittent and only happens about once every 10 builds.

So far I can't reproduce any build failure here.

> > Here is the full "make V=1 j1" output from a failed build:
> > https://gist.githubusercontent.com/anonymous/3ee68c7936248c6f0772bcac8c5b6257/raw/b62df75c5329ec8f3bf556da1145bdf69d5d69f8/gistfile1.txt
> > Here is the same output from a build that succeeds:
> > https://gist.githubusercontent.com/anonymous/85331c68f448781ba64bbaafcd5cb47f/raw/55a86eff8a5e42fe93c26ce1df2aa7c96d1ae803/gistfile1.txt
> > Here is the .config I used:
> > https://gist.githubusercontent.com/anonymous/0d5eceb5ae65ffc5e853fb2664bb3acb/raw/8ca8f1a35468b5aac5b6485a12e71362e8d83ff3/gistfile1.txt
> >
> > Sorry for using gist links but the output is probably too big for the mailing list and regular pastebins.
> >
> > The build failure always looks something like this but the undefined symbols varies:
> >   Building modules, stage 2.
> >   MODPOST 146 modules
> > ERROR: "__put_user_2" [net/ipv4/netfilter/ip_tables.ko] undefined!
> > ERROR: "__put_user_2" [net/ipv4/netfilter/arp_tables.ko] undefined!
> > ERROR: "__put_user_8" [fs/udf/udf.ko] undefined!
> > ERROR: "__put_user_4" [fs/udf/udf.ko] undefined!
> > ERROR: "__put_user_8" [fs/fat/fat.ko] undefined!
> > ERROR: "__put_user_1" [fs/fat/fat.ko] undefined!
[...]

Clearly something failed to rebuild arch/x86/lib/putuser.S that provides 
those symbols. When that happens, make sure your 
arch/x86/lib/.putuser.o.cmd has the following lines:

    $(wildcard include/config/ksym///put/user/1.h) \
    $(wildcard include/config/ksym///put/user/2.h) \
    $(wildcard include/config/ksym///put/user/4.h) \
    $(wildcard include/config/ksym///put/user/8.h) \

You just have to replace _ with / to search for those symbols. Then look 
at the file date for those actual files i.e.:

$ ls --full-time include/config/ksym///put/user/1.h
-rw-rw-r-- 1 nico nico 0 2018-03-12 13:51:07.176136516 -0400 include/config/ksym///put/user/1.h

And that ought to be older than the kernel file:

$ ls --full-time vmlinux.o
-rw-rw-r-- 1 nico nico 547474544 2018-03-12 13:52:35.728357983 -0400 vmlinux.o

If so then verify that include/generated/autoksyms.h has the 
corresponding defines:

$ grep __put_user_ include/generated/autoksyms.h
#define __KSYM___put_user_1 1
#define __KSYM___put_user_2 1
#define __KSYM___put_user_4 1
#define __KSYM___put_user_8 1

If all the above is true then something really weird is happening.

> > The only difference between the two pasted build logs is that the failing build doesn't rebuild arch/x86/lib/retpoline.S.
> 
> Indeed.  retpoline.o is not recompiled in the first log.
> Is the content of arch/x86/lib/.retpoline.o.cmd between the success
> case and the failure?

Would be good to see the difference if any.

The list of symbols it provides is:

    $(wildcard include/config/ksym///x86/indirect/thunk/rax.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/rbx.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/rcx.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/rdx.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/rsi.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/rdi.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/rbp.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/r8.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/r9.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/r10.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/r11.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/r12.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/r13.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/r14.h) \
    $(wildcard include/config/ksym///x86/indirect/thunk/r15.h) \
    $(wildcard include/config/ksym///fill/rsb.h) \
    $(wildcard include/config/ksym///clear/rsb.h) \

Do you get any of those in your modpost error list?

Also... is the build always failing because of symbols starting with one 
or more underscores?

What filesystem are you using on your build system?


Nicolas
