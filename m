Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml105.kpnxchange.com ([195.121.3.9]:52591 "EHLO
	CPSMTPM-EML105.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933788AbZIDSzj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Sep 2009 14:55:39 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: [PATCH] builddeb: Fix packaged file permissions
Date: Fri, 4 Sep 2009 20:55:39 +0200
References: <1252015231.3475.9.camel@localhost>
In-Reply-To: <1252015231.3475.9.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200909042055.40187.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kernel@vger.kernel.org, maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org

Added linux-kbuild to CC.

On Friday 04 September 2009, Ben Hutchings wrote:
> The packaged files' permissions are implicitly dependent on the
> current umask.  Not only can this result in surprisingly restrictive
> permissions, but dpkg-deb will fail if the DEBIAN directory does not
> have permissions 755 or 775.  Therefore, set the umask to 022 before
> building a package.
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Acked-by: Frans Pop <elendil@planet.nl>

> ---
>  scripts/package/builddeb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 8b357b0..24cfd80 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -12,6 +12,8 @@
>
>  set -e
>
> +umask 022
> +
>  create_package() {
>  	local pname="$1" pdir="$2"
> 
