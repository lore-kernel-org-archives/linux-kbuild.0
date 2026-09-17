Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482694B44D9;
	Thu, 17 Sep 2026 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658048; cv=none; b=ViVBe2vAkA2qs0G2WhILShdEwC4aFr+icURP9mWSv3qrZNo0JAqbPTB3mfJ/+r5bI5Lg9tIRLAHhCjopuDwrYlz6nsEFUBhItb8gk2buEL0LrwZL0AssvU2QntxCJErhpjw6I4kjZkA3rlklF+t3/jmg4fLrabGUC2o6VyRAwC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658048; c=relaxed/simple;
	bh=Pq3IVwQtS6k6VF3FXfKs2UgTHmHHXLaM5oM9t4DEbxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgCCUoXOGRdQyCMiPbi8rqlvFT9PB07GyTjCZ6aSMx1VcLMww5aUfYi7Qm7++yf5vb7wRhdKyrZwv6xqgyfJWvLcbbm6rtj9aYUImi9BAJRWKMaou3TriZ1OE11NT9OL72cZriTPuYd93igAGtoKrh7nIbUuUwzodBlE+W0jqPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=bk8RiX8U; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="bk8RiX8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789658019; bh=Pq3IVwQtS6k6VF3FXfKs2UgTHmHHXLaM5oM9t4DEbxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bk8RiX8Uxc8r+rFB1pW68bD07NIe6rSYI0HsmG/gUgxzEF4ynZrRgqFr/O7aA9/9S
	 /p7vIMKYAeN51e15YxMSD3E6JXAGkF2VjgTc6CpB2CsaL+m91kca/OWIxet0hxM80t
	 EMV13CIkwpknVjXg6dq0ELRlH1sH+1zf2oc6tICD7RD5hutjLX1Y2jSN6FOh+NBTp3
	 xgF0/OWbC36/MfYfg0VUvXSL45CzXHaR38eFtoMaiHdBlo6RexbATAheXih1V4CB2Y
	 Pt3NA5pHKQvDs1eQx4jTmMt0xqrHQskUl8hh/fQLBE2V18oQnIE7J8R3/gU0OZw1gq
	 sfs/q91NEi/tg==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aac03a2-0449-7f0000032729-7f00000191c2-1
	for <multiple-recipients>; Thu, 17 Sep 2026 17:13:38 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 17:13:38 +0200 (CEST)
Date: Thu, 17 Sep 2026 17:13:37 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nico@fluxnic.net, rdunlap@infradead.org,
	grahamr@qti.qualcomm.com, kees@kernel.org, pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/5] kconfig: check for out-of-bounds numeric constants
Message-ID: <20260917-malamute-of-excellent-development-b35cbe@l-nschier-aarch64>
References: <20260915211508.291790-1-julianbraha@gmail.com>
 <20260915211508.291790-3-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915211508.291790-3-julianbraha@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789658018-1AFAB965-D9F456C7/0/0
X-purgate-type: clean
X-purgate-size: 1724
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: F01D8A07C8  external: no

On Tue, Sep 15, 2026 at 10:15:05PM +0100, Julian Braha wrote:
> The Kconfig interpreter internally represents constants as strings, then
> attempts to parse them as 64-bit signed integers for 'int' options, and
> 64-bit unsigned integers for 'hex' options.
> 
> However, there is currently no check that the conversion succeeds, leading
> to failures when the values are actually used. For example:
> 
>   config LARGE_INT
>     int
>     default 10000000000000000000
> 
>   config BUGGED_INT_COMPARISON
>     bool
>     default y if LARGE_INT < 2
> 
> Obviously 10000000000000000000 is larger than 2, but the Kconfig
> interpreter will fallback to comparing the two values with strcmp() after
> the numeric conversion fails, causing the first character, '1', to be
> compared with '2', and giving the wrong result.
> 
> Since none of these out-of-bounds values are used as constants anywhere in
> the tree, we can already make these error out.
> 
> Assisted-by: LLM
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  scripts/kconfig/menu.c                        | 60 ++++++++++----
>  scripts/kconfig/tests/err_num_bounds/Kconfig  | 79 +++++++++++++++++++
>  .../kconfig/tests/err_num_bounds/__init__.py  | 12 +++
>  .../tests/err_num_bounds/expected_stderr      | 10 +++
>  .../err_num_non_numeric_ref/expected_stderr   | 30 +++----
>  5 files changed, 160 insertions(+), 31 deletions(-)
>  create mode 100644 scripts/kconfig/tests/err_num_bounds/Kconfig
>  create mode 100644 scripts/kconfig/tests/err_num_bounds/__init__.py
>  create mode 100644 scripts/kconfig/tests/err_num_bounds/expected_stderr
> 

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
