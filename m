Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57594 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753094AbbJNOLX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2015 10:11:23 -0400
Subject: Re: [PATCH 1/2] kconfig/merge_config.sh: Support KCONFIG_CONFIG
References: <55F06D73.70303@gmail.com> <561E34CB.9050903@suse.cz>
 <561E5DA2.6020405@gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <561E6288.6000808@suse.cz>
Date: Wed, 14 Oct 2015 16:11:20 +0200
MIME-Version: 1.0
In-Reply-To: <561E5DA2.6020405@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gabriel de Perthuis <g2p.code@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 2015-10-14 15:50, Gabriel de Perthuis wrote:
> Le 14/10/2015 à 12:56, Michal Marek a écrit :
>> On 2015-09-09 19:33, Gabriel de Perthuis wrote:
>>> All make targets support $KCONFIG_CONFIG because they
>>> run scripts/kconf.  Make sure merge_config.sh accesses the
>>> correct file in all cases.
>>>
>>> Previously this script broke in two different code paths,
>>> one for targets like kvmconfig (which use merge_config.sh -m
>>> then call a target that respects KCONFIG_CONFIG) and one for
>>> direct use of the script without -m, which called make rules
>>> that edit KCONFIG_CONFIG but verified a different file.
>>>
>>> Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
>>> Cc: Michal Marek <mmarek@suse.cz>
>>> ---
>>>    scripts/kconfig/merge_config.sh | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/scripts/kconfig/merge_config.sh
>>> b/scripts/kconfig/merge_config.sh
>>> index 0d883b3..5f1e110 100755
>>> --- a/scripts/kconfig/merge_config.sh
>>> +++ b/scripts/kconfig/merge_config.sh
>>> @@ -122,13 +122,13 @@ for MERGE_FILE in $MERGE_LIST ; do
>>>    	done
>>>    	cat $MERGE_FILE >> $TMP_FILE
>>>    done
>>>     if [ "$RUNMAKE" = "false" ]; then
>>> -	cp $TMP_FILE $OUTPUT/.config
>>> +	cp $TMP_FILE ${KCONFIG_CONFIG:=$OUTPUT/.config}
>>>    	echo "#"
>>> -	echo "# merged configuration written to $OUTPUT/.config (needs make)"
>>> +	echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
>>
>> The message will not contain the name of the output file when invoked
>> directly and without the variable set.
> 
> Don't miss the ${:=} assignments.

Ah, you are right. I confused them with ":-".


>  > Also, it will be more readable if you set the default value once and 
> then use simply $KCONFIG_CONFIG.
> 
> I'll resubmit something more explicit, pick whichever you prefer.

Please do so. While the patch is correct, patching the first usage of
the variable in various code flows is not easy to follow.

Michal
