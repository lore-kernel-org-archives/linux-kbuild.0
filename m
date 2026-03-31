Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311430AD00;
	Tue, 31 Mar 2026 17:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977169; cv=none; b=GmeK3ADkKFre+JCpw2vuI1kQlXpJO9ebiGaOKuAnE8/43gVqRF0Cb0FEMyMze7Yc6CE9kspRMeF/fQj0VA0FqQBxTFqW2oIWXcGYr+VDNwag6DFUV5Dn/UovuK+5Kx259hSLNT2nE2JesEtW1EIg1t3w+1Hv7c0TdIPuALCYRAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977169; c=relaxed/simple;
	bh=na9S6gcGlu4fNQIkXNeqkJB0pmztjuQBf0ZdxuGCRG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnL/Ig02nczm8rf+v48fvwmNiahrRFouW/EU3f8JFxFku4ROH9V6UUN3YWd6l30wlhl8MXBje99Y7bUFVlQDLrI/Tah89OsxTKN4CTWxRCmSJv2kMPBX3WbUr3qvUYZPl41SiUWXDq1RxUaeSzey65bjY13opaQltjxn33fJHA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOO3LxS1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOO3LxS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E0FC19424;
	Tue, 31 Mar 2026 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774977168;
	bh=na9S6gcGlu4fNQIkXNeqkJB0pmztjuQBf0ZdxuGCRG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOO3LxS17R9TUtVYUVwRg1LOtXkL0clxJTNVzWRdzZLS+jrZq20mMMz1OAEYZ/I8L
	 yk3qbb6ONJuxTx+4q6mUdpRGLIRUERFupDmrN5jylC87A+gSl3frfeg1aND8BhlmoB
	 n6IkxrQNqhZAHMC4Lehthu54HjIJyALgJmW2j1ye1z2f9HUV8MdjizhRdrbBS9BqNi
	 BSE2zoxPVdNjfEXeWpq6jsuNZkjRQRvyaq9af30k+9otg4LmG5YgTSEU9O8gwlCS8w
	 chyMX+1soW+iL+bjOqEZFeCK1XWTKoMLzOwdFf7q7vkMNtCAPX0wLRgSW6wW9OVyqD
	 l4DPTJH5Mk2Tw==
Date: Tue, 31 Mar 2026 19:10:20 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, Janne Grunau <j@jannau.net>
Cc: Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Message-ID: <acv__JlZZgy7Z1HM@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, Janne Grunau <j@jannau.net>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
References: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
 <177497336364.2732896.246906403037876696.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177497336364.2732896.246906403037876696.b4-ty@b4>

On Tue, Mar 31, 2026 at 06:09:38PM +0200, Nicolas Schier wrote:
> On Fri, 27 Mar 2026 09:30:29 +0100, Janne Grunau wrote:
> > The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
> > target to build a cpio containing modules") is incompatible with
> > initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
> > be a link and directory at the same time.
> > Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
> > that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
> > module install location as `make INSTALL_MOD_PATH=/usr modules_install`.
> > 
> > [...]
> 
> Applied to kbuild/linux.git (kbuild-next-unstable), thanks!
> 
> [1/1] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
>       https://git.kernel.org/kbuild/c/b205a1a5
> 
> Please look out for regression or issue reports or other follow up
> comments, as they may result in the patch/series getting dropped,
> reverted or modified (e.g. trailers). Patches applied to the
> kbuild-next-unstable branch are accepted pending wider testing in
> linux-next and any post-commit review; they will generally be moved
> to the kbuild-next branch in about a week if no issues are found.
> 
> Best regards,
> -- 
> Nicolas
> 

I made a mistake, please ignore.  Sorry for the noise.

-- 
Nicolas
