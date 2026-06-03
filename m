Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D393FFAB4
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471545; cv=none; b=m03GnHDBnNJT9Rs1UEjApf/4Mbf6yEN9FFgaIc+0Alibc+GyX9vIZxogMPdz+5WwRnxuaz2SzusNzrUIlWDGA8QhWyB/gdzXcBvYN2rFaQ1QMCMNX7Uz3P44lCz9xWjp3VyQgZ+68ERehTvfAF2UrBgqbGPrHzbTy71Jc5qrEIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471545; c=relaxed/simple;
	bh=Mlwtbz+gVN22gH4dM+AnS8oUUbPu0tBkZ2ExDcjDpNk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KHHzhKVZk91sf9UE2HQpKgVD9G9Lq//pyTEc4yakQkZdBij1f/fcUgPdImTKS86XgyU8fdZaCO1ZXX8Ht8XlgKWkhAo103DR0Cgn9gd2hc/cCxIWTSVoqe64A9USnPPgdbIIKZAZN2eOK07S9asn3g/1yLHbo8hjKDLVDOf44tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjOqUT2X; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjOqUT2X"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490b37e1f47so11095425e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780471542; x=1781076342; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn1fwrz0N95jpQxjLA6rHpxyLrIkfU2xk5HoRUHBs5I=;
        b=NjOqUT2XAosPhcoaktiNR2N0agBfPNsGCIGsOA61TBvKQdwRQbvgQArHTL17mJxdjE
         ei3OGCzot9HwE5RYXqJkWg2RKxD/T1IOYd04ypKfmyFlPXZAMwYZhz+yVV2Xs+BRZudO
         mtdJH8sBE6yowdkfLtkeOcVFzXa1TvXxWI3JCtqPOlLj5ngmxRqrxskuMW7gqP43SWOH
         tbXxREetMUOb0qvaKW24OW280xqbkLWb6FM8NWzFGZrsTEmO+s1E7IXqzInwGDhuGeOG
         U9/1mQICAH1oqvg5FweQHLlUE6ZMpaSJ9zYDoaUXqLQ+02ceeTHQhhgPLSFf50z3Suro
         j8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780471542; x=1781076342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn1fwrz0N95jpQxjLA6rHpxyLrIkfU2xk5HoRUHBs5I=;
        b=evIbuMHt9nIIhxdlmPdKVm2oCBOGmUtIo8g5eU2QPPvV5ZFOdHnPG64Il48MpWZeXU
         6PRhgHch6ZTkzAnP5dzo+oGpMD1B/4CRZ5yE42AjISF6lzlRI3/w2YoRnMQ66IUMZTVx
         elv4XOO844FwPg2yljOwWxyrzK8BEZrIDVtZLftOpYCPHRkXC38nU0rfrIIZpND7CekF
         yHcFz9hXPDJNd+6M8upjQPwRhqSM0e4SRIGVxeW4jBHWUStWhLs8nOfohUmN+y5Nhvxw
         +gV7HVYNtgHx+t9f6MAEJ6bX5YjLhoX/XgpSKJPymlsjJ6ThxajSDhlRzLMNokn1fIhY
         Ot5g==
X-Forwarded-Encrypted: i=1; AFNElJ8F11YjUB5fpv6RojvYrP4mj9xl44PA1UpiD9JxxIzfqaD+JSQNOUoIrAQr1f4TFRdEOZA5nE+QV+NFBVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxpvU8OEaDzMQRvWX7MFjp1m+K8KxVXM5N5RMEgAzpzfbsA3n
	y8XQXSOA/eLtM3cAovUL2/BbdsX6vyGe6dJYj+iiLjYxRNQfBxesqpjt+BqwHI/Qb4Yjn7lPoLx
	15unQV4HkvzxGFkg9PA==
X-Received: from wmqy18.prod.google.com ([2002:a05:600c:3652:b0:490:b027:8bb9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c4b8:b0:490:b591:b5a3 with SMTP id 5b1f17b1804b1-490b60e9af0mr32900305e9.32.1780471541391;
 Wed, 03 Jun 2026 00:25:41 -0700 (PDT)
Date: Wed, 3 Jun 2026 07:25:40 +0000
In-Reply-To: <20260602151638.14358-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260602151638.14358-1-ojeda@kernel.org>
Message-ID: <ah_W9IMXQh06-EgB@google.com>
Subject: Re: [PATCH] kbuild: rust: rename flag to `-Zdebuginfo-for-profiling`
 for Rust >= 1.98
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jun 02, 2026 at 05:16:38PM +0200, Miguel Ojeda wrote:
> Starting with Rust 1.98.0 (expected 2026-08-20), the
> `-Zdebug-info-for-profiling` flag has been renamed to
> `-Zdebuginfo-for-profiling` (i.e. one less dash, to match `debuginfo`s
> in other flags) [1].
> 
> Without this change, one gets in the latest nightlies:
> 
>     error: unknown unstable option: `debug-info-for-profiling`
> 
> Thus pass the right name.
> 
> Link: https://github.com/rust-lang/rust/pull/156887 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
