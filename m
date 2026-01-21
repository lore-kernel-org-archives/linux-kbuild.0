Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74403366DAA;
	Wed, 21 Jan 2026 23:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769037673; cv=none; b=g30OL2nrVYpC1KevPmm4A+VGg6djH7XOZEJUSwKWWrSKnxeandKY150MyED0TikXJO9s6JTU+v1jCNx1c8ktnGl/y3rAvkqvA7mQDIEb4yCDM1q0PjMgpK89Easkszy31Fwd7IAabwM9zpVvqPJ9d0+T+q/API3BORB+iBE+4vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769037673; c=relaxed/simple;
	bh=WRQfoM0OHprrtWfvWhC1R/WizN8VIwtJM8hfcgPe+OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWrZqmNfDzHo2+LKNkKOie5xt9J/550FJ4Z6qRBohOAkAgAr1X/HCoZgeQ7b4Y/EJQWlkPz52kCuCDMB1W6RKbJjjme/eWOYcn8U0C9BlVsshBYbGo2KOYqpHFhFsX/QJpoBKk3pgXLmtGd5629qXR+HBEiZ3yZ1fz97a8kpKY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCmBB+Yl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCmBB+Yl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E34C4CEF1;
	Wed, 21 Jan 2026 23:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769037673;
	bh=WRQfoM0OHprrtWfvWhC1R/WizN8VIwtJM8hfcgPe+OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCmBB+YlKxh/CPy0cJmBQ0CA/r5nVeUpJN5mIN9V5m4w2R7q2PZ449iYGM6HfyrhA
	 A3Y7q86CM0JkYk/li0VULVSCATS+GAfK9elUI60VzAzyqD+jb5LlN+Usvywl8jihx2
	 OV6BtSEmcxfzh+NmYwoNnjWi9YMq7ifNW4hnW3aPOr53C2reQ/UiiYTlc8sENo+Bt9
	 XWxC9ldrkF3jpS5z4UB6SI+Xbc0v/OKpbt3xcReNjiYwSvGbJ4zxbjGGolAugzcPH6
	 TdmzbB52y80GC/6feLdXahD3SyVBMXgIrmNqvPr4G5oacHuYexeAHmCdVo/+DLR8jh
	 WyUuWvHvx7Zxg==
Date: Wed, 21 Jan 2026 16:21:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Message-ID: <20260121232109.GA985170@ax162>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
 <aXC1sL5V9oqzT0ey@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXC1sL5V9oqzT0ey@derry.ads.avm.de>

On Wed, Jan 21, 2026 at 12:17:04PM +0100, Nicolas Schier wrote:
> On Mon, Jan 12, 2026 at 08:58:28AM +0100, Thomas Weißschuh wrote:
> > A few UAPI headers still contained references to kconfig symbols.
> > Clean them all up and afterwards remove the now useless exception
> > machinery in headers_install.sh.
> > 
> > Intended to be routed through the kbuild tree.

Based on [1], I am going to assume that Arnd will be picking this up via
the asm-generic tree but if you want me to take it via kbuild-next, just
let me know.

[1]: https://lore.kernel.org/20260112114744-21ac730f-68b4-4f92-9ac0-f4dc6c5bb880@linutronix.de/

Cheers,
Nathan
