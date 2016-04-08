Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:42763 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758260AbcDHO7O (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:0:0>);
	Fri, 8 Apr 2016 10:59:14 -0400
Date: Fri, 8 Apr 2016 22:59:02 +0800
From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 1/2] localmodconfig: Fix parsing of Kconfig "source"
 statements
Message-ID: <20160408145902.GH29941@linux-rxt1.site>
References: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Michal Marek <mmarek@suse.cz>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 02, 2016 at 10:55:21AM -0700, Benjamin Poirier wrote:
> The parameter of Kconfig "source" statements does not need to be quoted.
> The current regex causes many kconfig files to be skipped and hence,
> dependencies to be missed.
> 
> Also fix the whitespace repeat count.
> 
> Signed-off-by: Benjamin Poirier <bpoirier@suse.com>

Tested-by: Lee, Chun-Yi <jlee@suse.com>

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
> -- 
> 2.7.2

Regards
Joey Lee
