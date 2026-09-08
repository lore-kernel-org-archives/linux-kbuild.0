Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59293471CE4
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2026 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902633; cv=pass; b=bqzWs3er7PJ3nreKinfnVeY3AYYQvO+Qztx/yqx3gqlPIeg7aToie8+DMxhTPm/lxRw3Yx5FvQqCCYcN85j3CBaMEkhgRPGV8wP2j0DvQMiZM791r2cEA+ikPXUGJ5YRBKJVrlNWXza9YDvix1CYSIy046h1zWrMbL2AI+e/Nws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902633; c=relaxed/simple;
	bh=H8km6J+La0K0BkRJYFqKmLKh74NIa7uSrWdkAYb5rWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbqcO9rYaqGtPw5DS34/jCpkAmN6vz3rgppv7p7EjPj6mMbB9yJ0KXZsb6CCAYy2LPRtEFN9tXdYhghWhPROczPqjJv97QFcTFVPJ0ibwuIl0nhJto9NiEJdABEnEJVqxtdIA4IOONWV5O2PdXmQwEQgnyO+X8Ctec2sk6XsqVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxU0ZlXX; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxU0ZlXX"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so567349a91.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2026 14:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788902632; cv=none;
        d=google.com; s=arc-20260327;
        b=iXg/LhMjUBv6wZYMRAJoyi0RQfptjZ3NvVpoA/3HbjxM0REkgr+lgEBdWFAyWu9RFP
         pM//3pY8bGPZQgXdBfJlhpkGe2GEWwzhOqXOaJl/KlZOV2GRgpr/fVZpQbNxuuoxbd1p
         r3igizfGeVi3cwc5q8eD47J46QdLy2DUDmNhHbeLqKKe2eYzKxFbLxLShXlTtjJ4HQcb
         +loOAdz0/u0oaxeK3spUDiBrL/IsQzkquVAY10r61JAY4hFSPHeRQydib1dWwmk3p9q4
         7jlnEZljR6wneXyxqPQla4xkrtQi0ERFBX2vNbVXBhcVifglceKmC7Ha+Edm4DR6wVxn
         o2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H8km6J+La0K0BkRJYFqKmLKh74NIa7uSrWdkAYb5rWc=;
        fh=Mm1aTVqzp1YHd2ZhGU1TiN0eW5I3X5qc+fqL7JI0bPI=;
        b=ExYtoNkXJ/FMtMoEtj0/XQbt7IBVUDhgkFK4XUF03CUdF0MPTEZZ76l3QzUMJSv4tX
         VycbI3WhkbMya+5ZdeiT4ayUdf0CW06ecZMz0jS0ndWPuKXaP3Ux1uIQzsTaRvPTv7Dr
         qEMQEdzEyUuCK0eY9pPVNk3lkpCLJdwaxw0Idf0cB9JH+MJv/LmO/rm9h+Fl+gxEpRC/
         CMuwqMYQwpH5joAFB2hmSIiLC/PtlXC7RN6n3AEPwP8hinY+kljDb9aQzB8n7biJlfkI
         FYBibU+OcIfXjsy2NjNFFtLc5c4NVtN+Py2Qq97sqYCMpHA1qZQNV2HdNBOHvYQ0rDnC
         bw0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788902632; x=1789507432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H8km6J+La0K0BkRJYFqKmLKh74NIa7uSrWdkAYb5rWc=;
        b=ZxU0ZlXXjWJx1SfpuPholGyclksOIOdBi4ZhTLJ4wF4vmaB+/hHUx19zZtpavvwn/u
         DYXz1KTFO0oA+kXlUADY96JCXquFxX8Ci50sIsz/2KwZplhbrZQSH8o5CbzGZ3VPEvhM
         BoLGlW+dnHO/xUTTjDHdnPIbQtU6svube/rpGC5ICB8PsnfXK/kuXe/x87uiVcBrcpi3
         WmKdZutD2rHr2GXmZsbYB6KY7p8nmT36ljycRxbqnEP4ERysbokTHNYF+dJ29e2dGZKp
         pP+w+tmU5d0+lV+beuvDbu2qTmhONpmFq1FB/0kEnyaywk7c7mIIFSiwi58T91hDvbF9
         Jrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902632; x=1789507432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8km6J+La0K0BkRJYFqKmLKh74NIa7uSrWdkAYb5rWc=;
        b=HYUOB2Mb+ex/ERIm2WuJSz/Y8LANdhAA07Si82AHH5V8Sbk5V5z2R49/gQsRsBhJkD
         S1Y1qdiH2xow5eCrNY0OXWCQhUGS6gnpqbeHNICe14KGYDo0eyL0NPpIfPqv1pf8mN9K
         8vTUfVDa6sPalKwUQRrL4ldWMAbGtUbC0UlVUtvFdDZqryDa5vLLKRroyAmgv76EoaAK
         c7XhMLCo8Pxs96ULjDHtm9OVuyK4rWjTD6Ir4s+UfNHK9AFzWeS6QRVTDyLoDOUeCf6/
         BrEjdpOoCiVmn0aNz783O7PrELiqb/1VfGIKdV9wYyd8dvaTM6OEDM40/uLOMcn57qtR
         UtpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9b+fCFGMb5RrGFIbqwXHwBedxgt9fD+U/melz0Y5FIcdn0jxizBdc1oKL2jI/PiEcXDKd0YrybuqYomE=@vger.kernel.org
X-Gm-Message-State: AFuF++mq/Ezb1pU1c8mbXWXoAIwo83BquEBsZDshB0y1Iprmz0Gk5Q5h
	T1MWViDkfPXPjibVDPUujLoGbZBc233bmftzwu6eQgE5XbHagSNmTF4q+ptptTH++FCjggiCphk
	xy0g9KmQ8YdFhKtdL7B9J3g+Xaktm2RQ=
X-Gm-Gg: AYBFou3G38haLZsqQW8cEHIYVxqX6GdU1vruOoz9IlCWjDLLsQI0TGymW5jaQXz8BF0
	qWAysVmngCVCfh+DwFxk0jjsqJZKwloo5sYvlJYQFLZnr1uB9Yb/miGuYm8Rt//+hA+J5a/r5as
	6Ahpxm5b1R8eqICR8+8MAUJBJ81Nr0ZGY2ranZcXSL9OeXCsWyowI7BZWC39C0+XoO9NEpZA8hq
	AHCUba+ISL8MSj7jHd/7alzxty5CS+p4QdkfImu8vVFatDGgFX2bf+BpjtTbPnv+Msazn4w09eU
	Z74CZhweaWebJUJmdwRvKJV9d/y18pkn/2RJh8vzAPHMKIo4LRbORqaDvxDHoaVutY0zojGk9n7
	mlN1FVZzX6pmYtdjjNvgvelcMRmVf3t/0WLWu2VPMPG8d/LqqqHgcbqxgHXbKXoIAMfx60jwuc5
	d6u5PxnMwzXGUW2L9GqrDOZhMKw29HDA4ZgynlZzoe
X-Received: by 2002:a17:90a:d64f:b0:390:af7c:fe5e with SMTP id
 98e67ed59e1d1-39b26741434mr30003398a91.2.1788902631620; Tue, 08 Sep 2026
 14:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908170539.345207-1-ojeda@kernel.org> <DLA8FDX8R5V0.7L5PQVACRZ75@garyguo.net>
In-Reply-To: <DLA8FDX8R5V0.7L5PQVACRZ75@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:23:38 +0200
X-Gm-Features: AcwNN1X4bcqwQ0MJOPRu5vcewCnbUR4xNtVMmUXXz_IpufoE2vKr7IUf6UlsnAk
Message-ID: <CANiq72kOPyQxPEpRCpTGA77uu9qqZhDB+Xmsw7zgk0egrTD-mA@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `unknown_lints` in generated bindings for
 Rust < 1.88
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:54=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think we can drop the cfg on the `allow(unnecessary_transmutes)`.

Yeah, you are right. Perhaps it could have been temporary with a quick
0.73.3, but Emilio replied already.

Cheers,
Miguel
