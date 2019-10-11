Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:60240 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfJKWiQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 18:38:16 -0400
Subject: Re: [PATCH] fix shell syntax
References: <linux-kbuild@vger.kernel.org , yamada.masahiro@socionext.com ,
 michal.lkml@markovi.net> <20191011070539.25908-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e9a4a63c-954d-6437-0a79-323e88ef637c@infradead.org>
Date: Fri, 11 Oct 2019 15:38:13 -0700
MIME-Version: 1.0
In-Reply-To: <20191011070539.25908-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

Hi Bhaskar,

1- the Subject line is incomplete, missing some info: e.g.
    [PATCH] scripts: setlocalversion: fix shell syntax



On 10/11/19 12:05 AM, Bhaskar Chowdhury wrote:

2- at this place, there should be a description of how the patch
"fixes" the shell syntax.  and why.

> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/setlocalversion | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/setlocalversion b/scripts/setlocalversion
> index 220dae0db3f1..b82a29bfc78a 100755
> --- a/scripts/setlocalversion
> +++ b/scripts/setlocalversion
> @@ -45,11 +45,11 @@ scm_version()
>  
>  	# Check for git and a git repo.
>  	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
> -	   head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
> +		head=$(git rev-parse --verify --short HEAD 2>/dev/null); then

3- That indentation change is not good IMO.

4- The patch does seem to work, in my limited testing.

5- Near the beginning of the script, it seems to say that the author
would like to be Cc:ed on patches.

>  
>  		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
>  		# it, because this version is defined in the top level Makefile.
> -		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
> +		if [ -z "$(git describe --exact-match 2>/dev/null)" ]; then
>  
>  			# If only the short version is requested, don't bother
>  			# running further git commands
> @@ -59,7 +59,7 @@ scm_version()
>  			fi
>  			# If we are past a tagged commit (like
>  			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
> -			if atag="`git describe 2>/dev/null`"; then
> +			if atag="$(git describe 2>/dev/null)"; then
>  				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
>  
>  			# If we don't have a tag at all we print -g{commitish}.
> @@ -70,7 +70,7 @@ scm_version()
>  
>  		# Is this git on svn?
>  		if git config --get svn-remote.svn.url >/dev/null; then
> -			printf -- '-svn%s' "`git svn find-rev $head`"
> +			printf -- '-svn%s' "$(git svn find-rev $head)"
>  		fi
>  
>  		# Check for uncommitted changes.
> @@ -91,15 +91,15 @@ scm_version()
>  	fi
>  
>  	# Check for mercurial and a mercurial repo.
> -	if test -d .hg && hgid=`hg id 2>/dev/null`; then
> +	if test -d .hg && hgid=$(hg id 2>/dev/null); then
>  		# Do we have an tagged version?  If so, latesttagdistance == 1
> -		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
> -			id=`hg log -r . --template '{latesttag}'`
> +		if [ "$(hg log -r . --template '{latesttagdistance}')" == "1" ]; then
> +			id=$(hg log -r . --template '{latesttag}')
>  			printf '%s%s' -hg "$id"
>  		else
> -			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
> +			tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
>  			if [ -z "$tag" -o "$tag" = tip ]; then
> -				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
> +				id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
>  				printf '%s%s' -hg "$id"
>  			fi
>  		fi
> @@ -115,8 +115,8 @@ scm_version()
>  	fi
>  
>  	# Check for svn and a svn repo.
> -	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
> -		rev=`echo $rev | awk '{print $NF}'`
> +	if rev=$(LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
> +		rev=$(echo $rev | awk '{print $NF}')
>  		printf -- '-svn%s' "$rev"
>  
>  		# All done with svn
> 

Thanks.
-- 
~Randy
