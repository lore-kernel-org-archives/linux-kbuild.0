Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0118.hostedemail.com ([216.40.44.118]:50772 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1758826AbcDHSgh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Apr 2016 14:36:37 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave07.hostedemail.com (Postfix) with ESMTP id EEF0F11B26B
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Apr 2016 18:29:44 +0000 (UTC)
Date: Fri, 8 Apr 2016 14:29:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/2] localmodconfig: Fix parsing of Kconfig "source"
 statements
Message-ID: <20160408142940.6de077d5@gandalf.local.home>
In-Reply-To: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
References: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.com>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat,  2 Apr 2016 10:55:21 -0700
Benjamin Poirier <bpoirier@suse.com> wrote:

> The parameter of Kconfig "source" statements does not need to be quoted.
> The current regex causes many kconfig files to be skipped and hence,
> dependencies to be missed.
> 
> Also fix the whitespace repeat count.
> 
> Signed-off-by: Benjamin Poirier <bpoirier@suse.com>

Thanks for sending this. I'll apply it. Should this be marked for
stable? And if so, how far back?

-- Steve

> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index f3d3fb4..7036ae3 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -188,7 +188,7 @@ sub read_kconfig {
>  	$cont = 0;
>  
>  	# collect any Kconfig sources
> -	if (/^source\s*"(.*)"/) {
> +	if (/^source\s+"?([^"]+)/) {
>  	    my $kconfig = $1;
>  	    # prevent reading twice.
>  	    if (!defined($read_kconfigs{$kconfig})) {

