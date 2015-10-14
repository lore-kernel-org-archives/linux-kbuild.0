Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:38037 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753661AbbJNNug (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2015 09:50:36 -0400
Subject: Re: [PATCH 1/2] kconfig/merge_config.sh: Support KCONFIG_CONFIG
References: <55F06D73.70303@gmail.com> <561E34CB.9050903@suse.cz>
From: Gabriel de Perthuis <g2p.code@gmail.com>
Message-ID: <561E5DA2.6020405@gmail.com>
Date: Wed, 14 Oct 2015 15:50:26 +0200
MIME-Version: 1.0
In-Reply-To: <561E34CB.9050903@suse.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Le 14/10/2015 à 12:56, Michal Marek a écrit :
> On 2015-09-09 19:33, Gabriel de Perthuis wrote:
>> All make targets support $KCONFIG_CONFIG because they
>> run scripts/kconf.  Make sure merge_config.sh accesses the
>> correct file in all cases.
>>
>> Previously this script broke in two different code paths,
>> one for targets like kvmconfig (which use merge_config.sh -m
>> then call a target that respects KCONFIG_CONFIG) and one for
>> direct use of the script without -m, which called make rules
>> that edit KCONFIG_CONFIG but verified a different file.
>>
>> Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
>> Cc: Michal Marek <mmarek@suse.cz>
>> ---
>>    scripts/kconfig/merge_config.sh | 6 +++---
>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/kconfig/merge_config.sh
>> b/scripts/kconfig/merge_config.sh
>> index 0d883b3..5f1e110 100755
>> --- a/scripts/kconfig/merge_config.sh
>> +++ b/scripts/kconfig/merge_config.sh
>> @@ -122,13 +122,13 @@ for MERGE_FILE in $MERGE_LIST ; do
>>    	done
>>    	cat $MERGE_FILE >> $TMP_FILE
>>    done
>>     if [ "$RUNMAKE" = "false" ]; then
>> -	cp $TMP_FILE $OUTPUT/.config
>> +	cp $TMP_FILE ${KCONFIG_CONFIG:=$OUTPUT/.config}
>>    	echo "#"
>> -	echo "# merged configuration written to $OUTPUT/.config (needs make)"
>> +	echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
>
> The message will not contain the name of the output file when invoked
> directly and without the variable set.

Don't miss the ${:=} assignments.

 > Also, it will be more readable if you set the default value once and 
then use simply $KCONFIG_CONFIG.

I'll resubmit something more explicit, pick whichever you prefer.


