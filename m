Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D747532F;
	Wed,  7 Oct 2026 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368314; cv=none; b=MC9ONOEovp4GLmi0nKjLR8gYxWKHZiq8Rua0Vysx/SmZYUkGADybbI3qaXvBiQ4f7VHEvbYd5yngESWjHTh/R02o66QqkySIyYKCBWEXAiP01O93ylrQaZj4kxrIcGkquqCfSq0J8wUh5ucNkPo1ltHGS1dXJ3e6yCfDWcH6G70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368314; c=relaxed/simple;
	bh=HWqbkhhT3pXuQLA0oV6bTWdxa9sGmpDNd8RHzOSVqKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCLQUpBueN8g2TUR+lkW1H9lafH83cteHi6MGIwyYSzCL81QiTAVd06U8Q7Qdo6+rlLj7u/gx7WInQdAER5mJ9JyZWiU7lgDweYX61kz9gvSzPw41mWSYiSME4xH9tdY2h5ix4no/9S3czafF1Z1JLqX2OudI9B/AyIj1H2EnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3vIXD9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3vIXD9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A86C1F0089C;
	Wed,  7 Oct 2026 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368305;
	bh=U8t0EpX34h0zGx7p7PQZm3Tn06MS2IwwM0z+Nc4pLCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z3vIXD9wo+gw4+vKKlKfYq0H4InS7OyYyCX9vFgZkXKINNidxmaTHFmbTplG0VhDr
	 WS/r3Sk35R09CXMl0KIik4IZj72R97uQnoSr963Fci5mHI9B/h27e4MmPO4yMHSL45
	 uBURIj9k27m4H7FFtEQnkxbeGytTs7eTlGab6OFUF9O8oCpk9IkM+zVOe+kn463bGj
	 SLlbs9bcPG526Wsm7qro+VQgTUxeVJ1TbbdqmjMiWtCMBCmPvlszoLOuHd0eqsrnTt
	 csUwjQXC6f78QdT1Zvo5XXm0f885BhQY7jci8CYAsRq9cgAndvDm4zCTQMs8V1+wZb
	 tukl9VUZCTyXQ==
Date: Wed, 7 Oct 2026 12:18:21 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: LZ <lzsx618@gmail.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gen_init_cpio: stop parsing on lines with a missing
 argument list
Message-ID: <20261007101821.GA1530672@ax162>
References: <20261005085729.872402-1-lzsx618@gmail.com>
 <179136520162.1527194.9223276311672277059.b4-ty@b4>
 <CAGD6qbRTat70Uf7Ax_e+M0pphwJN9s5+iyWM_3ELPQGm3YjdFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGD6qbRTat70Uf7Ax_e+M0pphwJN9s5+iyWM_3ELPQGm3YjdFw@mail.gmail.com>

On Wed, Oct 07, 2026 at 04:59:05AM -0500, LZ wrote:
> Hi Nathan,
> 
> Thanks for applying the patch. I noticed that I submitted it with my
> username lzhan011 as the author/sign-off name. For proper attribution, my
> name should be Leizhen Zhang <lzsx618@gmail.com>.
> 
> Would you prefer that I resend the patch with the corrected
> author/sign-off, or is it possible to amend it in the tree? Thank you so
> much for your help.

I have updated the patch in the Kbuild tree, as it was at the top.

  https://git.kernel.org/kbuild/c/c8dd1aa0274d8ad3df82ec1b064065f410ce99ed

Please note this is incorrect for all of the other changes you have
sent, so you will need to resend them. You did not include the Kconfig
reviewer Julian Braha on the patches touching scripts/kconfig, so please
include him when you resend.

-- 
Cheers,
Nathan
