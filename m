Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:65032 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752283AbeBFIkM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 03:40:12 -0500
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com [209.85.213.53]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w168e9SL020765
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Feb 2018 17:40:10 +0900
Received: by mail-vk0-f53.google.com with SMTP id h69so634303vke.7
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2018 00:40:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGw6cBuHm+D1pdzZFmOrWjPaspE6CTS_-gG6zLFJLLU-aS4nxA@mail.gmail.com>
References: <20180128225838.1275-1-mforney@mforney.org> <CAGw6cBuHm+D1pdzZFmOrWjPaspE6CTS_-gG6zLFJLLU-aS4nxA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Feb 2018 17:39:28 +0900
Message-ID: <CAK7LNARURw7O5qrAvEvy6SEiDtPKzb=6HtZo84ANLqUCHFHmrw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use ls(1) instead of stat(1) to obtain file size
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Forney <mforney@mforney.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-01-30 17:01 GMT+09:00 Michael Forney <mforney@mforney.org>:
> On 2018-01-28, Michael Forney <mforney@mforney.org> wrote:
>> From: Michael Forney <forney@google.com>
>>
>> stat(1) is not standardized and different implementations have their own
>> (conflicting) flags for querying the size of a file.
>>
>> ls(1) provides the same information (value of st.st_size) in the 5th
>> column,
>> except when the file is a character or block device.
>
> Forgot to add
>
> Signed-off-by: Michael Forney <forney@google.com>
>
>> ---
>>  scripts/Makefile.lib    | 3 ++-
>>  scripts/link-vmlinux.sh | 6 ++++--
>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 7dee1da83e2a..24566d1c10d2 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -319,7 +319,8 @@ dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
>>  size_append = printf $(shell                                         \
>>  dec_size=0;                                                          \
>>  for F in $1; do                                                              \
>> -     fsize=$$(stat -c "%s" $$F);                                     \
>> +     set -- $$(ls -dn $$F);                                          \
>> +     fsize=$$5;                                                      \
>>       dec_size=$$(expr $$dec_size + $$fsize);                         \
>>  done;                                                                        \
>>  printf "%08x\n" $$dec_size |                                         \


I sometimes see patches that address portability.
But, the resulted code is generally ugly.
(I would not say this is too ugly in this case.)


Also, I see some more instances.
If 'stat' is a problem,
do you have an idea for alternative of "stat -c %Y"?

$ git grep 'stat -c'
Documentation/acpi/ssdt-overlays.txt:dd if=$tmp
of="$EFIVARFS/$name-$guid" bs=$(stat -c %s $tmp)
arch/arm/boot/deflate_xip_data.sh:file_end=$(stat -c "%s" "$XIPIMAGE")
arch/blackfin/boot/install.sh:  local stamp=$(stat -c %Y ${file} 2>/dev/null)
arch/powerpc/boot/wrapper:strip_size=$(stat -c %s $vmz.$$)
tools/testing/selftests/efivarfs/efivarfs.sh:   if [ $(stat -c %s
$file) -ne 5 ]; then




>> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
>> index c0d129d7f430..4a5737647a79 100755
>> --- a/scripts/link-vmlinux.sh
>> +++ b/scripts/link-vmlinux.sh
>> @@ -296,8 +296,10 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
>>       kallsyms .tmp_vmlinux2 .tmp_kallsyms2.o
>>
>>       # step 3
>> -     size1=$(stat -c "%s" .tmp_kallsyms1.o)
>> -     size2=$(stat -c "%s" .tmp_kallsyms2.o)
>> +     set -- $(ls -dn .tmp_kallsyms1.o)
>> +     size1=$5
>> +     set -- $(ls -dn .tmp_kallsyms2.o)
>> +     size2=$5
>>
>>       if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
>>               kallsymso=.tmp_kallsyms3.o
>> --
>> 2.15.1
>>
>>







-- 
Best Regards
Masahiro Yamada
