Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A83A223DD6;
	Wed, 18 Feb 2026 22:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771453634; cv=none; b=HtcrPG92/Q3+MCMasJcbKWRF6tBFYWs3sGblFcvc5h/ls5RsjE+wZD8sekm8i0woLiFeMxUM7WK/cY8RjLhyPRtnGHUPsGuHweKnx+mCd7PyWkrPj/NNfg4nBgatvX9Z8JynB4ByWZpUGUcMPgrOomOn1VWh6mC4y/TD9VR1AHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771453634; c=relaxed/simple;
	bh=S6H6G6hQuCrRGuj3GWmT6Y0NbEa/mb4ciHU5vPt1j80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRVKvkNGqMTfSXqIh4wV+dn39p5jSTQlSjs+V3bf2uzul7/H42jRx01zOvzyduxvsL6hALwtctPLkTf9RXZTDLsMJCCU3zJ1doTwStg83ZO0X418EOY56tFojvovN5PqQVjE4ffJLu33aW73+EEGbppETUuKEFWkekTvq2TS6og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZgGU8lY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZgGU8lY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D559C116D0;
	Wed, 18 Feb 2026 22:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771453634;
	bh=S6H6G6hQuCrRGuj3GWmT6Y0NbEa/mb4ciHU5vPt1j80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZgGU8lYGfS0ZysHqdSyewbcOUq87S8njSW32QVc1m5X0wE1P9QHolIzsZzsBQ+lW
	 rvjtTGK2XZmjbBoQGmKImzp+MjQamG6f0rT0M1NYXdXuLYgnlbAZEdxnBPWBizEzFG
	 MaJtKIvxw5rnsfLysBkzeIXnZLG7xfQgR2tf+KcPGYqbGizNmenTyk1KY01PI+AkPH
	 /4HBGApdm8m0P0KMLdg8Rv2v/Wi2opplCrDlHVmdMJzTCy+G/BqNGp/08u8wr96zz4
	 FQ9aiPrYHE83aORip+JcC1Yw9KN7hArRJPQzZskJulVnSbcDTBeFXd+kZh9l9hydx3
	 wW6CWrPiO3eig==
Date: Wed, 18 Feb 2026 15:27:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [GIT PULL] Kbuild fixes for 7.0 #1
Message-ID: <20260218222710.GA1387583@ax162>
References: <20260218210423.GA3232039@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218210423.GA3232039@ax162>

On Wed, Feb 18, 2026 at 02:04:29PM -0700, Nathan Chancellor wrote:
> Due to the backmerge of the 7.0 changes in v6.19 to pick up that
> aforementioned rpm-pkg change, the 'git request-pull' diff stat was

This does not make too much sense reading it back. It probably should
have been something like:

Due to the backmerge of the 7.0 changes in v6.19 to be able to fix both
the aforementioned rpm-pkg change and new 7.0 material, the 'git...

Cheers,
Nathan
