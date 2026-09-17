Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD54B44C5;
	Thu, 17 Sep 2026 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660660; cv=none; b=r3j2DEJLmmbV3u/2c6MV0/JfxpCPD1npoL4u4fMNb27tewxND649CBe9orpH+Zu+xV+77pyhFvD3smnKJCRV3nvD1ggvF0qJ80sRNuuUjg8hFhwtFsJY7q10LD590nuNDim/GMS+T2PiCJXkBCw1uJZ31oALnid4Mc16U62/sPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660660; c=relaxed/simple;
	bh=+cFnJ0Kz3pP3xU3zQkpTc0gR9mg9TPfoJfa9EsU1er0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNqQ8b9LFTQ9Uhe77Fz+/e9gwHQx6anDwHiozkv5S5GDG+tfP0OtWFCkWR/6vuPRQGhOya1KmBcGujAsAzJL3Nts8ykTBz3JvTyxAkt8kHG032pAukhIOWPMvhNXRqv3mbwgHCDdLXC913OjE2A5+fGMgNVMdBwuSzjiFuV/Uh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=KUiggnZD; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="KUiggnZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789660655; bh=+cFnJ0Kz3pP3xU3zQkpTc0gR9mg9TPfoJfa9EsU1er0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KUiggnZDPFJxho61RTOpWwnIfmfdPY9rGe0NgOimlA58C1PxLowCNFo8q52Hn91gT
	 t6cHXRayvcW6oh3e8s6vjj/yHF6t8ElVqQVwbiIECa0gQQ/3OKv0twbP1T/j50pBHy
	 j7esC6DfYDsZuhATop2P13rQ2FnNv101F6AWp2wURKnliJPONroJAw8USuGZ9797gC
	 BoxBR8NIQxgQsKsPL0Bc/JLow0PBGX5srMtUgt3jN9a8cnhOtBgiwQy93hYp76l5nJ
	 84TjGs/zzKqJxT9tAuaVD9iyPmpsovGDTW/3k4ra66/ahpf7vcwdmrn1+smqfqOa8J
	 8VSPiDZekWLYQ==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aac0def-0449-7f0000032729-7f000001c6fc-1
	for <multiple-recipients>; Thu, 17 Sep 2026 17:57:35 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 17:57:35 +0200 (CEST)
Date: Thu, 17 Sep 2026 17:57:34 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nico@fluxnic.net, rdunlap@infradead.org,
	grahamr@qti.qualcomm.com, kees@kernel.org, pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 3/5] kconfig: check for hex and int mismatches
Message-ID: <20260917-bizarre-enigmatic-locust-e2a6bb@l-nschier-aarch64>
References: <20260915211508.291790-1-julianbraha@gmail.com>
 <20260915211508.291790-4-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915211508.291790-4-julianbraha@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789660655-0BF8D965-A3C1DD14/0/0
X-purgate-type: clean
X-purgate-size: 1891
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 2045AA07CF  external: no

On Tue, Sep 15, 2026 at 10:15:06PM +0100, Julian Braha wrote:
> Using a numeric option of one type (e.g. 'int') to determine the value of
> a different numeric type (e.g. 'hex') currently fails silently in various
> ways if attempted, because the underlying string representation is naively
> reused.
> 
> Example 1:
> 
>   config I
>     int
>     default -1
> 
>   config HEX_DEFAULT_INT
>     hex
>     default I
> 
> Here, HEX_DEFAULT_INT actually gets set to '0x-1', which is of course not
> a valid hex value.
> 
> Example 2:
> 
>   config H
>     hex
>     default A
> 
>   config INT_DEFAULT_HEX
>     int
>     default H
> 
> Here, INT_DEFAULT_HEX actually gets set to 'A', without even converting
> into the base-10 equivalent of 10. This value, 'A', is otherwise a
> rejected int value if entered in the frontend, or read in from an existing
> .config file.
> 
> These int-hex mismatches currently do not appear anywhere in the tree, so
> it is already safe to make these error out.
> 
> Assisted-by: LLM
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  scripts/kconfig/menu.c                        |  2 +-
>  .../kconfig/tests/err_num_mismatch/Kconfig    | 38 +++++++++++++++++++
>  .../tests/err_num_mismatch/__init__.py        |  9 +++++
>  .../tests/err_num_mismatch/expected_stderr    |  4 ++
>  4 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/kconfig/tests/err_num_mismatch/Kconfig
>  create mode 100644 scripts/kconfig/tests/err_num_mismatch/__init__.py
>  create mode 100644 scripts/kconfig/tests/err_num_mismatch/expected_stderr
> 

Thanks, error-out is really a good thing for now.  Actually, I am one of 
those who'd expect that Kconfig auto-converts hex ←→ int; so, thanks for 
enforcing clarity.

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
