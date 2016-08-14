Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37418 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845AbcHNTqP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 14 Aug 2016 15:46:15 -0400
Received: by mail-wm0-f53.google.com with SMTP id i5so68719611wmg.0
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Aug 2016 12:46:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.14.1608141150220.8131@trent.utfs.org>
References: <CAPq9eC_WASMqBms=fYUs09vKj=DhNwEUswFbVMvaryMU2r35rA@mail.gmail.com>
 <cf745f6e-0b02-7f63-4c8d-f61ad6a6ca32@nerdbynature.de> <alpine.DEB.2.20.14.1608141150220.8131@trent.utfs.org>
From: Kees Cook <keescook@chromium.org>
Date: Sun, 14 Aug 2016 12:46:11 -0700
Message-ID: <CAGXu5jLaPK5w=K-rQhJXB6VQ=bFcgEEEz8+cJGEDLzqDUzw3FQ@mail.gmail.com>
Subject: Re: [4.8-rc1] make bindeb-pkg O= fails
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christian Kujau <lists@nerdbynature.de>
Cc: Emese Revfy <re.emese@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>

On Sun, Aug 14, 2016 at 11:53 AM, Christian Kujau <lists@nerdbynature.de> wrote:
> [CC'ing Michal, Kees]
>
> On Tue, 9 Aug 2016, Christian Kujau wrote:
>> On Mon, 8 Aug 2016, frank paulsen wrote:
>> > in 4.8-rc1 "make bindeb-pkg O=../debian" fails:
>> > | find: `scripts/gcc-plugins': No such file or directory
>> > | /usr/src/linus/scripts/package/Makefile:97: recipe for target
>> > 'bindeb-pkg' failed
>> >
>> > this is due to a missing directory scripts/gcc-plugins if using O=
>> >
>> > removing line 335 of scripts/package/builddeb helps:
>> > | (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
>> > gcc-common.h) >> "$objtree/debian/hdrobjfiles"
>> >
>> > this clearly isn't the right fix, but i checked it anyway and the
>> > paket gets built.
>>
>> This was introduced in 6b90bd4ba40b38dc13c2782469c1c77e4ed79915 ("GCC
>> plugin infrastructure"). Not failing hard when scripts/gcc-plugins
>> cannot be found, does the trick as well. But that too just papers over
>> the issue. Hopefully Emese has a better idea on how to solve this :-)

(Sorry for white-space damaging...)

Does this fix it?

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index e1c09e2f9be7..8ea9fd2b6573 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -332,7 +332,9 @@ if grep -q '^CONFIG_STACK_VALIDATION=y'
$KCONFIG_CONFIG ; then
        (cd $objtree; find tools/objtool -type f -executable) >>
"$objtree/debian/hdrobjfiles"
 fi
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include
scripts -type f) >> "$objtree/debian/hdrobjfiles"
-(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
gcc-common.h) >> "$objtree/debian/hdrobjfiles"
+if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
+       (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
gcc-common.h) >> "$objtree/debian/hdrobjfiles"
+fi
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd
$destdir; tar -xf -)

(i.e. only attempt the find when CONFIG_GCC_PLUGINS has been selected
in the .config)

-Kees

>
> Emese, do you have a better approach here?
>
> Thanks,
> Christian.
>
>>
>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> index e1c09e2..89757f6 100755
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -332,7 +332,7 @@ if grep -q '^CONFIG_STACK_VALIDATION=y'
>> $KCONFIG_CONFIG ; then
>>       (cd $objtree; find tools/objtool -type f -executable) >>
>> "$objtree/debian/hdrobjfiles"
>>  fi
>>  (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts
>> -type f) >> "$objtree/debian/hdrobjfiles"
>> -(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
>> gcc-common.h) >> "$objtree/debian/hdrobjfiles"
>> +(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
>> gcc-common.h) >> "$objtree/debian/hdrobjfiles" || true
>>  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>>  mkdir -p "$destdir"
>>  (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd
>> $destdir; tar -xf -)
>>
>>
>> Thanks,
>> Christian.
> --
> BOFH excuse #382:
>
> Someone was smoking in the computer room and set off the halon systems.



-- 
Kees Cook
Nexus Security
