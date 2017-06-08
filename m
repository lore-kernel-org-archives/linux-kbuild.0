Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:23627 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751123AbdFHSDK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jun 2017 14:03:10 -0400
MIME-Version: 1.0
In-Reply-To: <20170601145707.590629-1-arnd@arndb.de>
References: <20170601145707.590629-1-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 9 Jun 2017 03:02:54 +0900
Message-ID: <CAK7LNASpADhFfcMKOVPhn1q43vn5J7Jhy+m6EJCU2FBMut3QJg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: speed up checksyscalls.sh
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

Hi Arnd,

2017-06-01 23:57 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> checksyscalls.sh is run at every "make" run while building the kernel,
> even if no files have changed. I looked at where we spend time in
> a trivial empty rebuild and found checksyscalls.sh to be a source
> of noticeable overhead, as it spawns a lot of child processes just
> to call 'cat' copying from stdin to stdout, once for each of the
> over 400 x86 syscalls.
>
> Using a shell-builtin (echo) instead of the external command gives
> us a 13x speedup:
>
>     Before                 After
> real    0m1.018s       real     0m0.077s
> user    0m0.068s       user     0m0.048s
> sys     0m0.156s       sys      0m0.024s
>
> The time it took to rebuild a single file on my machine dropped
> from 5.5 seconds to 4.5 seconds.
>


I will apply this patch.
On my PC, I did not see such a big difference as you saw, though.
Big or small, it is speed-up anyway.


My test result.  Three times for each.


Without this patch:

masahiro@grover:~/workspace/linux$ time make  prepare0
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh

real 0m0.556s
user 0m0.048s
sys 0m0.028s
masahiro@grover:~/workspace/linux$ time make  prepare0
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh

real 0m0.531s
user 0m0.052s
sys 0m0.012s
masahiro@grover:~/workspace/linux$ time make  prepare0
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh

real 0m0.530s
user 0m0.040s
sys 0m0.020s



With this patch:

masahiro@grover:~/workspace/linux$ git log -1 --oneline
b7a9f79 kbuild: speed up checksyscalls.sh
masahiro@grover:~/workspace/linux$ time make  prepare0
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh

real 0m0.384s
user 0m0.040s
sys 0m0.008s
masahiro@grover:~/workspace/linux$ time make  prepare0
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh

real 0m0.386s
user 0m0.048s
sys 0m0.000s
masahiro@grover:~/workspace/linux$ time make  prepare0
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh

real 0m0.384s
user 0m0.024s
sys 0m0.024s




-- 
Best Regards
Masahiro Yamada
