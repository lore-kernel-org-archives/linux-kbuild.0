Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:44686 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbeGZLSt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:18:49 -0400
MIME-Version: 1.0
In-Reply-To: <20180726092231.GA6916@kroah.com>
References: <20180726081358.3829157-1-arnd@arndb.de> <20180726092231.GA6916@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 Jul 2018 12:02:42 +0200
Message-ID: <CAK8P3a3g7VSu3W0DiMcUdLB0b1fmUaHJxEyC30K8EfP5a9T1ig@mail.gmail.com>
Subject: Re: [PATCH] [stable 4.14] turn off -Wattribute-alias
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "# 3.4.x" <stable@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jul 26, 2018 at 11:22 AM, Greg KH <gregkh@linuxfoundation.org> wrot=
e:
> On Thu, Jul 26, 2018 at 10:13:22AM +0200, Arnd Bergmann wrote:
>> Starting with gcc-8.1, we get a warning about all system call definition=
s,
>> which use an alias between functions with incompatible prototypes, e.g.:
>>
>> In file included from ../mm/process_vm_access.c:19:
>> ../include/linux/syscalls.h:211:18: warning: 'sys_process_vm_readv' alia=
s between functions of incompatible types 'long int(pid_t,  const struct io=
vec *, long unsigned int,  const struct iovec *, long unsigned int,  long u=
nsigned int)' {aka 'long int(int,  const struct iovec *, long unsigned int,=
  const struct iovec *, long unsigned int,  long unsigned int)'} and 'long =
int(long int,  long int,  long int,  long int,  long int,  long int)' [-Wat=
tribute-alias]
>>   asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
>>                   ^~~
>> ../include/linux/syscalls.h:207:2: note: in expansion of macro '__SYSCAL=
L_DEFINEx'
>>   __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>>   ^~~~~~~~~~~~~~~~~
>> ../include/linux/syscalls.h:201:36: note: in expansion of macro 'SYSCALL=
_DEFINEx'
>>  #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARG=
S__)
>>                                     ^~~~~~~~~~~~~~~
>> ../mm/process_vm_access.c:300:1: note: in expansion of macro 'SYSCALL_DE=
FINE6'
>>  SYSCALL_DEFINE6(process_vm_readv, pid_t, pid, const struct iovec __user=
 *, lvec,
>>  ^~~~~~~~~~~~~~~
>> ../include/linux/syscalls.h:215:18: note: aliased declaration here
>>   asmlinkage long SyS##name(__MAP(x,__SC_LONG,__VA_ARGS__)) \
>>                   ^~~
>> ../include/linux/syscalls.h:207:2: note: in expansion of macro '__SYSCAL=
L_DEFINEx'
>>   __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>>   ^~~~~~~~~~~~~~~~~
>> ../include/linux/syscalls.h:201:36: note: in expansion of macro 'SYSCALL=
_DEFINEx'
>>  #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARG=
S__)
>>                                     ^~~~~~~~~~~~~~~
>> ../mm/process_vm_access.c:300:1: note: in expansion of macro 'SYSCALL_DE=
FINE6'
>>  SYSCALL_DEFINE6(process_vm_readv, pid_t, pid, const struct iovec __user=
 *, lvec,
>>
>> This is really noisy and does not indicate a real problem. In the latest
>> mainline kernel, this was addressed by commit bee20031772a ("disable
>> -Wattribute-alias warning for SYSCALL_DEFINEx()"), which seems too invas=
ive
>> to backport.
>
> Too invasive?
>
> Here's the diffstat:
>          include/linux/compat.h   |    8 +++++++-
>          include/linux/syscalls.h |    4 ++++
>          2 files changed, 11 insertions(+), 1 deletion(-)
>
> That seems almost trivial to backport.  Did you try it and it caused
> other problems?
>
> Where ever possible, I always want to use the upstream commits.

I forward ported that patch a few times across kernels when that macro
changed in subtle ways. This was particularly tricky as some using the
new macro inside of another macro sometimes has different effects
based on seemingly unrelated changes: in particular the addition of
__MAP() in COMPAT_SYSCALL_DEFINEx that I had to do to work
around gcc pr83256 can easily break.

It also depends on commit 8793bb7f4a9d ("kbuild: add macro for
controlling warnings to linux/compiler.h") before it, which is not long
but does add new infrastructure.

      Arnd
