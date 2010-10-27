Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:59847 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754016Ab0J0WXl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Oct 2010 18:23:41 -0400
Message-ID: <4CC8A670.3070800@suse.cz>
Date: Thu, 28 Oct 2010 00:23:44 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: scripts/extract-ikconfig: add support for bzip2, lzma and lzo
References: <20101022220244.GA28887@streefland.net> <20101022151654.cafb7655.rdunlap@xenotime.net>
In-Reply-To: <20101022151654.cafb7655.rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Dick Streefland <dick@streefland.net>, linux-kbuild@vger.kernel.org

On 23.10.2010 00:16, Randy Dunlap wrote:
> On Sat, 23 Oct 2010 00:02:44 +0200 Dick Streefland wrote:
> 
>> Add support for kernels compressed with bzip2, lzma or lzo to the
>> extract-ikconfig script.
> 
> Fixes kernel bugzilla #19852:
> https://bugzilla.kernel.org/show_bug.cgi?id=19852

Applied to kbuild-2.6.git#misc, thanks.

Michal
> 
> 
>> Signed-off-by: Dick Streefland <dick@streefland.net>
>> Tested-by: Justin <jlec@gentoo.org>
>> ---
>>
>>  scripts/extract-ikconfig |   41 +++++++++++++++++++++++++++--------------
>>  1 files changed, 27 insertions(+), 14 deletions(-)
>>
>> diff --git a/scripts/extract-ikconfig b/scripts/extract-ikconfig
>> index 37f30d3..1512c0a 100755
>> --- a/scripts/extract-ikconfig
>> +++ b/scripts/extract-ikconfig
>> @@ -7,12 +7,10 @@
>>  # The obscure use of the "tr" filter is to work around older versions of
>>  # "grep" that report the byte offset of the line instead of the pattern.
>>  #
>> -# (c) 2009, Dick Streefland <dick@streefland.net>
>> +# (c) 2009,2010 Dick Streefland <dick@streefland.net>
>>  # Licensed under the terms of the GNU General Public License.
>>  # ----------------------------------------------------------------------
>>  
>> -gz1='\037\213\010'
>> -gz2='01'
>>  cf1='IKCFG_ST\037\213\010'
>>  cf2='0123456789'
>>  
>> @@ -21,11 +19,25 @@ dump_config()
>>  	if	pos=`tr "$cf1\n$cf2" "\n$cf2=" < "$1" | grep -abo "^$cf2"`
>>  	then
>>  		pos=${pos%%:*}
>> -		tail -c+$(($pos+8)) "$1" | zcat -q
>> -		exit 0
>> +		tail -c+$(($pos+8)) "$1" | zcat > $tmp1 2> /dev/null
>> +		if	[ $? != 1 ]
>> +		then	# exit status must be 0 or 2 (trailing garbage warning)
>> +			cat $tmp1
>> +			exit 0
>> +		fi
>>  	fi
>>  }
>>  
>> +try_decompress()
>> +{
>> +	for	pos in `tr "$1\n$2" "\n$2=" < "$img" | grep -abo "^$2"`
>> +	do
>> +		pos=${pos%%:*}
>> +		tail -c+$pos "$img" | $3 > $tmp2 2> /dev/null
>> +		dump_config $tmp2
>> +	done
>> +}
>> +
>>  # Check invocation:
>>  me=${0##*/}
>>  img=$1
>> @@ -35,18 +47,19 @@ then
>>  	exit 2
>>  fi
>>  
>> +# Prepare temp files:
>> +tmp1=/tmp/ikconfig$$.1
>> +tmp2=/tmp/ikconfig$$.2
>> +trap "rm -f $tmp1 $tmp2" 0
>> +
>>  # Initial attempt for uncompressed images or objects:
>>  dump_config "$img"
>>  
>> -# That didn't work, so decompress and try again:
>> -tmp=/tmp/ikconfig$$
>> -trap "rm -f $tmp" 0
>> -for	pos in `tr "$gz1\n$gz2" "\n$gz2=" < "$img" | grep -abo "^$gz2"`
>> -do
>> -	pos=${pos%%:*}
>> -	tail -c+$pos "$img" | zcat 2> /dev/null > $tmp
>> -	dump_config $tmp
>> -done
>> +# That didn't work, so retry after decompression.
>> +try_decompress '\037\213\010' xy  gunzip
>> +try_decompress 'BZh'          xy  bunzip2
>> +try_decompress '\135\0\0\0'   xxx unlzma
>> +try_decompress '\211\114\132' xy  'lzop -d'
>>  
>>  # Bail out:
>>  echo "$me: Cannot find kernel config." >&2
>> --
> 
> 
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

