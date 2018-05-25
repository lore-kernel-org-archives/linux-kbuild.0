Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:6227 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932570AbeEYDuc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 May 2018 23:50:32 -0400
Subject: Re: Wrong -dirty suffix set by setlocalversion (was: BUG in git
 diff-index)
References: <89d82c84-7a3b-9c4c-679e-a7a723669592@intel.com>
 <20180524230334.12452-1-michael.w.mason@intel.com>
From: Marc Herbert <Marc.Herbert@intel.com>
Message-ID: <0dc31052-4cfd-3b92-0a4a-96c8ecfafff6@intel.com>
Date: Thu, 24 May 2018 20:50:28 -0700
MIME-Version: 1.0
In-Reply-To: <20180524230334.12452-1-michael.w.mason@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Mason <michael.w.mason@intel.com>
Cc: andy.work@nglowry.com, git@vger.kernel.org, gitster@pobox.com, josh@joshtriplett.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lists@nerdbynature.de, peff@peff.net, nico-linuxsetlocalversion@schottelius.org

On 24/05/2018 16:03, Mike Mason wrote:

> diff --git a/scripts/setlocalversion b/scripts/setlocalversion
> index 71f39410691b..9da4c5e83285 100755
> --- a/scripts/setlocalversion
> +++ b/scripts/setlocalversion
> @@ -73,8 +73,10 @@ scm_version()
>  			printf -- '-svn%s' "`git svn find-rev $head`"
>  		fi
>  
> -		# Check for uncommitted changes
> -		if git diff-index --name-only HEAD | grep -qv "^scripts/package"; then
> +		# Check for uncommitted changes. Only check mtime and size.
> +       # Ignore insequential ctime, uid, gid and inode differences.
> +		if git -c "core.checkstat=minimal" diff-index --name-only HEAD | \
> +				grep -qv "^scripts/package"; then
>  			printf '%s' -dirty
>  		fi

FWIW:

Reported-by: Marc.Herbert@intel.com
Reviewed-by: Marc.Herbert@intel.com  (assuming a future and decent commit message)
Tested-by: Marc.Herbert@intel.com


So the real use case is making a copy of a whole tree before building.
Typical in automated builds, old example:
https://groups.google.com/a/chromium.org/d/msg/chromium-os-dev/zxOa0OLWFkw/N_Sb7EZOBwAJ 

Here's a more complex but faster and more transparent way to test Mike's fix
than copying an entire tree:

# Make sure you start from a clean state
git describe --dirty      # must not -dirty

make prepare

# Simulate a copy of the tree but with just one file
rsync --perms --times  README   README.mtime_backup
rm  README
rsync --perms --times  README.mtime_backup   README
stat  README  README.mtime_backup 

# Demo the BUG fixed by Mike
./scripts/setlocalversion # -dirty BUG! because spurious inode ctime difference
git diff-index  HEAD
git describe --dirty      # not -dirty
./scripts/setlocalversion # not -dirty any more cause describe refreshed index

# Make sure mtime still causes -dirty with AND without Mike's fix
touch README
./scripts/setlocalversion # -dirty
