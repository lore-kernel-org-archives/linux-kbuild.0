Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:49196 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755332Ab1EWCQS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 May 2011 22:16:18 -0400
Message-ID: <f3b1b41cec770d7cca99849e22fa9946.squirrel@xenotime.net>
In-Reply-To: <1305966108-13399-2-git-send-email-jim.cromie@gmail.com>
References: <1305966108-13399-1-git-send-email-jim.cromie@gmail.com>
    <1305966108-13399-2-git-send-email-jim.cromie@gmail.com>
Date: Sun, 22 May 2011 19:16:17 -0700
Subject: Re: [PATCH 1/3] do collectcfiles work in perl itself, eschew shell
 pipeline
From: "Randy Dunlap" <rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Sat, May 21, 2011 1:21 am, Jim Cromie wrote:

>  sub collectcfiles {
> -    my @file
> -	= `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko$/.mod.c/`;
> +    my @file;
> +    while (<.tmp_versions/*.mod>) {
> +	open my $fh, '<', $_ or die "cant open $_: $!\n";

Use either "can't" or "cannot".  "cant" is a different word.

> +	push (@file,
> +	      grep s/\.ko/.mod.c/,	# change the suffix
> +	      grep m/.+\.ko/,		# find the .ko path
> +	      <$fh>);			# lines in opened file
> +    }
>      chomp @file;
>      return @file;
>  }


-- 
~Randy

