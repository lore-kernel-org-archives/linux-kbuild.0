Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224033090C4;
	Mon, 23 Mar 2026 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774251396; cv=none; b=jAL4M9djOXgiXkMwUdDdiX7zRuZ4M2wR1RFBOu5zBkUQnqPlZ/y8iFUM5qAMq+dnCJOM4O+aVYsvwBcvFXM0tqqq1Er0Scr5LzWXrmV5X6LiIUfpJX3BktlcywuOSUi3zSlfm4sqfI/XsOShf5m3toXsLKcXdWCsalRX1erORqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774251396; c=relaxed/simple;
	bh=7VOKv6z3oEU5a+l36BGZyEJAjG0QWyDh946cJOuuQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFVq89HsGsTGdn5XsL5JUQ+Gmw8iXVgzIGQYiUHGQsf8+shAo2akjRnktwO5wW2fZMoIQW4eFbdyfxae0VXyTmulfTQ4EoxYVjrLhvnzARFTAZeBdSUy37XxSeSJ6tQt3VZljMwXzzORq1J6vcxRRNci0lZRdzQAfDJKKaCkSMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UTJq59o9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UTJq59o9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B8DC2BCB0;
	Mon, 23 Mar 2026 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774251395;
	bh=7VOKv6z3oEU5a+l36BGZyEJAjG0QWyDh946cJOuuQi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTJq59o9fveiEr6Uv0yM/nTrbUVTiD8929ACrYlzPtuYCENBduvek9Kj9jLd1r/nD
	 HFzlDX4Sli+o+fbRAhXnohAuRKda8ia545XFm4bn10RmzR7KeqB6StQjhfX2HUPknF
	 dILUah3wOYM7tpQiDm7A8xJbInLeNWCzoFqX3OTc=
Date: Mon, 23 Mar 2026 08:36:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
	masahiroy@kernel.org, linux@weissschuh.net, tamird@kernel.org,
	rostedt@goodmis.org, ihor.solodrai@linux.dev, ritesh.list@gmail.com,
	maddy@linux.ibm.com, peterz@infradead.org
Subject: Re: [PATCH] char: nvram: Remove unused nvram_mutex to fix
 -Wunused-variable warning
Message-ID: <2026032350-stardust-unselfish-ad61@gregkh>
References: <20260323072422.25730-1-venkat88@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323072422.25730-1-venkat88@linux.ibm.com>

On Mon, Mar 23, 2026 at 12:54:22PM +0530, Venkat Rao Bagalkote wrote:
> drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
> used. This results in a compiler warning on linux-next builds:
> 
>   warning: 'nvram_mutex' defined but not used [-Wunused-variable]
> 
> Remove the unused definition to avoid the warning.
> 
> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
>  drivers/char/nvram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
> index 9eff426a9286..2ce3307663ed 100644
> --- a/drivers/char/nvram.c
> +++ b/drivers/char/nvram.c
> @@ -53,7 +53,7 @@
>  #include <asm/nvram.h>
>  #endif
>  
> -static DEFINE_MUTEX(nvram_mutex);
> +static __maybe_unused DEFINE_MUTEX(nvram_mutex);

If it is never used, why not actually delete it?  This just papers over
the real issue :(

thanks,

greg k-h
