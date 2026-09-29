Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B73A168E;
	Tue, 29 Sep 2026 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713404; cv=none; b=uH9fDcmcsySkj0uQZS1kWLPt1056LxedWh0F5dmqjYQ+QoJcZ4QE2P7VFuN8CxQ6aHMVPfeHqy+T9yA77hSgN4tK2gFNto1S9eFu0m0+v6IGwbv4a/dpDWu8N6F9VnbOtdIp47hERr0Adm3QPNccpLwgyPCZsITlz1uWSujRuJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713404; c=relaxed/simple;
	bh=31k0s+0ETQcB4Pc1v9AwcPGOhZtpDwViRae3dV9K+Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3cOC2RywHDywgPnn8qVxHDuDDD4dJMX6UGQBi0wk1/0azG/2si7X8BVA5nKjsIUOMuXpxeGpa9XThOGKu9p4sfTkRZeyTmgLGrVkYRSZWnXklHcJbWeYQUfSpOlSLYwLEU6f7laHg7OvaLRXVI8C3KTQemWCYFDfhGWBoGH4kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGbUxOXd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGbUxOXd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98FA1F000FF;
	Tue, 29 Sep 2026 20:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790713403;
	bh=rU5+ZgJCaoF8iwDSScV+IZVOKK6bVvnbrik/EXzCdHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nGbUxOXdbwxN85QSSj/N4b5Y4N6JhT/to2JIxGRY+/Y0N5Y9v7OBiyeiOyDBx6zQv
	 daSI7O6U1/95dYl6lsohCZDxWQYOIElG/M/KGUrx0Sh+Q1s3Wi9v2McGsVt6mSItjk
	 mF8ZpfVR9lMNyjFR/Aq0dm3Nu7V+CjhcjhAoqYXOX/Fs+iqq6JnqblePbcRXwcUHNy
	 KmIoziJLpSQoppa4yq91g44yeSDNx8HsTmbR0QW3jFnfGzTiVad+M3V86+CZBGGDHs
	 nuMrXifh00Dcmbn7qkAbLKkwLbm++eoIj8fqrYjB6H2APomqCS5lHZtVayQ4yNcFPQ
	 XkMSooReE/O4Q==
Date: Tue, 29 Sep 2026 22:23:19 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: omer zalman <omerzalman42@gmail.com>
Cc: nsc@kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: run-clang-tools: import os for broken pipe
 handling
Message-ID: <20260929202319.GB3237201@ax162>
References: <CAGLNFZeLTDhLj5bzOVC51J6Az6E1D9PWj6yzgHZO8Rg-82kpHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGLNFZeLTDhLj5bzOVC51J6Az6E1D9PWj6yzgHZO8Rg-82kpHw@mail.gmail.com>

Hi Omer,

On Mon, Sep 28, 2026 at 07:47:14PM -0400, omer zalman wrote:
> The BrokenPipeError handler calls os.open() and os.dup2(), but the
> module never imports os. A broken output pipe therefore raises
> NameError while handling the original error. Import os so the
> handler can redirect stdout and exit as intended.
> 
> Signed-off-by: Omer Zalman <omerzalman42@gmail.com>
> 
> The exact git-format-patch file is attached because Gmail's web
> composer removes tabs from inline diffs.

As folks have mentioned on your other patches, you need to send your
patch using either git send-email or b4 so that they can be properly
handled by our tools, an attachment will not cut it.

Additionally, was this change inspired or developed by an LLM/agent? I
only ask because this has been broken for ages and you and another
person sent basically the same patch within a week of each other.

  https://lore.kernel.org/179017337986.52388.7943687183785012868@gmail.com/

Odd coincidence if not. If so, please follow our coding assistants
documentation:

  https://docs.kernel.org/process/coding-assistants.html

-- 
Cheers,
Nathan
