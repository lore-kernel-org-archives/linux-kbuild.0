Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D23E4503E1;
	Thu, 24 Sep 2026 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249968; cv=none; b=bQC9bsgx4CYzM1dV5+Q3o5XksQjLpw5c/567urKwNgR1ZyOPmBrQXcAlNkJnZ8Hu0VGj/Y+s0vvRdLxv0UOs+TT0FAOApcX87qowJ/KAET7eBLMGQEclnjiek4wrLa52meTkFg7bmNVGjzEPvrFUB1I4XFkkb6DQ5uSVrQXK9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249968; c=relaxed/simple;
	bh=B0g543c4DuoLhybiBhRqqcUq27W+kBcSky1fya5mk5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSxjY/jzUkb9SN0IExMS4SA46vOExJgvYA4Sf8+hPtknOfmXv46/7v15wEwdHDQCYcr2chqIK/+2T7YMT+HzfGfA4e8h79TnO8Fi07HD/9mjjTKv1Ll9Nc2qVVT6Ontt/UqzLdiu4n9ORzniU5n/cwAkC9LYqxBNkfNTDwsJC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=gKPfyeed; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="gKPfyeed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790249963; bh=B0g543c4DuoLhybiBhRqqcUq27W+kBcSky1fya5mk5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKPfyeedo8AfLp83+uwmfMkjDYjSh3D1M5sR2rT0BRz5gvzSsVU/7vFYWwnRlJTgB
	 aZBOHwqijteqoXusT0OMUHl1q6tgrozWkSw0DBl94Tpbyr4HW2M7afEG5U2ufpIyE+
	 CILgabz/Tp9i29tseaicnjD0pBZZ+fNobJ2TkwPmV3fVst6i1U75uYKkJAws+f5utj
	 m+RMQLaO+8X1DzHt+uWMmI9eG03gohAvXjPzPvC1/VXKyfRMqYbpxG7B32CoL9G0oR
	 tLVO+TZH2KmoVcAHDOddZ+/Y+HiwMAeS5TebRLoXvZWk1O4CkGplV+g7Ch4JCI+fFK
	 4EmLoOVut0iWg==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab50beb-03cd-7f0000032729-7f00000199fc-1
	for <multiple-recipients>; Thu, 24 Sep 2026 13:39:23 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 13:39:23 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:39:22 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v3 02/28] kbuild: Add CONFIG_OBJTOOL_DEFERRED
Message-ID: <20260924-wise-independent-bumblebee-b5d09b@l-nschier-z2>
References: <cover.1790028654.git.jpoimboe@kernel.org>
 <cb189a2b71edeffae3e45163e3b8661f5757e0b7.1790028654.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb189a2b71edeffae3e45163e3b8661f5757e0b7.1790028654.git.jpoimboe@kernel.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1790249963-B9FF9EE1-820DAF62/0/0
X-purgate-type: clean
X-purgate-size: 768
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 54D34A01B7  external: no

On Mon, Sep 21, 2026 at 03:31:03PM -0700, Josh Poimboeuf wrote:
> For LTO, IBT, and KLP builds, the running of objtool is deferred to
> vmlinux.o rather than individual translation units.  In preparation for
> deferring it in more cases, add a new config option.
> 
> No functional change.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/x86/boot/startup/Makefile |  2 +-
>  lib/Kconfig.debug              |  7 +++++++
>  scripts/Makefile.build         |  4 ++--
>  scripts/Makefile.lib           |  4 +---
>  scripts/Makefile.vmlinux_o     | 13 +++++++------
>  scripts/link-vmlinux.sh        |  3 +--
>  6 files changed, 19 insertions(+), 14 deletions(-)
> 

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
