Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33739 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932661AbbD0OWp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Apr 2015 10:22:45 -0400
Message-ID: <553E4633.8080606@suse.cz>
Date: Mon, 27 Apr 2015 16:22:43 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] builddeb: parallelize debug module installation
References: <1429899940-32366-1-git-send-email-chris.j.arges@canonical.com> <1429899940-32366-3-git-send-email-chris.j.arges@canonical.com>
In-Reply-To: <1429899940-32366-3-git-send-email-chris.j.arges@canonical.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris J Arges <chris.j.arges@canonical.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2015-04-24 20:25, Chris J Arges wrote:
> When building the dbg package, we use a large 'for module in $(find' loop that
> can be easily parallelized by using 'find | xargs'. This patch modifies this
> loop to use the later paradigm.
> 
> Signed-off-by: Chris J Arges <chris.j.arges@canonical.com>
> ---
>  scripts/package/builddeb | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 88dbf23..d12d062 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -152,16 +152,17 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>  		rmdir "$tmpdir/lib/modules/$version"
>  	fi
>  	if [ -n "$BUILD_DEBUG" ] ; then
> -		for module in $(find $tmpdir/lib/modules/ -name *.ko -printf '%P\n'); do
> -			module=lib/modules/$module
> -			mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
> +		find $tmpdir/lib/modules/ -name *.ko -printf '%P\n' | xargs -I {} sh -c '

I guess you want to use the -P option here.

Michal
