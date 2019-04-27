Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:6014 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfD0PIE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Apr 2019 11:08:04 -0400
Subject: Re: [PATCH] scripts: override locale from environment when running
 recordmcount.pl
References: <20190424175550.142553-1-ddadap@nvidia.com>
 <CAK7LNATXeak-PyUFQXq-DhUpC2zmKpCQovqwLFoY9JwkE5xxtQ@mail.gmail.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <497562b7-c07e-9067-5b7f-f96844bfc5bf@nvidia.com>
Date: Sat, 27 Apr 2019 10:08:02 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNATXeak-PyUFQXq-DhUpC2zmKpCQovqwLFoY9JwkE5xxtQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 4/27/19 1:55 AM, Masahiro Yamada wrote:
> On Thu, Apr 25, 2019 at 2:56 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>> recordmcount.pl uses a set of regular expressions to parse the output of
>> objdump(1). However, if objdump(1) output is localized, it may not match
>> the regular expressions, thereby preventing recordmcount.pl from parsing
>> object files correctly.
>>
>> In order to allow recordmcount.pl to function correctly regardless of the
>> current locale settings, set LANG=C when running objdump(1). LC_ALL is
>> already unset in the top-level Makefile, so it is not necessary to also
>> override that environment variable.
>>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> Reviewed-by: Robert Morell <rmorell@nvidia.com>
>> ---
>>   scripts/recordmcount.pl | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
>> index 68841d01162c..b7bcdc71e6e8 100755
>> --- a/scripts/recordmcount.pl
>> +++ b/scripts/recordmcount.pl
>> @@ -493,7 +493,7 @@ sub update_funcs
>>   #
>>   # Step 2: find the sections and mcount call sites
>>   #
>> -open(IN, "$objdump -hdr $inputfile|") || die "error running $objdump";
>> +open(IN, "env LANG=C $objdump -hdr $inputfile|") || die "error running $objdump";
>
> Just to be consistent with the other places,
> is 'env' necessary?
>
> arch/powerpc/boot/wrapper:LANG=C elfformat="`${CROSS}objdump -p
> "$kernel" | grep 'file format' | awk '{print $4}'`"
> scripts/tags.sh:    LANG=C sed -i -e
> '/^\([a-zA-Z_][a-zA-Z0-9_]*\)\t.*\t\/\^struct \1;.*\$\/;"\tx$/d' $1
> tools/testing/selftests/rcutorture/bin/config2frag.sh:LANG=C sed -e
> 's/^# CONFIG_\([a-zA-Z0-9_]*\) is not set$/CONFIG_\1=n/'


It's probably not strictly necessary; the 'env' is there in case of a 
shell that doesn't allow setting environment variables on the command 
line like that, but if Kbuild already presumes a shell that does allow 
it, I'm happy to send a v2 that omits the 'env'.


>
>>   my $text;
>>
>> --
>> 2.18.1
>>
>
