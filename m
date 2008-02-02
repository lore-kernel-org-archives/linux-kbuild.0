Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hpsmtp-eml11.KPNXCHANGE.COM ([213.75.38.111]:15854 "EHLO
	hpsmtp-eml11.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757104AbYBBVks (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 16:40:48 -0500
Subject: Re: [REVIEW for merge] kbuild updates including silence of section mismatch check
In-reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Message-Id: <E1JLPrz-00059X-Sc@faramir.fjphome.nl>
From: Frans Pop <elendil@planet.nl>
Date: Sat, 02 Feb 2008 22:25:51 +0100
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Sam Ravnborg wrote:
> --- a/scripts/setlocalversion
> +++ b/scripts/setlocalversion
> @@ -45,3 +45,18 @@ if hgid=`hg id 2>/dev/null`; then
> # All done with mercurial
> exit
> fi
> +
> +# Check for svn and a svn repo.
> +if rev=`svn info 2>/dev/null | grep '^Revision' | awk '{print $NF}'` ; then
> +       changes=`svn status 2>/dev/null | grep '^[AMD]' | wc -l` 
> +
> +       # Are there uncommitted changes?
> +       if [ $changes != 0 ]; then
> +               printf -- '-svn%s%s%s' "$rev" -dirty "$changes"
> +       else
> +               printf -- '-svn%s' "$rev"
> +       fi
> +
> +       # All done with svn
> +       exit
> +fi

This looks broken. Unless I'm very much mistaken the 'if' statement is
always going to be true because the awk statement will always execute
without error. Try: echo "" | awk '{print $NF}' || echo Error

So, the code should probably be changed to:
+if rev=`svn info 2>/dev/null | grep '^Revision' ; then
+	rev=`echo $rev | awk '{print $NF}'`
+       changes=`svn status 2>/dev/null | grep '^[AMD]' | wc -l` 

or alternatively:
+if rev=`svn info 2>/dev/null | grep '^Revision' | awk '{print $NF}'` && \
+   [ -n "$rev" ] ; then 
+       changes=`svn status 2>/dev/null | grep '^[AMD]' | wc -l` 

Cheers,
FJP

P.S. Looks like the mercurial section is missing some indentation.
