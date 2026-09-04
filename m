Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF343DDB17
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Sep 2026 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508443; cv=pass; b=vGbydyxlWLAgoRiHfAbs+Vn49Dt1LX0TRtY02pU1MZkxEI3uOrwUvT02WAVmCkgSBGEpfFMUxOVaxvqzKIgf0jXsBqoqoeWTD3EIOPb1IEuniy24pSYsCy1u+NCrdjPJBvFa6GAE+tDj3bb+EhDq43ZtGoGZVvtge4vHQnqr9c0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508443; c=relaxed/simple;
	bh=wcvjg+AYhNTqXh7GWpJ5CTmwV5GIrw6stmgUibgREwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lv9nQ1JhA7cOxN49gioZ3BIKyzafn3KG7nwdXtUywRVzViZYWdtw4BqXmKjWkbmlsW4v3XBTDfyhJMJ9r3MvEAMpXZRWBkcBstpSQcq79W7W3sWdP+HA8eg5CHTDPx/3iHRQ1JNBhJTXXeqO/75Jw/t6a8NRSuYbfVMxkK9YoE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5Ha0LCa; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5Ha0LCa"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0d3105cso77694e87.1
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Sep 2026 00:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788508440; cv=none;
        d=google.com; s=arc-20260327;
        b=RgivFGZbS2VXBv8DEAKYUgk/aTvZi97kaFwEqnbuangho5kb7ysrblkGhKT3j+L4Ld
         4nGJFG602RzYgIENbQnd7w5od1ThkcdwZN6723JVsKfXBYL3VbrkImjfqemQy9fTLIpD
         34/sgekilcUkal4STkbPJs2RtQXWh9t10T2FfyFHeuUq3e5aKbSSmycljj73nOIbRDjf
         wd6FDNW/TzJhgXKVIYmJ6ovGcY/aPcJxSOvWVIA4scdS77zG1IQv2oc9rG7E5g66sehg
         fLRkheIIlk4SrMv2wI3YTKgDLOjkY4F2quRrYzg8NUzvKi2L3G1pxsCUbR/SL14lVHT2
         byyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=owvm6o4N7RgrNbsjjtTXPv1xxL39SmJXwndV799foiA=;
        fh=gh1StseosmelpEhfuRyvbCz+bbq1itlsypsbFAu8ju0=;
        b=TzzWAb2XGGTItf0eD64q/8jaCnUb5AGSQs40hQSOJ5qo2FC31mC+jCWRjhw1f9d6yL
         ZezPuS9xXXX3KFX4XNVZPB92qVqw3yHyATYODJzrc3fLRNOrKLKbDfcQQxAnIQvpMnX/
         6BcCbHWoQa3BB0jtHTFTYuqYNAslFI5nKpf2iH9ZW8VmyaP+/OJ8hi4OoT/+/wImBnOu
         QxO1m7+MAt0TZSJlVUrNM5EDBgpIL5uwtreLF6opJPdRaDcMlN+WINobUxCqh8uwbvaA
         BZWF6hP9fQVSE2DrUs1cFBTM/T8otRHZw3meLEEgVMWZwvWbKBFee4xoks3LjvgHalZe
         tlpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788508440; x=1789113240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owvm6o4N7RgrNbsjjtTXPv1xxL39SmJXwndV799foiA=;
        b=O5Ha0LCaibk7BsN2nnHRyBzDMoqbeVXj5KTG3iJa5bLBX1zaE7CCw+7tqynZbCad1C
         zKk0wGe2lGm9v7jlCPvKyWM7DIbuJ1lWAfC07Q73g05JniSSHS2XEqh3addsSD/ILEK4
         e0LNEJ0jiwUU8cOl64RzGGsQni7ST0veQEpKsSbA70F+vL7l2CckfG2epzWIcVATwYjx
         8/EFEfd+k0fEhbeiqJJ/QsnK15T78IuYMNTypbfI36ymH+jULsqyiBHiDHX6qNKrHoPC
         jwc+xryBwpXHFzhXMtKiBbqmvcDQQTMvlQPnL9vTOOvVYdVZa/KILsRPvvQnAnNp/tqF
         I60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508440; x=1789113240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owvm6o4N7RgrNbsjjtTXPv1xxL39SmJXwndV799foiA=;
        b=R1ujk71OsjkpMOCLYhDwp9+ErRh6DN+VZ1JE7r1ztlYy/7GvNhog2WKb9xosJDL+bx
         DTzUStZ+LkpWwvMi6U78W7bGAXJlrVsNcEazgmouG1wuFCC6HPLDP6Y8Y0mxnroducqR
         jt7bVWZS2SiIUt5C78C5QAPN28xrstaWwFRy6gZ8lX5J9usZE4cxdLO3q8P2mJLZlcLv
         q2gtsWc3zAM5PmIS1qtDxam5WbprOsqCQMrMOJobyk0m5/tZnxdtGmHOL4zh0+hEjPgj
         nmGPwZ2yjY2toQ4ip974m83qapZSEdCy2uUF2wF/aGOLXzdXjj5QIO5vXjeOfhgKHtTT
         ySYw==
X-Forwarded-Encrypted: i=1; AKwUvBw+Nr/9rqqjTxOJhb2VF8PpsF/98R/Yz/clbYH7cP4roDCmAK/eZ7Ubz1MkuSIs6v3BZgqUvNTBp8AKFPo=@vger.kernel.org
X-Gm-Message-State: AFuF++kU7pHlCVSOdOzcPK2BKuIIzFXmMf+NmNdjBPnGqvFGKhMcApT4
	XqmoNwDYU/c/5TdAbKX0VRFYwf++sPb9jWKVrCrgQRiA30/IVQrBVzXd0gHcPEXh+IY04R1x0ZG
	Ks66B+1ptq8/fEuJF/DJxkcHcrt3Rf3k=
X-Gm-Gg: AYBFou1drpBWLm6NgFD7WKerAe6H00AgMYP/QYCTAXtSAWgwIO2ndmaEeqCCzPCEoI5
	UnqliTmjLedAq14DURevLpwR/UJsL8G/6aIkqLbnPBiBbD395lFYmwBuHNhucE3+Y/v9YrLhnEq
	MWTcMS5D11/SGP7bY1HdDXWQu6miGoYvojC4bsNSEU7NfP/+088LmN49cxqJ1fCr8dAFM4WMn/n
	vdwhtRQwiXGbiTXeTTONq+f8FqXRY71C/vUSayTBvL3ONTxhgMvhugFS0qRlkceAYb4Pss6G5ul
	r+YQ31lhgDSNMyPKf1iqTr9UxWYfNflySi4yuounI9MAgpwI1IKa750T04IxIWu/NoccRP/YqAV
	QXrORgZKDfoAYRL6uHffpFAT00uDmz5mpk4d4wIPAgL89hFiSa6ke+YkAvSjBRltYqQpYe6Q=
X-Received: by 2002:a05:6512:4027:b0:5b6:4b2:c408 with SMTP id
 2adb3069b0e04-5b61707fca1mr702903e87.6.1788508439773; Fri, 04 Sep 2026
 00:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902150353.23666-1-ojeda@kernel.org>
In-Reply-To: <20260902150353.23666-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 09:53:39 +0200
X-Gm-Features: AcwNN1VBz_mYbTOURWZnSU-eJEinL5edJeBG0q2HqJ5Fc-4KupKLS4ugizaXgSI
Message-ID: <CANiq72knf0aMUjLzmDFf96RV5yE9PjQSgVQgeUX1LQ8SsU5_Dw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: add intrinsics to fix Rust 1.100.0 builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 5:04=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> I sent a PR to upstream Rust to make the methods simply `#[inline]`
> instead, and it seems like it will be merged, so we can most likely
> skip this workaround:
>
>   https://github.com/rust-lang/rust/pull/162191

The PR has been merged for Rust 1.100.0, so no patch needed.

Cheers,
Miguel
