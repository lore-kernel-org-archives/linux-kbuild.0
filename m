Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58307 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754901Ab1DZUfp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 16:35:45 -0400
Message-ID: <4DB72C9F.50401@suse.cz>
Date: Tue, 26 Apr 2011 22:35:43 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: don't warn about linux/version.h not including
 itself
References: <4DB4B1F9.5040805@verizon.net>
In-Reply-To: <4DB4B1F9.5040805@verizon.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pefoley2@verizon.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 25.4.2011 01:27, Peter Foley wrote:
> This patch makes checkversion.pl not warn that include/linux/version.h
> dosen't include itself.
> 
> Signed-off-by: Peter Foley <pefoley2@verizon.net>
> ---
>  scripts/checkversion.pl |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/checkversion.pl b/scripts/checkversion.pl
> index b444e89..b9150c7 100755
> --- a/scripts/checkversion.pl
> +++ b/scripts/checkversion.pl
> @@ -47,7 +47,7 @@ foreach my $file (@ARGV) {
>      }
>  
>      # Report used version IDs without include?
> -    if ($fUseVersion && ! $iLinuxVersion) {
> +    if ($fUseVersion && ! $iLinuxVersion && $file !~ "include/linux/version.h") {

A more obvious fix would be to check the filename right at the beginning
of the loop and skip to the next iteration if it is version.h. Also, you
should escape the '.' in the regexp.

Michal
