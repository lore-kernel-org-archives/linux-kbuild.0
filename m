Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794178690;
	b=i6oPNBCy0eh22outhZnM9o1xW9ya2oCNtWZ1IMb9eB8EaQsTMfVBFKn4AgSK2L5RPjPX
	 a2OnQ3WRuKrxWPUzmG6NoP1A9toL7L2Di2ZSnASE93AkvZy1WSkJLVkoJaeLMkt0tH85j
	 1fLD9OTJzw6Ech6DpDrVy3yWYVkYN2NG1lA2FdZea9kb6frFVqEN7C00jqvqE5I11vdK7
	 WWGdccXLIBp/1QZPhZSVP4Vv56hwkDd7OwezxoCwlMY1ClAl19ME6VRIdiOtXW5d+vAtD
	 YuxZA59MCGimrUGTlrRfGp6Ajz+OtAY+mQx9f2BGPD/nf4Swbcc6pqwNRvVH0jifNyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794178690;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HhDMewqjnSs1E7akW63C8ESiExx803jafmwg/XwALO8=;
	b=tI7nX4WOGMxMJcMs2LraSZVGHt66MFd+Vi/4i7eayWVKTd/m3TlFtzxaJpNm64nyi9q4
	 MI5e462H5l9NOCFEebRCObGk4WGtdDqsvaIGOMK2K22Lbdk884sXljpsEJNPcOjY8csgP
	 bVEIuFiDkaF4+elGeg8cfn6fXwoFE0n/BdKjL/M6e5MJjQmr6OppBjXlNbkGBt7eb4Kt2
	 hLoLzyStuC6lczvk2IIU+OSwhtKGvHz//zGdz4KhUGdBVVHtUtdzA4O/zWM8FzYRBGMTb
	 QmDdce5e+4zdaNLsnwkRCa93m7LeoWEPHCIx4g/gSFNV7EZi56Z5Q6Qd50eMaKDVydQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLYoctvl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65686606A31C;
	Sun,  8 Nov 2026 22:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLYoctvl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9441F0089F;
	Sun,  8 Nov 2026 22:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794178690;
	bh=HhDMewqjnSs1E7akW63C8ESiExx803jafmwg/XwALO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aLYoctvlxAcQPgKCWxZ7OFFpuJ2HDGM0Xu4HQ6BuqGuJKd+9r96Kq/+iuPvtvzOHE
	 yZ+4v/6pB8nekIYidmWDRnjIQoI4Lzu3Jj6mqjo+5CYazhfvIJL/8nUIWP2FeDqKyf
	 cF/VQoEkj11caZ9qm0iBCrbhU9zauNpHupfF4K3BsHyOkG/JdiZ9LXTtdpJlG8WeFt
	 izqucpy+vnyrY5FNbMw5Dxgqg8icOJrntq7eJgEkS8egkcv+PMr2yKZDLl04qLmRbD
	 4T73fii8sJ/qD65UK+o2VvvMLlQyp5zUpo2OAPr36HiGnh13daausAS+IrNM8VXw3u
	 LnQcEL0acimKw==
From: Sasha Levin <sashal@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Hamdy Abou El Anein <info@daylightlinux.ch>,
	hamdy.aea@protonmail.com,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: detect module name collisions between '-' and '_'
Date: Sun,  8 Nov 2026 17:58:08 -0500
Message-ID: <20261108225808.1809266-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179405726799.59648.18423712734918184078.b4-ty@b4>
References: <20261103110411.11698-1-info@daylightlinux.ch> <179405726799.59648.18423712734918184078.b4-ty@b4>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 07 Nov 2026 14:14:49 +0100, Nicolas Schier wrote:
>Applied to kbuild/linux.git (kbuild-next-unstable), with 'Fixes:' tag added, thanks!
>
>[1/1] kbuild: detect module name collisions between '-' and '_'
>      https://git.kernel.org/kbuild/c/bc348949

With this applied, ARCH=arm allmodconfig fails in modules_check on two
pairs of modules that have been in the tree for years:

  error: the following would cause module name conflict:
    drivers/input/apm-power.ko
    drivers/power/supply/apm_power.ko
  error: the following would cause module name conflict:
    arch/arm/probes/kprobes/test-kprobes.ko
    lib/tests/test_kprobes.ko

KernelCI report:

  https://d.kernelci.org/i/maestro:a0850dfdbf5eccb82fb3e7100a7178920a91c662

--
Thanks,
Sasha
