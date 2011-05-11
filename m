Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:53746 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754671Ab1EKQhW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 May 2011 12:37:22 -0400
Date: Wed, 11 May 2011 11:27:49 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] fix unterminated sed cmd in export_report.pl
In-Reply-To: <1305064543-7401-1-git-send-email-jim.cromie@gmail.com>
Message-ID: <alpine.LNX.2.00.1105111126580.28291@pobox.suse.cz>
References: <1305064543-7401-1-git-send-email-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Tue, 10 May 2011, jim.cromie@gmail.com wrote:

> From: Jim Cromie <jim.cromie@gmail.com>
> 
> fix following err by escaping end-of-line $ in regex.
> perl /home/jimc/projects/lx/linux-2.6/scripts/export_report.pl > /dev/null
> sed: -e expression #1, char 5: unterminated `s' command
> sh: .mod.c/: not found
> 
> without this fix, SECTION 2 of report is empty.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  scripts/export_report.pl |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/export_report.pl b/scripts/export_report.pl
> index 04dce7c..91fa5a2 100644
> --- a/scripts/export_report.pl
> +++ b/scripts/export_report.pl
> @@ -50,7 +50,7 @@ sub usage {
>  
>  sub collectcfiles {
>      my @file
> -	= `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko$/.mod.c/`;
> +	= `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko\$/.mod.c/`;
>      chomp @file;
>      return @file;
>  }

Thanks for the fix, Jim.

Adding Michal and linux-kbuild@, this should rather go in through his 
tree.

-- 
Jiri Kosina
SUSE Labs
