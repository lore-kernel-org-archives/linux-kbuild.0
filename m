Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C3415B88;
	Thu, 24 Sep 2026 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250035; cv=none; b=QnARLinx0oiO8sRCCFzyZqXjc/a/JizB9MQDS6q9FGqjk5RvMeTQ8rQqTRJBc2OsvcpSTd/EJIpNqRN5jrvEMgQ3+TWKAsgBCeG6Si0aKOha6coPbFj7h/NRGvGdD3uBhkP65En68ioUW5LfKekTB9E+jr5MzA+bIebKH6UDr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250035; c=relaxed/simple;
	bh=7zimwZzK2SC9XhkwrG84zYpkgnjnpqBWTV3LkAFNdgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DetiCE+I15J6tr3SUAsMrBQDaDaw/PGCd8E9qEHxFkk9mx8dL6PKHIlkQFDip1LpPGgtOoRYzqBlNVsFXOsFNdArQfK9njcsnwHtdwQh5NB3S4laMGgrjzaNlW+fUfiDHjnxZRT2qcQw8m/qFyGgTcjaWYxr5XpgchqAWiKQ+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=gUgCQvel; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="gUgCQvel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790250030; bh=7zimwZzK2SC9XhkwrG84zYpkgnjnpqBWTV3LkAFNdgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUgCQvelTEq3EzwwF4dGmmUFsrkz6/0pdrhwNmUA6F8SBjCMepfk9SZMZBy+Iyka/
	 knvD8+JMYN0sbwioezwroDYCHOeSRvi5pSvB8yoWXAMQJy3E0qBSlzDO6kzcdwXdTO
	 LdAVr7GtrXTHnzGh59g5ypqgry/dQ/lj6zMqt4kx9uLylg1U1sSCkkMqzcKZNFSh7i
	 9cyW56pBQ2c/T/HzNepfIQWHAwb5Cv1xD1p89xtldHPSdYjOyqgJm0ecY2NKfhbHYk
	 i6d9Z3LpthJOQaILpZ/M/akb7OLGdP7vOQVG2TW7+80uqmuTWiqveDCMTZl2W8JhA9
	 CM1G8o2yMegUg==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab50c2e-03d5-7f0000032729-7f000001bbb6-1
	for <multiple-recipients>; Thu, 24 Sep 2026 13:40:30 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 13:40:30 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:40:29 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v3 03/28] kbuild: Add CONFIG_OBJTOOL_CONTROL_FLOW
Message-ID: <20260924-evasive-notorious-polecat-47e7d2@l-nschier-z2>
References: <cover.1790028654.git.jpoimboe@kernel.org>
 <a80f670beb8272e9d78700530fd064fd839493db.1790028654.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a80f670beb8272e9d78700530fd064fd839493db.1790028654.git.jpoimboe@kernel.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1790250030-26C72EF9-328E253B/0/0
X-purgate-type: clean
X-purgate-size: 449
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: C30E8A086F  external: no

On Mon, Sep 21, 2026 at 03:31:04PM -0700, Josh Poimboeuf wrote:
> Add a config option for when objtool reverse engineers the control flow
> graph of every function.
> 
> No functional change.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  lib/Kconfig.debug | 6 ++++++
>  lib/Kconfig.ubsan | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
