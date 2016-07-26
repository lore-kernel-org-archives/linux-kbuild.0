Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50500 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753502AbcGZVNp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2016 17:13:45 -0400
Subject: Re: [PATCH] Fix the Debian packaging script on systems with no
 codename
References: <ce356ed3-4bee-6855-6906-a8bee29e7fde@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5797D27E.9030903@suse.com>
Date: Tue, 26 Jul 2016 23:13:34 +0200
MIME-Version: 1.0
In-Reply-To: <ce356ed3-4bee-6855-6906-a8bee29e7fde@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marcin Mielniczuk <marmistrz.dev@gmail.com>
Cc: linux-kbuild@vger.kernel.org

Dne 12.7.2016 v 21:42 Marcin Mielniczuk napsal(a):
> When calling `make deb-pkg` on a system with no codename (for example
> Arch Linux), lsb_release sometimes outputs `n/a` as the codename.
> 
> This breaks dpkg-parsechangelog, which can't process the changelog
> correctly.
> 
> Signed-off-by: Marcin Mielniczuk <marmistrz.dev@gmail.com>
> 
> ---
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 86e56fe..87753f5 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -238,7 +238,8 @@ maintainer="$name <$email>"
>  # Try to determine distribution
>  if [ -n "$KDEB_CHANGELOG_DIST" ]; then
>          distribution=$KDEB_CHANGELOG_DIST
> -elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n
> "$distribution" ]; then
> +# In some cases lsb_release returns the codename as n/a, which breaks
> dpkg-parsechangelog
> +elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n
> "$distribution" ] && [ "$distribution" != "n/a" ]; then
>          : # nothing to do in this case
>  else
>          distribution="unstable"

Applied, but please fix your mailer to send properly formatted patches.
The easiest test is to send a patch to yourself, save it and try to
apply it with 'git am'.

Michal

