Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F68D45BD6C;
	Wed, 17 Jun 2026 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708531; cv=none; b=F2LGob/uieZnTK48tAu7+wF0zvcatMfJRPxgwjoTb41d2XL56QVmWydzB8VJLwU26rMdpRPPz2413Oq/BrqrzviUUEFjF+5hc6cS6tShozAppCesREArLzMObMzTEWiRFYPd/SSKbUgC/1fAx4GOuZvLH+7+37hRh3wSRBl2tSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708531; c=relaxed/simple;
	bh=3jYXP6vhoLhEXhUIvaFQBSikCPfkDoYeuRlkzV0zOu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anwcEVqMSCUoosq0zmqDzPpPo4lqzCFTDBt22DvuGnW4As3edW+MGYbwXaz4cAeJ2aK3GKJUNfpVnIwgg3cOun1HFNGJSOp22fl7ZeU4b+DPr1hCHgCVWDDU99lhpJR4EXGNLwtszATtmkMbX+4OI4+TqiEx6kuDJs+l5r/m/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a32b6ed-3215-7f0000032729-7f000001dd6e-1
	for <multiple-recipients>; Wed, 17 Jun 2026 17:02:05 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 17 Jun 2026 17:02:05 +0200 (CEST)
Date: Wed, 17 Jun 2026 17:02:04 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v2] rust: kbuild: Replace and dissolve
 procmacro-extension variable
Message-ID: <20260617-neon-monkey-of-gallantry-170a0d@l-nschier-aarch64>
References: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
 <CANiq72=N=TPxuEjKo7FZOUBTNaUEqdvNT67UDeuA51eFcqLPyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=N=TPxuEjKo7FZOUBTNaUEqdvNT67UDeuA51eFcqLPyA@mail.gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1781708525-2AE58CD7-1D5ADB08/0/0
X-purgate-type: clean
X-purgate-size: 665
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

On Wed, Jun 17, 2026 at 04:36:56PM +0200, Miguel Ojeda wrote:
> On Wed, Jun 17, 2026 at 4:10 PM Nicolas Schier <n.schier@fritz.com> wrote:
> >
> > Link: https://lore.kernel.org/linux-kbuild/CANiq72nmPPF=6AUp5mcDJVni80ORQr0AQ-4uCZaE+CzB5kV=eg@mail.gmail.com/
> 
> Great, thanks! I will take this next cycle unless you (Kbuild) want it
> through your tree.
> 
> The link quoted above could be nice in the commit message, I can put
> it there when I apply (or is there a reason you want it outside?)

Thanks!

I thought it might not be too helpful.  Please feel free to add it to 
the commit.  No need to take it via kbuild.

Kind regards,
Nicolas
