Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB4231842;
	Fri, 13 Feb 2026 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771009902; cv=none; b=kLfqLRd5Los7HS0hsDrAwq5n3uetMCJI6Ty15abvF8g0JeGgXSSbXc6zge/Y8tJvP3g59rl1P9aI8WMSc5GCpxvh2AmJCEXhX2XELLSJpBaB0vDDWhoq8BuBTyL4sMx9Ea8MyTHtZExj1j9hLyZDN8cszdkjlAYKLo79f9FmDts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771009902; c=relaxed/simple;
	bh=9SMLiT7HoHvCHltW4E/NJ04cBfRe4ov84EYhF3SDQhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/gQk95uDyxiFIxomnLD6bCQP1yP5CFkHlwSycJaYECYHG0d59fgmtIDsSSStmJStIe9pjrT52QwQlcv1aV6bxTE5XptE12uSA0XC1iF6j+ttZ8wUI003yE4Vf8Bk3PFxR0dHXvRY2s6iUJ1wqmYLq67NEO+Pqzkiojt+XU2Cec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYH7T0xg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYH7T0xg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F352AC116C6;
	Fri, 13 Feb 2026 19:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771009902;
	bh=9SMLiT7HoHvCHltW4E/NJ04cBfRe4ov84EYhF3SDQhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYH7T0xgcD88LrDFagC/5KVi8IBtbLZCMPMu8zJr3spwpnL3nHLD1/Zjq+xgS4nfv
	 yUu4TZLQ1UUIGBOV2bBU5oSPR973oQXvtTZoq2IppGfKM8NqeLGJu/JCWYNShKzwGz
	 xF4jJ25Uy6sY2jSo7+NPR0ls6YUxn5Jr8CdK2dIaQgbGZz/4GKbCA1KRkSTJCz2q3E
	 zisPE+WKD6JedtDEvWbFT1poD3q41vKotUg4F3yTAfDhDniTigymqARg88dMBqqYVx
	 9PrIFWHNEum/SnFHT6nnCQP8ti7+LAgYoJBxQvBGLniTNB/GDMBNFZZ2LfENpNwnqV
	 YDFLcgwNAcsJg==
Date: Fri, 13 Feb 2026 14:11:38 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Steve French <smfrench@gmail.com>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
Message-ID: <20260213191138.GA2131983@ax162>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
 <aY8wyR572eZYWVJY@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY8wyR572eZYWVJY@sgarzare-redhat>

Hi Stefano,

On Fri, Feb 13, 2026 at 03:11:38PM +0100, Stefano Garzarella wrote:
> On Tue, Feb 10, 2026 at 12:04:47AM -0700, Nathan Chancellor wrote:
> > Steve reported a build issue with commit 62089b804895 ("kbuild: rpm-pkg:
> > Generate debuginfo package manually") on RHEL9, which has an older
> > version of RPM than what I tested. Turns out that RPM 4.20.0 fixed an
> > issue with specifying %files for a -debuginfo subpackage.
> > 
> > The first patch restricts the new -debuginfo package generation process
> > to CONFIG_MODULE_SIG=y and RPM >= 4.20.0 to ensure it is actually
> > necessary and working. The second patch restores the original -debuginfo
> > package generation process from commit a7c699d090a1 ("kbuild: rpm-pkg:
> > build a debuginfo RPM") when CONFIG_MODULE_SIG is disabled to keep the
> > -debuginfo package around for older versions of RPM.
> 
> Yeah, I had similar issue on Fedora 42 (RPM version 4.20.1) and this series
> fixed my issue.

Thanks for testing! I find that a little odd though since I tested
62089b804895 in Fedora 42 during my investigation of the problem and it
worked fine without these changes. Nevertheless, I will add your tags to
this series when I apply it.

Cheers,
Nathan
