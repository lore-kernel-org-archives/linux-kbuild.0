Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:58941 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752442AbbGXNvI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Jul 2015 09:51:08 -0400
Message-ID: <55B2406D.4010007@ti.com>
Date: Fri, 24 Jul 2015 08:41:01 -0500
From: Dan Murphy <dmurphy@ti.com>
MIME-Version: 1.0
Subject: Re: [PATCH] merge_config.sh: Add the ability to perform make with
 an ARCH
References: <1437684681-29452-1-git-send-email-dmurphy@ti.com> <CAK7LNARQQ+DHsCF74=18Vv=ThrcLmRxTzpPt2idYnzWQJPXGCg@mail.gmail.com>
In-Reply-To: <CAK7LNARQQ+DHsCF74=18Vv=ThrcLmRxTzpPt2idYnzWQJPXGCg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: yann.morin.1998@free.fr, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Yamada

On 07/24/2015 01:23 AM, Masahiro Yamada wrote:
> Hi Dan,
>
>
> 2015-07-24 5:51 GMT+09:00 Dan Murphy <dmurphy@ti.com>:
>> The script does not allow building for different architectures.
>> It may assume that the developer has set the ARCH as a global
>> variable.
>>
>> Add a switch argument to pass in the desired architecture.
>> Then verify that that architecture is supported in the arch
>> directory.
>>
>> If not exit if it is supported then set it.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  scripts/kconfig/merge_config.sh | 29 +++++++++++++++++++++++++++--
>>  1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
>> index ec8e203..bdbff4b 100755
>> --- a/scripts/kconfig/merge_config.sh
>> +++ b/scripts/kconfig/merge_config.sh
>> @@ -19,7 +19,16 @@
>>  #  but WITHOUT ANY WARRANTY; without even the implied warranty of
>>  #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>>  #  See the GNU General Public License for more details.
>> -
>> +verify_arch() {
>> +       cd arch
>> +       for d in * ; do
>> +               if [ "$d" = "$_TEST_ARCH" ]; then
>> +                       BUILD_ARCH="ARCH="$d
>> +                       break
>> +               fi
>> +       done
>> +       cd ..
>> +}
>>  clean_up() {
>>         rm -f $TMP_FILE
>>         exit
>> @@ -33,6 +42,7 @@ usage() {
>>         echo "  -n    use allnoconfig instead of alldefconfig"
>>         echo "  -r    list redundant entries when merging fragments"
>>         echo "  -O    dir to put generated output files"
>> +       echo "  -A    architecture to support for make"
>>  }
>>
>>  RUNMAKE=true
>> @@ -71,6 +81,21 @@ while true; do
>>                 shift 2
>>                 continue
>>                 ;;
>> +       "-A")
>> +               if [ "$2" != "" ]; then
>> +                       _TEST_ARCH=$2
>> +                       verify_arch
>> +                       if [ "$BUILD_ARCH" = "" ]; then
>> +                               echo "ARCH $_TEST_ARCH is not valid" 1>&2
>> +                               exit 1
>> +                       fi
>> +               else
>> +                       echo "ARCH $_TEST_ARCH is not valid" 1>&2
>> +                       exit 1
>> +               fi
>> +               shift 2
>> +               continue
>> +               ;;
>>         *)
>>                 break
>>                 ;;
>> @@ -139,7 +164,7 @@ fi
>>  # Use the merged file as the starting point for:
>>  # alldefconfig: Fills in any missing symbols with Kconfig default
>>  # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
>> -make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>> +make $BUILD_ARCH KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>>
>
> Let me clarify what you want to achieve by this patch.
>
>
> You want to invoke merge_config.sh directly and to do
>
> scripts/kconfig/merge_config.sh -A <target_arch>  ...
>
> as a shorthand for
>
> ARCH=<target_arch> scripts/kconfig/merge_config.sh  ...
>
>
> Correct?
>

Yes that is correct.  Just another way of achieving the same result.

>
>
>
>


-- 
------------------
Dan Murphy

