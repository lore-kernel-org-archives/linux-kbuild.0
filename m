Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:34956 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752359Ab0KWWim convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Nov 2010 17:38:42 -0500
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Tue, 23 Nov 2010 14:38:41 -0800
Date: Tue, 23 Nov 2010 14:38:41 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH v2] headers_install: check exit status of unifdef
Message-Id: <20101123143841.0b35e728.rdunlap@xenotime.net>
In-Reply-To: <1290552096-28568-1-git-send-email-vapier@gentoo.org>
References: <1290551142-18849-1-git-send-email-vapier@gentoo.org>
	<1290552096-28568-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Tue, 23 Nov 2010 17:41:36 -0500 Mike Frysinger wrote:

> If unifdef fails for any reason (like segfaulting), we should be aborting
> the install steps.  So check its exit status in this unlikely scenario.
> 
> Reported-by: Diego Elio Pettenò <flameeyes@gentoo.org>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2
> 	- apparently exit status of 1 is normal for unifdef, so need to
> 	  handle that too
> 
>  scripts/headers_install.pl |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/headers_install.pl b/scripts/headers_install.pl
> index 4ca3be3..59ad768 100644
> --- a/scripts/headers_install.pl
> +++ b/scripts/headers_install.pl
> @@ -45,6 +45,13 @@ foreach my $file (@files) {
>  	close $in;
>  
>  	system $unifdef . " $tmpfile > $installdir/$file";
> +	# unifdef will exit 0 on success, and will exit 1 when the
> +	# file was processed successfully but no changes were made,
> +	# so abort only when it's higher than that.
> +	my $e = $? >> 8;
> +	if ($e > 2) {

	if ($e > 1) {

??

> +		die "$tmpfile: $!\n";
> +	}
>  	unlink $tmpfile;
>  }
>  exit 0;
> -- 


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
