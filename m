Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206975;
	b=DTdadQd3aXbIZhFJEIw+sEiHkUCczWUeoomGoalATASDGOfStIijNSPTlEh8sqlpH1Uw
	 BTyvJ7tpUetODUUfcbhQ46pmUlMf9bMtIVOboy7X8c3s7EJbuRITC0AkUGzH8pOdeTVto
	 5ddmjM7zllleWP5yBk7jVy1xPU8kECjsvjiEnis0GnYszgLpNKaiJhyvi7xorQvSCJ0W5
	 rVnZdT88FmsQYSCit8wLL4NlWzM2rgcod9aQpCz4ZtxNk5uP0UsvGSJoWaurHm0jiAnOT
	 sA5PBRBta1KDghW3rjhAIUKcvxLaCr436wRI4Iu1K9wMn/OscKXd1CneEfEGBm3VXnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206975;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AiPsI4ApryCRb9QIqNSYkm7VkIw1BbiCYNsJnK6tqFY=;
	b=w2Z7w1laHEIGxhcAgpfiPgaYd2vel+EXfHDFq6saFlYkEwX4SgcB2IYmdK5R1Hz7qCzu
	 44ddiPTDw6tYtddR0SmH+kge1ptegsDTgNT37J/HOgHXCaLNmuqHYMkKwm1/DJy/fXQXt
	 ki7Ca6t4gxVYhZLwtAU0hu+SdmgY9SCzcAum6VFoyX6Kg5uU56n5EnhP1Y60GJlT+uP+m
	 v8+gzvPRs4EEL6p208vveeg6gPlGw3NBntY4HqN6h+2V94MDt/xbeASJS1uHHufo536Fy
	 kMWEyCoK1EnlaNW+oS3zfWvUgmkGq2rIKn8PglGSefabA8MiflTJpS2WVupG1PeYJsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIpHAVGU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7466606A323;
	Mon,  9 Nov 2026 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIpHAVGU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8591F0089F;
	Mon,  9 Nov 2026 06:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794206974;
	bh=AiPsI4ApryCRb9QIqNSYkm7VkIw1BbiCYNsJnK6tqFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QIpHAVGUfD9yKaHGi/MchFBZ/fpx9BkUbjF3WiZbj9liDqupg+9mccIKgQ3+VMfOT
	 c8qc3XUuPuS7NrAKh8zrZdPz+xGcrqAra8+iqJ4VtBh2i9s0quxleryuacypBKAHMX
	 VDYxRwA4sJYOkOdmYzinySxFN62WKoqVwERD2Xe3hUmOFGjDS7PLUVYgfRLNkZX33c
	 TrJ9E6qGa0zPrQTA4LrtOR6lnh4xM98hcOYcqwXE2l2itSMFmyYlKes3vuD877seXX
	 m0FimQHg0hYpvEdiPQ7JjyWGToCeU90vrnCF82uzvyVc+CyNZKcqyfvg7+EzfSG0X/
	 StvSieDhBdAeg==
Date: Mon, 9 Nov 2026 01:49:30 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Hamdy Abou El Anein <info@daylightlinux.ch>,
	hamdy.aea@protonmail.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: detect module name collisions between '-' and '_'
Message-ID: <20261109064930.GA829325@ax162>
References: <20261103110411.11698-1-info@daylightlinux.ch>
 <179405726799.59648.18423712734918184078.b4-ty@b4>
 <20261108225808.1809266-1-sashal@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108225808.1809266-1-sashal@kernel.org>

On Sun, Nov 08, 2026 at 05:58:08PM -0500, Sasha Levin wrote:
> On Sat, 07 Nov 2026 14:14:49 +0100, Nicolas Schier wrote:
> >Applied to kbuild/linux.git (kbuild-next-unstable), with 'Fixes:' tag added, thanks!
> >
> >[1/1] kbuild: detect module name collisions between '-' and '_'
> >      https://git.kernel.org/kbuild/c/bc348949
> 
> With this applied, ARCH=arm allmodconfig fails in modules_check on two
> pairs of modules that have been in the tree for years:

Thanks a lot for the report. I tested arm64 and x86_64 allmodconfig but
failed to do arm. I sent the following patches for these.

>   error: the following would cause module name conflict:
>     drivers/input/apm-power.ko
>     drivers/power/supply/apm_power.ko

https://lore.kernel.org/20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org/

>   error: the following would cause module name conflict:
>     arch/arm/probes/kprobes/test-kprobes.ko
>     lib/tests/test_kprobes.ko

https://lore.kernel.org/20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org/

-- 
Cheers,
Nathan
