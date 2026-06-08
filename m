Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85032989B0;
	Mon,  8 Jun 2026 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929374; cv=none; b=TxlMwuUiuySUSlPwYQeHtaCjc/S8QQLjuG5ec/SHLEJis86TX/plINDedmLht0AuyqKdjhT6u5jUrU0rYXsf/CNaXG64Z2B5bTHVT+z2qFBBWNrE6YOnVEpNd1MxaTG0CC2kONNJv5/AFS2dSNLc1R5W+vZyrPFAQndXHcaD8f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929374; c=relaxed/simple;
	bh=zrpB3ocR+gkhe+vbpM6wXKZKRdSYBzGOn3UzkVuaNOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkoibEkJQ/QF5Q5V7PbyN2QDIfNCS6A6ILt2cMtXblLUmLGqnKl8PA/gVBSHM1SyaMyi7xuAF5ORZ2Ac6/L4EqJeaORUbDsIuQ8Oh7uK5EKYCo0sQZZY2xrOlkeswZjcwH9+qhtTOxRIY7bJYko/BMZ8odfIwxkY7uRGuMEjc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flvSQaDd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flvSQaDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56821F00893;
	Mon,  8 Jun 2026 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929373;
	bh=s0cxyE9k6FjwnnczOSdXnHh86iNJEtIKne0Vs5FuTHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=flvSQaDdSHPWExrkGF2vXkyEE7cvr3fTbSCxDLOTj8lZoN3dxfgeY1AlW5XlZwaWK
	 IZPhd1LzxMqHXwqdy97LeI9cWK7eZZ8ViYc7JM3PH8FXZl4+3Un/i3Ir1BfRqNEe2t
	 wAm291Z7MUvNUDVMnrgDet9316HHIfTCEE1Ix0CvI5bFQuyLhJN08m5G9lzbD1/UeL
	 za391zK7UFFoplN11jwEbxqxQiYVbvpALK72W1BJmbg5Tfzop5qK4a6pRNNPssEEYy
	 UoSttXYM1d6LKltVrlSt9Ayvj+YE6b30SiIM0R5VDop+L3RbrxR88CZlO9MnkRDtuQ
	 Hav4PARMYNdOg==
Message-ID: <a2079a1c-098f-4f24-bed3-ecd9ab97b868@kernel.org>
Date: Mon, 8 Jun 2026 16:36:09 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/19] gpu: nova-core: firmware: parse
 `FalconUCodeDescV2` via `zerocopy`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Joshua Liebow-Feeser <joshlf@google.com>, Jack Wrenn <jswrenn@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>
References: <20260608141439.182634-1-ojeda@kernel.org>
 <20260608141439.182634-20-ojeda@kernel.org>
 <DJ3QP2IPKKZV.2L0CY2KLXP4LD@garyguo.net>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DJ3QP2IPKKZV.2L0CY2KLXP4LD@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/8/26 4:32 PM, Gary Guo wrote:
> On Mon Jun 8, 2026 at 3:14 PM BST, Miguel Ojeda wrote:
>> +use zerocopy::FromBytes as _;
> 
> Is this still needed given the prelude additional?

There are still lots of other places in this file where FromBytes from the
transmute module is used, thus the file still has an explicit
transmute::FromBytes import.
