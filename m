Received: from outbound.pv.icloud.com (pv-2005d-snip4-1.eps.apple.com [57.103.66.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CBE2DECCB
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776373267; cv=none; b=IyQ063aMXpgwUIIOZJhiycmAj/6EZcu1OHxTS+qrPDQYFTIoVDPtAUs4xJQj1gw4W1ZaRq9tCFFygf2aXNkt2ijaZ5Mu6XHGoH2/I9LHK+7k3D9VWgnW0a0MlqjC7M457fhbsPNqEs8jyZ3e6CTuRzTED1XSQ2mp3flhanOAxFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776373267; c=relaxed/simple;
	bh=a0TqkyIxCKaNZFE+BPJXILAdoxPKdlxkhrujtT4KD1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrSfsVG/NIWwjAJv0YyfxI/kvBWMBWSk8nfSVHn2ALJ2g1NUKsNVYCdmZmt6woaMDfNAPjJu+9q+2Oi30vnlcIUHMSaTTCVEUBf+uWhA3YRd9FFnEIAf7P0eIEu0vpJ3pBiDOguqdZfgaseM68t3pwBGhU2BwDKEoLcdRkAIe0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=YspsSGhp; arc=none smtp.client-ip=57.103.66.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="YspsSGhp"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-8 (Postfix) with ESMTPS id DD751180015C;
	Thu, 16 Apr 2026 21:01:04 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQtWC1UZWgNHF04KTVIPDx1WOEAJXwUcE1pYVQkKBl0wShxbAxkIUVBLGw5cAktaFVUXDgJCH1AfTBZXQ0cdHBlaFFwYU0VRH1RYQxlFVmlBC08dXRlbHEJkWFcJChhWGFdWUA4XBlsUBEReClgNShsKGVZYXAJCGEAKWRsBH1YWSBlCHVUMXxYNAkQdWF5ACgoKWBpRAVdDTQlfCndYUAVUDF8bUxhIHVRGExlOG1dNWg1AGVgGbRRWFVIEWQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1776373266; x=1778965266; bh=eSLfBHVnOmnvJiODw4DmKmxzVKTcd81Fo471+gKsY3o=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=YspsSGhplRVCVy55Iv16icjwEQF4HLgfHM5l7wOJi4SHHh2Aq58FcbQEvzzLW6CRaEjWWYijlfiEhSnzd7bTvdHFx8264I/5fmKte8M+miRUE3Nh9D6R1G2srSRYbDui7zeMgy9XwBFa5WYkI+gdI4d6lJf3iO4B2omUuJW6JdkQzn4URfQlDs3t4KGOVyZYmpZUQzPlWElA9bHeAXw3OB340DcFBNhMDxI0cOU2L7clWeTVn+dpw2X+DjRt+2dq5sw2bB5WmnmI+H2ypcH/Azflwiox9SAMtroPZQAO4MI+FpfbXEHbyAmXxfT6LPiMkOBcRusHD13hNlhOPHSz1Q==
mail-alias-created-date: 1772007648188
Received: from sdhn.cc (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-8 (Postfix) with ESMTPSA id BB0D51800158;
	Thu, 16 Apr 2026 21:01:00 +0000 (UTC)
Date: Fri, 17 Apr 2026 00:00:58 +0300
From: Mohamad Alsadhan <mo@sdhn.cc>
To: Yoann Congal <yoann.congal@smile.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <mgofxk3ae5kiphyrjv6tdfqaqpbgmf4zwpo5rz3rkwfje3tqlg@3bumtlvdszmm>
References: <20260331000802.380-1-mo@sdhn.cc>
 <DHHL2VVCVYHU.5RMX7GJ73MDR@smile.fr>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHHL2VVCVYHU.5RMX7GJ73MDR@smile.fr>
X-Proofpoint-GUID: 44JzuJBtJ42ID8ny4_slM3_ioBctoLOP
X-Proofpoint-ORIG-GUID: 44JzuJBtJ42ID8ny4_slM3_ioBctoLOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE5OSBTYWx0ZWRfX6eUQMZce1hBa
 PuNgNHWAEU30Z4kmyR9Ar4bCE/qeRmQjfPRgSLdxjKqbNsBxLOFJGwl8TKjLl5tPoRheJBhMRiL
 kNW6efvI/T1xGUmpozxqvic2XFfE3vZKZdpZd5B3a6MrzswsJ+QUWhwEpqlgeYGR+pvL+ilSy33
 va2GUFSVNqAxodpAijsEdvC0c8cUTbNAfSUt6BLTZbsPkZLRAbE3wag8oyU+c9Rk7rg2MvcgLV5
 IFnLa0pU9wPgsFM298vrAFvs5sDGvJMM1WLJRLPx3wCsWFIfiHV576wt3gM7YqLhMflZE5WXOyf
 zATxcALllSnv8Pfws/5OhLyMkYo6/bPB32ejXmvY8PnRGh2KyXxpTHCGV5x7Do=
X-Authority-Info-Out: v=2.4 cv=Wv4m8Nfv c=1 sm=1 tr=0 ts=69e14e11
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z1zVT0qw5tCvtpFs8WsA:9
 a=CjuIK1q_8ugA:10

Apologies for getting back to you late, I was busy with other things
and I wanted to double-check things before replying.

On 26/04/01 07:53am, Yoann Congal wrote:
> 
> Does using "scripts/" without a $(obj)/$(srctree)/... prefix always works?
> I know I've suggested this as a quick fix. But I did not think about it
> a lot.
> 

You're in fact correct, it's not always correct. Thanks for pointing
it out :)

I assumed it was fine since the top-level build runs the scripts pass
before rust/, and existing Kbuild commands commonly refer to generated
tools under scripts/ using paths relative to the object tree.

That misses some cases:

- On e.g. ARM64 with `CONFIG_RUST_KERNEL_DOCTESTS=n`, no Rust hostprog
  may be built in `scripts/`, so `scripts/rustc-wrapper` may never be
  generated before `rust/Makefile` needs it.

- `scripts/Makefile.host` is also used outside `scripts/`. For example,
  `samples/rust/hostprogs/` generates
  `samples/rust/hostprogs/rustc-wrapper`, but the hardcoded path
   made rustc look for `scripts/rustc-wrapper`.

A v7 patch is on the way that should fix this issue, by always
generating `scripts/rustc-wrapper` for `CONFIG_RUST=y` and using
`$(obj)/rustc-wrapper` for generic host Rust builds (+ some little
hardening and cleaning).

Best regards,
Mo
