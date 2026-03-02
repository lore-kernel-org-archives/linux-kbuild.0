Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97640149F;
	Mon,  2 Mar 2026 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462898; cv=none; b=s4bQqGfrzHOUGBvJsXLBVO9fYoXOzBB1m0AE9EYjWHXC1kk4CUOc0C6JmtOKh8qPUg5imjEvczFnrjwr3UX2XqGsClcpHofxfwV8SrVoZmImIcb4VvMye+giLnp1NuDZrPdO5mIopJs7n+84BiZDAVYLPf1HLStHVRA9sCJU/ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462898; c=relaxed/simple;
	bh=Mt0Svr10fcBQzLnM+GXvrbYOWA96FAL+7ZWEJZAvMZA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=maTE6wtf1po9r3YtNSRDlna4kBV29FIdLjxBitHG42oIMl2OqPIx5McrOhHoEYpRUeNBAqmfJ2AQuQDK+nHC7ih4u8CRW687AtOYVYCKgoJEPoi8ac8ZQbpVm3O5e3nBBVPu6s1pa2WbzECCv8EIl7uQlf9Ws4M1tkFB7BimyAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2C60Lmg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2C60Lmg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F1BC19423;
	Mon,  2 Mar 2026 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772462898;
	bh=Mt0Svr10fcBQzLnM+GXvrbYOWA96FAL+7ZWEJZAvMZA=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=H2C60LmgAUk2Nssv2qnSo/XLdqmeuApSpvzZLVSRVsZG4CvMhjOsYL5KHNyZsytXS
	 cF3qAta2ahwjaThsE/dVPgV+q1hGG6vFHZwmAZwPOASjH4UFqxYXKFjhjFBxpJRnET
	 eqmKlhh1F+RMZNpR9kdyb9pYwsa0+lDhgag9tATx4bkweWNl06/LaQowgxo5gjXRI/
	 MQBGNGuqdx4K1ooQpyvf849fU0EVM7Z9084r88k9YBlPpHAXrPn65h2f2M6wfAmmQ3
	 93zEAD6EF9kRQyVoTEndgXouaYhwufC+c2kg0O8RRzw87izSn8o2oghgkwbsSfAqax
	 uZfoJFgw3/u3w==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:48:13 +0100
Message-Id: <DGSDNOH55CX8.CMGYO2OMDBJZ@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
In-Reply-To: <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>

On Mon Mar 2, 2026 at 3:38 PM CET, Benno Lossin wrote:
> [1]: https://doc.rust-lang.org/std/mem/fn.size_of_val_raw.html

I recently would have had a use-case for this as well, but besides the reas=
ons
you can't use it in this patch, I think it's also still unstable?
