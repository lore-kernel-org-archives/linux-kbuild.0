Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx.ungleich.ch ([185.203.112.16]:34840 "EHLO smtp.ungleich.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731025AbfJVPVb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Oct 2019 11:21:31 -0400
References: <20191016093246.20000-1-unixbhaskar@gmail.com> <87h848vrej.fsf@ungleich.ch> <20191022144602.GB28989@debian>
From: Nico Schottelius <nico.schottelius@ungleich.ch>
Subject: Re: [PATCH] scripts: setlocalversion: replace backquote to dollar parenthesis
In-reply-to: <20191022144602.GB28989@debian>
Date: Tue, 22 Oct 2019 17:21:50 +0200
Message-ID: <875zkg4xgx.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, rdunlap@infradead.org


Acked-by confirmed from my side.

Best regards,

Nico

Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:

> On 13:52 Wed 16 Oct 2019, Nico Schottelius wrote:
>>
>>As $() is more robust than `` (no nesting possible),
>>I support this patch.
>>
> Hi Nico,
>
> Kindly provide the consent to use your support as Acked-by in the patch.
>
> Thanks,
> Bhaskar
>>
>>Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:
>>
>>> This patch replace backquote to dollar parenthesis syntax for better
>>> readability.
>>>
>>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>> ---
>>>  scripts/setlocalversion | 22 +++++++++++-----------
>>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/scripts/setlocalversion b/scripts/setlocalversion
>>> index 220dae0db3f1..b82a29bfc78a 100755
>>> --- a/scripts/setlocalversion
>>> +++ b/scripts/setlocalversion
>>> @@ -45,11 +45,11 @@ scm_version()
>>>
>>>  	# Check for git and a git repo.
>>>  	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
>>> -	   head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
>>> +		head=$(git rev-parse --verify --short HEAD 2>/dev/null); then
>>>
>>>  		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
>>>  		# it, because this version is defined in the top level Makefile.
>>> -		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
>>> +		if [ -z "$(git describe --exact-match 2>/dev/null)" ]; then
>>>
>>>  			# If only the short version is requested, don't bother
>>>  			# running further git commands
>>> @@ -59,7 +59,7 @@ scm_version()
>>>  			fi
>>>  			# If we are past a tagged commit (like
>>>  			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
>>> -			if atag="`git describe 2>/dev/null`"; then
>>> +			if atag="$(git describe 2>/dev/null)"; then
>>>  				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
>>>
>>>  			# If we don't have a tag at all we print -g{commitish}.
>>> @@ -70,7 +70,7 @@ scm_version()
>>>
>>>  		# Is this git on svn?
>>>  		if git config --get svn-remote.svn.url >/dev/null; then
>>> -			printf -- '-svn%s' "`git svn find-rev $head`"
>>> +			printf -- '-svn%s' "$(git svn find-rev $head)"
>>>  		fi
>>>
>>>  		# Check for uncommitted changes.
>>> @@ -91,15 +91,15 @@ scm_version()
>>>  	fi
>>>
>>>  	# Check for mercurial and a mercurial repo.
>>> -	if test -d .hg && hgid=`hg id 2>/dev/null`; then
>>> +	if test -d .hg && hgid=$(hg id 2>/dev/null); then
>>>  		# Do we have an tagged version?  If so, latesttagdistance == 1
>>> -		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
>>> -			id=`hg log -r . --template '{latesttag}'`
>>> +		if [ "$(hg log -r . --template '{latesttagdistance}')" == "1" ]; then
>>> +			id=$(hg log -r . --template '{latesttag}')
>>>  			printf '%s%s' -hg "$id"
>>>  		else
>>> -			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
>>> +			tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
>>>  			if [ -z "$tag" -o "$tag" = tip ]; then
>>> -				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
>>> +				id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
>>>  				printf '%s%s' -hg "$id"
>>>  			fi
>>>  		fi
>>> @@ -115,8 +115,8 @@ scm_version()
>>>  	fi
>>>
>>>  	# Check for svn and a svn repo.
>>> -	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
>>> -		rev=`echo $rev | awk '{print $NF}'`
>>> +	if rev=$(LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
>>> +		rev=$(echo $rev | awk '{print $NF}')
>>>  		printf -- '-svn%s' "$rev"
>>>
>>>  		# All done with svn
>>
>>
>>--
>>Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch


--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
