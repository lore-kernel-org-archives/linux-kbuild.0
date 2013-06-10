Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47601 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752570Ab3FJNH6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Jun 2013 09:07:58 -0400
Message-ID: <51B5CFAC.6050704@suse.cz>
Date: Mon, 10 Jun 2013 15:07:56 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Don't run find across mountpoints
References: <51B4A9D1.7070502@gmail.com>
In-Reply-To: <51B4A9D1.7070502@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gabriel de Perthuis <g2p.code@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 9.6.2013 18:14, Gabriel de Perthuis wrote:
> Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
> ---
>  scripts/package/builddeb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index acb8650..1435f5a 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -16,11 +16,11 @@ create_package() {
>  	local pname="$1" pdir="$2"
>  
>  	cp debian/copyright "$pdir/usr/share/doc/$pname/"
>  	cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
>  	gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
> -	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
> +	sh -c "cd '$pdir'; find . -xdev -type f ! -path './DEBIAN/*' -printf '%P\0' \

What kind of mountpoint zoo do you maintain in your build tree? :) We
run a find in make clean, make mrproper and other targets. So you might
need to fix more places. But please explain your use case.

Michal
