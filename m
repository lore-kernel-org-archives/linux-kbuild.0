Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:40601 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751508AbeCOSst (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 14:48:49 -0400
Received: by mail-lf0-f45.google.com with SMTP id e5-v6so7706917lfb.7
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Mar 2018 11:48:48 -0700 (PDT)
From: Thomas Lindroth <thomas.lindroth@gmail.com>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related
 problems
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com>
 <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com>
 <nycvar.YSQ.7.76.1803121331280.28583@knanqh.ubzr>
 <4bbfeb74-c912-74e5-4f4d-287ec7ad065d@gmail.com>
 <nycvar.YSQ.7.76.1803131922060.28583@knanqh.ubzr>
Message-ID: <4aee7e23-ac36-9495-14a9-471379a7896b@gmail.com>
Date: Thu, 15 Mar 2018 19:48:44 +0100
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1803131922060.28583@knanqh.ubzr>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 03/14/2018 02:43 AM, Nicolas Pitre wrote:
> Now, what's the date of include/generated/autoksyms.h compared to 
> arch/x86/lib/usercopy_64.o?
> 
> If include/generated/autoksyms.h is older than 
> arch/x86/lib/usercopy_64.o then the presence of __KSYM_clear_user in the 
> former should have instanciated the corresponding EXPORT_SYMBOL() in the 
> later.
> 
> If it is the other way around then you should compare the time for 
> arch/x86/lib/usercopy_64.o against include/config/ksym///clear/user.h. 
> If the later is newer than the former then something failed to notice 
> that usercopy_64.o wasn't up to date, in which case the makefile or make 
> itself might need some investigation.
> 
> If not then we'd have to look in the full build log to figure out if 
> __KSYM_clear_user existed in the previous version of 
> include/generated/autoksyms.h before it was refreshed by 
> adjust_autoksyms.sh. If it was then we're back to if #1 above. If not 
> then the timestamp for include/config/ksym///clear/user.h hasn't been 
> updated as it should.
 
Here are the timestamps for the fail case:
-rw-r--r-- 1 cocobo cocobo 66424 2018-03-13 17:20:18.000000000 +0100 linux-fail/include/generated/autoksyms.h
-rw-r--r-- 1 cocobo cocobo 121064 2018-03-13 17:16:53.000000000 +0100 linux-fail/arch/x86/lib/usercopy_64.o
-rw-r--r-- 1 cocobo cocobo 0 2018-03-13 17:16:53.000000000 +0100 linux-fail/include/config/ksym///clear/user.h

It's suspicious that usercopy_64.o and ksym///clear/user.h got the same timestamp.
My gut feeling says that ksym///clear/user.h was touched after usercopy_64.o was
built but less than 1 sec had passed so they got the same timestamps due to the
poor timestamp resolution on my old ext4 filesystem. Since the timestamps on 
ksym///clear/user.h wasn't newer than usercopy_64.o the rebuild was skipped.

  AS      arch/x86/lib/putuser.o
  AS      arch/x86/lib/retpoline.o    <---
  AS      arch/x86/lib/rwsem.o
  CC      arch/x86/lib/usercopy.o
  CC      arch/x86/lib/usercopy_64.o  <---
  AR      arch/x86/lib/lib.a
  EXPORTS arch/x86/lib/lib-ksyms.o
  AR      arch/x86/lib/built-in.o
  CC      virt/lib/irqbypass.o
  AR      virt/lib/built-in.o
  AR      virt/built-in.o
  CHK     include/generated/autoksyms.h
  KSYMS   symbols: before=0, after=1871, changed=1871

The problematic usercopy_64.o and retpoline.o are built just before ksym. The build
and ksym generation probably happens in less than 1 sec.

Here are the timestamps for the success case:
-rw-r--r-- 1 cocobo cocobo 66424 2018-03-13 16:58:02.000000000 +0100 linux-success/include/generated/autoksyms.h
-rw-r--r-- 1 cocobo cocobo 126912 2018-03-13 16:58:01.000000000 +0100 linux-success/arch/x86/lib/usercopy_64.o
-rw-r--r-- 1 cocobo cocobo 0 2018-03-13 16:54:38.000000000 +0100 linux-success/include/config/ksym///clear/user.h

usercopy_64.o was rebuilt here so it has a more recent timestamp than ksym///clear/user.h.

To test this a bit more I copied the 4.14.23 source to tmpfs and ran the build there.
Tmpfs supports nanosecond timestamps. The build succeeded 16 times in a row. Usually
there is around 50/50 chance of success/failure on ext4.

>>> Also... is the build always failing because of symbols starting with one 
>>> or more underscores?
>>
>> The type of failures I've seen so far are:
>>
>> ERROR: "clear_user" [drivers/media/v4l2-core/videodev.ko] undefined!
>> ERROR: "__clear_user" [arch/x86/kvm/kvm.ko] undefined!
>>
>> ERROR: "__fill_rsb" [arch/x86/kvm/kvm-intel.ko] undefined!
>>
>> ERROR: "__put_user_2" [net/ipv4/netfilter/ip_tables.ko] undefined!
>> ERROR: "__put_user_2" [net/ipv4/netfilter/arp_tables.ko] undefined!
>> ERROR: "__put_user_8" [fs/udf/udf.ko] undefined!
>> ERROR: "__put_user_4" [fs/udf/udf.ko] undefined!
>> ERROR: "__put_user_8" [fs/fat/fat.ko] undefined!
>> ERROR: "__put_user_1" [fs/fat/fat.ko] undefined!
>> ERROR: "__put_user_4" [fs/fat/fat.ko] undefined!
>> ERROR: "__put_user_2" [fs/fat/fat.ko] undefined!
>> ERROR: "__put_user_4" [drivers/net/tap.ko] undefined!
>> ERROR: "__put_user_2" [drivers/net/tap.ko] undefined!
>> ERROR: "__put_user_8" [drivers/media/v4l2-core/videodev.ko] undefined!
>> ERROR: "__put_user_1" [drivers/media/v4l2-core/videodev.ko] undefined!
>> ERROR: "__put_user_4" [drivers/media/v4l2-core/videodev.ko] undefined!
>> ERROR: "__put_user_8" [drivers/input/joydev.ko] undefined!
>> ERROR: "__put_user_1" [drivers/input/joydev.ko] undefined!
>> ERROR: "__put_user_4" [drivers/input/joydev.ko] undefined!
>> ERROR: "__fill_rsb" [arch/x86/kvm/kvm-intel.ko] undefined!
>>
>> There might have been others but I didn't save every error message.
> 
> Maybe it is just a coincidence, but there is a lot of underscore 
> prefixed symbols in that list, except for one case. This translates to 
> successive / in the path for the timestamp file. And that one case that 
> doesn't fit the pattern does actually aliases a path that does. I wonder 
> if the filesystem cache could get confused by successive / in paths 
> here, given the non deterministic nature of the build failure you get. 
> 
> Could you please test with the following patch to validate this 
> hypothesis:
> 
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index 513da1a4a2..2205114add 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -79,6 +79,7 @@ changed=$(
>  count=0
>  sort "$cur_ksyms_file" "$new_ksyms_file" | uniq -u |
>  sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' | tr "A-Z_" "a-z/" |
> +sed -e 's|//*|/|g' -e 's|^/||' |
>  while read sympath; do
>  	if [ -z "$sympath" ]; then continue; fi
>  	depfile="include/config/ksym/${sympath}.h"
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index 449b68c4c9..57ae789f91 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -115,7 +115,7 @@ static void usage(void)
>   */
>  static void print_config(const char *m, int slen)
>  {
> -	int c, i;
> +	int c, prev_c = '/', i;
>  
>  	printf("    $(wildcard include/config/");
>  	for (i = 0; i < slen; i++) {
> @@ -124,7 +124,9 @@ static void print_config(const char *m, int slen)
>  			c = '/';
>  		else
>  			c = tolower(c);
> -		putchar(c);
> +		if (c != '/' || prev_c != '/')
> +			putchar(c);
> +		prev_c = c;
>  	}
>  	printf(".h) \\\n");
>  }
> 
> That would be very interesting if this patch fixed your build failures.

The patch applied with some fuzz to 4.14.23. Using the patch the first two
builds I did succeeded and the third failed like:
Kernel: arch/x86/boot/bzImage is ready  (#2)
  Building modules, stage 2.
  MODPOST 146 modules
ERROR: "__put_user_2" [net/ipv4/netfilter/ip_tables.ko] undefined!
ERROR: "__put_user_2" [net/ipv4/netfilter/arp_tables.ko] undefined!
ERROR: "__put_user_8" [fs/udf/udf.ko] undefined!
ERROR: "__put_user_4" [fs/udf/udf.ko] undefined!
ERROR: "__put_user_8" [fs/fat/fat.ko] undefined!
ERROR: "__put_user_1" [fs/fat/fat.ko] undefined!
ERROR: "__put_user_4" [fs/fat/fat.ko] undefined!
ERROR: "__put_user_2" [fs/fat/fat.ko] undefined!
ERROR: "__put_user_4" [drivers/net/tap.ko] undefined!
ERROR: "__put_user_2" [drivers/net/tap.ko] undefined!
ERROR: "__put_user_8" [drivers/media/v4l2-core/videodev.ko] undefined!
ERROR: "__put_user_1" [drivers/media/v4l2-core/videodev.ko] undefined!
ERROR: "__put_user_4" [drivers/media/v4l2-core/videodev.ko] undefined!
ERROR: "__put_user_8" [drivers/input/joydev.ko] undefined!
ERROR: "__put_user_1" [drivers/input/joydev.ko] undefined!
ERROR: "__put_user_4" [drivers/input/joydev.ko] undefined!
ERROR: "__fill_rsb" [arch/x86/kvm/kvm-intel.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:92: __modpost] Error 1
make: *** [Makefile:1218: modules] Error 2
