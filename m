Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909147;
	b=YjdmztvwDX32fJS2htNFBYDgIly1F2HltyTnVWLdbmawErdr7CZa357JJ8uKQBQxl7H9
	 EkhHHGyZ4pYtF/hiTC0AO0QPzej2m7IhQP7QhvuFzikuIBuK63/XMeJto2FQ60YPbEV7/
	 aazVmlZkKUBfyRA5gClNMtK6YSuEIoEO4QnckoDf6KVwVNE9gDTWUvdKCuZY+N635OuEx
	 ZQOnx3S/WdfG0+2gkF4QOj3PNhofya7fFQSnte9LTlV139jJCgHeiYJbultxsnIdfkAg/
	 KxQhH8US99eodlghtLo6v5G50sBlkOXpeejAyNi4FdQJW0q2zGiY96jO8QjCV4LAi3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909147;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zXpQ4KVUxj+xGdTDrik2HvWt9Z8R9+uXaj4HXrxxm9Y=;
	b=WnncuhLavBAp/ZyKMWYXIHsqmttvZKKc8iyEXzEz9GgdpPeWW0Q6ln9PpIUFrnui/9hy
	 WcTMQSoAcG8Z6d4t+kK/bLMvPm18lRASgfp2uwD0niYM4YQT8sDg0aRQcNvW32CZSWpcq
	 dc2uMDDSt8sstb+pCHLAeabj1O2bvWgB3LmTae/TCtUOM0VGjzePXcVrES13Hixz+gSnS
	 v0lplA4tviHnaJO2v9E6rVy2oQ+M+eUqYTskDhE1Vd0DocDpzsVRG1X1eOHtM4Ft1xwFI
	 IrEja83W3aA61o5pNJY16lt4VY8xO2tgf7JKL/vWwWMcPgEP5S6+xajR0EFZ5rFjbUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hs33OQCZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D4606A31B;
	Thu,  5 Nov 2026 20:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hs33OQCZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4400B1F0089F;
	Thu,  5 Nov 2026 20:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793909146;
	bh=zXpQ4KVUxj+xGdTDrik2HvWt9Z8R9+uXaj4HXrxxm9Y=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=Hs33OQCZFpqQwr9ewLVXR3R5n7kUU6Skmrc6I2jG3QbRpl8hRp45lgiwQMVjejabH
	 o3ds4+NaZjS4SXmTNHPWWoaT1/QMCPvzl3T5hy6/PArjhhsHeYrLtEGsCiZLjclNio
	 lz3TF/9ikav40928XSOzpAr5I31t+B0W+U7fTM5qscGCb9Ulwbx7GYXc0n0FWQlEIk
	 EbjrJo7p57kK9z6QNz/aHBCHJL0rkLXlikEzagH5tITDrp/lxIVNoK6VeRF8JatnXz
	 PmKGJ58CrcZpsLYUjPiRugbU31sVCWX3N2Xwjre6rRvan2eJqRMEr3lxhueMArCu0P
	 GZSXpBix/GFOA==
Date: Thu, 5 Nov 2026 13:05:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>,
	Matthew Weber <matthew.l.weber@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH 2/4] scripts: Add kernel-sloc helper script
Message-ID: <20261105200541.GB2668266@ax162>
References: <20261103150845.13008-1-matthew.l.weber@gmail.com>
 <20261103150845.13008-3-matthew.l.weber@gmail.com>
 <auwpJUhQ6VSz7y65@derry.ads.avm.de>
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
In-Reply-To: <auwpJUhQ6VSz7y65@derry.ads.avm.de>

On Thu, Nov 05, 2026 at 07:58:45AM +0100, Nicolas Schier wrote:
> On Tue, Nov 03, 2026 at 09:08:43AM -0600, Matthew Weber wrote:
> > +# Write the report before printing the count; failed writes are not success.
> > +write_report() {
> > +	[ -n "$report" ] || return 0
> > +	python3 - "$report" "$mode" "$target" "$1" "$2" <<'PYREPORT'
> 
> Please do not embedd more than a handful of Python code lines in a shell
> script.  Common Python linting is simplier in a pure Python script.  And
> if Python is needed for the task, why is it wrapped in shell instead of
> implementing the whole thing in Python?

Very much agreed, this stood out when I scanned the series initially. I
think this would read much better as a full Python script, it feels like
there is very little reason for this to be a shell script with this
amount of complexity.

-- 
Cheers,
Nathan
