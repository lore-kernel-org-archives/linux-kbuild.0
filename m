Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857A4413D85
	for <linux-kbuild@vger.kernel.org>; Fri, 15 May 2026 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778873433; cv=none; b=PSovRyKxi8l+0fnfl/dFcIVETd+rTW88Oz009OuhFITi4HGnLBDHnKcMLz48mgL+xbWm92zCWwKoHM+P0GbWOSiCQe5jkDwSJK3Ec1whDBDUm85Ubn//gJEJGdEH5aM8c1MgRP3e1+s4b106mG7oXmkKWKRzv6PkxejxpVgGMtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778873433; c=relaxed/simple;
	bh=nCG6uwrTcdQ49H0l/cZsX2007PN0rdO9C/FFBS9K0LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGoMI6WRYeFNtjxGo+42pBE6CrzyQl61dzCUCwFN5HHlg6YNBIAUJKdfOlUKezQ2dFQEuOTAOntR4/nGancWLRxlJp1Dpd1L9O8YzA1D15WhAeD5f6unJR8ogTj5EVUQm6Jujg1+4sRaqIvtL3AQH1rM8uN/TN4q+giV2ZYfiGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZ+M2q5G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZ+M2q5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2C9C2BCB0;
	Fri, 15 May 2026 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778873433;
	bh=nCG6uwrTcdQ49H0l/cZsX2007PN0rdO9C/FFBS9K0LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZ+M2q5GpdvExMtJDgLW1r5ZsY8h9pXW/2ag4Z630OKQjpU9ZPlP5/syRTHw6a5zV
	 n9siv09sAcJibPdNyJB4vJ51kvbyALT9jfJF3fuANkRX+1kTx+EINl5umJlsPEXbY9
	 qWyONsvUfgvkFWLGZD4bgGEC85fFUfEXovec1SqJi3Qk4i4oaMQH5qx6GK65AXtuBd
	 XVzu0jMG24uJ6PU+f6+5cznPway5RfLEoMqN9i2GDPqPQU79BzG4VYOjRQih03PeGT
	 pw9s/J4dW9u6okE1LymHGt6zRAJoXeVwiKTPGlcxqNx9SlqaDA9wSAN042zmGpMY4T
	 YZdiapIlUjXQA==
Date: Fri, 15 May 2026 21:30:21 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Jill Ravaliya <jillravaliya@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, nathan@kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in
 builddeb
Message-ID: <agd0Ta6zFgtzXQkc@levanger>
Mail-Followup-To: Jill Ravaliya <jillravaliya@gmail.com>,
	masahiroy@kernel.org, linux-kbuild@vger.kernel.org,
	nathan@kernel.org
References: <CAHr0PbumU-Y4G9rmuffd3crfOpqgxvQii0cVEYFC_sdjjNEZRw@mail.gmail.com>
 <20260501012018.43278-1-jillravaliya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501012018.43278-1-jillravaliya@gmail.com>

On Fri, May 01, 2026 at 06:50:18AM +0530, Jill Ravaliya wrote:
> The 'builddeb' script generates maintainer scripts for Debian-based
> distributions. Currently, it invokes post-installation hooks via
> run-parts but unconditionally exits with code 0.

Are you sure?  On my Debian trixie, run-parts exits with 1 as soon as a
single script from the given directory exists with non-zero.

> This masks failures
> from downstream hooks (e.g., initramfs generation or DKMS).
> 
> On systems with modular storage drivers (CONFIG_BLK_DEV_NVME=m), an
> unnoticed failure in an early hook can prevent the initrd from being
> correctly updated, leading to a panic on reboot.
> 
> This patch ensures that failures in 'run-parts' are correctly
> propagated, allowing the package manager to abort the installation
> upon hook failure.
> 
> Signed-off-by: Jill Ravaliya <jillravaliya@gmail.com>
> Link: https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/2141741

From skimming through that bug report, I don't think that the run-parts
part is the problem; but it seems to me that Ubuntu's
'55-initrd.install' script is the problem.

Kind regards,
Nicolas
