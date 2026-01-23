Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2233219992C
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 21:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769202092; cv=none; b=cPS1l5ZdTHR/CTNeNFNHpUlncWXHj446ye5a83gkfRNH80+pSKfzDOD76/NBCsxLB42HFPmloG2cZyYn6x3I/vY70DlJTwBICm4FoaYYzqDF21h+r44iK1mb5ko90rwCNcrKfexrUESOdY10piGpkCVA1m5WqGVN7P4KjWBRpp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769202092; c=relaxed/simple;
	bh=6YpIN33qtnOoVhbiQxAs8dnuV04ukXZcB3W+oasqayw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgLuiFmli+OMfl3iQWveV9LHgGa/uSEUAFu8Isy9RrZYiLy0D0oN07wuN7iF51UdHr4n4GbGG96xH2auHZhWjGmYiACrlGD/4spaXp6XJz7/0wrUoult48Stc3g00tNxh8E3O3VmHuDcWebGAypT9gyaPEBhqMmg6J0uwKUCm6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYI7Sosf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYI7Sosf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C1EC4CEF1;
	Fri, 23 Jan 2026 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769202091;
	bh=6YpIN33qtnOoVhbiQxAs8dnuV04ukXZcB3W+oasqayw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYI7Sosf7Aukutlb3JHQsL5R1UY7LXYWfa9RLcROG0apVzWoQ9/NSLckPFdaJBkuZ
	 ijZ8CaESivrbtWzYaKgJfSQca/vCkZCX1MCSk1ETY2Tvi+ahGxKUfSU8uzEvN5ymc9
	 PDFiMHFI9k77bk/j6T1WoFSjgmg7deoHMABQQID9kMSX3TyEuNUXxjUPA9eB1aALL/
	 2wET/m24O8biHA8EyfZmooIu11ySHfe+oWZu1JM2VTTAHDGurJQBZSZQmkOnR3a0HU
	 Ov/Tv0Y9/XP0o64675CqHvomfWD23xCL1GHzhOXL/8nGp45LkOFaG8YHXmkE+6bKp9
	 bH1RFYNwvCAGw==
Date: Fri, 23 Jan 2026 14:01:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, Guillaume Tucker <gtucker@gtucker.io>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/3] scripts/container: Minor fixups suggested by ruff
Message-ID: <20260123210128.GB95167@ax162>
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
 <CANiq72mLBdW+XEB-BTgjngwRxgVTRzc1K6XiwBVRkSFu+108yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mLBdW+XEB-BTgjngwRxgVTRzc1K6XiwBVRkSFu+108yw@mail.gmail.com>

On Fri, Jan 23, 2026 at 04:14:16PM +0100, Miguel Ojeda wrote:
> On Fri, Jan 23, 2026 at 12:27 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > This series fixes a few warnings that I see when running
> >
> >   $ ruff check --select C4,RUF scripts/container
> >
> > which were the few warnings from my personal ruff.toml that seemed most
> > interesting.
> 
> I haven't had time to look into the new container support yet, but
> having kernel Python scripts Ruff-clean sounds good in general, and I
> wonder -- should we consider having a `.ruff.toml` eventually?

I think that we should. Even something as simple as the one in the Ruff
docs would keep things consistent:

  https://docs.astral.sh/ruff/linter/#rule-selection

I guess the one problem there is consistency amongst developers (since
one's linting workflow is fairly personal) and having a wide range of
Python code across the tree but having a .ruff.toml for people to run if
they want it is harmless.

> At least we have a small `.pylintrc` already, which is quite recent by the way.

Ah, good to know!

> I think I recall you also using Black and/or Flake8, for
> ClangBuiltLinux-related bits perhaps?

We use Ruff and pylint for linting, yapf for formatting. Ruff can
replace flake8 outright with the right configuration in my experience.

Cheers,
Nathan
