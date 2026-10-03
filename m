Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB94428841
	for <linux-kbuild@vger.kernel.org>; Sat,  3 Oct 2026 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791030613; cv=pass; b=B56V4PMhxXZF3bvfbhjDk8NjEUW6URnkQD2jGRWqOk2+7nS638T1hWzQWCHEcXfFaGksrgoN1R64eqnSTSNl8kEUmFCwD7EomMusheosSINLw2RuCcE82WAV8HBUG2VlvxTp7LtG7b3c91OLtds1Ull5JQ9Y5TXN94u5Zvd9SLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791030613; c=relaxed/simple;
	bh=hqSobSxH9p82Pc2pQrLeLMglXwWqgyXODZAnb8rNodY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9L27ft4zqKpnonVw8+tw4AXl6oxXcL44nDv9LbM4j6LoQb/E7GiuRL8Krj2IlXAA2gCjPwFIMKf4YG8nOzIE/HQVGAZfFVhynfuxOgPw4eZIVtI3YtzfHCfwv0dGjkIbV3Rke6+94XHbBAvrNH0Yh0dtLsByPOo3a2EP2qeSK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICHEts7r; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICHEts7r"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342c08bf64dso22407eec.2
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Oct 2026 05:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791030611; cv=none;
        d=google.com; s=arc-20260327;
        b=solRiqaelmW3T4sSsmobvhFcNNweQJ58JmFILtRuSgjIEhNYduqE2PrQaEQdB+RQGv
         RQJni9yQtqfQkFNBza0k0ilQT6ycD8YVw9IZEYRVUTsxY6xhrDqI/rsFHgnlr8skuK4m
         8cLU1FMILNm1oF2DdDtoL8TzKqYUpclrv5u2b6sd/2tcwHmo7FPqfqWa/uW/bevc0wel
         kfk39UQPYApjf/IxGuRXHaOoI7V8NjYqNaUHfGI84hSj2dxUiQrjFcu6JYX50JEXhCHO
         gfxPD3LFGbRJBuYPlKxiH4sKPHFJHIyDqQB/IkduoLwgaXfUxkBf+7AIk+i4Kzf08jkX
         Z8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1rcFnGwOBJPc4tgjdRKJpXz40Fnn5DOONKlluyZPLO0=;
        fh=XzFx80i7QiST9wuhNh20ME1mluW+fWZ0a+eZ11foxEw=;
        b=goUCwc6q4M4UFOC/4JpbCigLiCPBiVYLL6n7IuCf42GQ8Di+SHUmj0Pbb1sam3H7qq
         XSpf0I8DhyHcH669iZAlEjHZk0b9sBOhgPD+/NRvhsySMosZyGbktO2gwIqnZDqZ/wAC
         HqUGDFLH8AWPsQFrQf8alVMxxXIQj6zFUTP8O0rzNyb28hHz7/30WtJBTUZbimuz/NGx
         G3mi769MtT02zLAffCpqbU4F6r6C4P6lJMJ5LdyoJhmwOeYEjkTv4cQxmhdRFFTu8G6r
         z4PlPGJlFo5IFoCwhkot9WE8cEvQtYt8U6/YCbqpD96ONq8K7WpOaLqUsqv47qrkvqQB
         QVZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791030611; x=1791635411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1rcFnGwOBJPc4tgjdRKJpXz40Fnn5DOONKlluyZPLO0=;
        b=ICHEts7rQtQJy0wzKvoy63vJRuKHGMZvxA/1+773lv+Wje2qAIntzJZowMRvWK9bD9
         xc91ACmBEAjYCsj9MmZ9WSpnNEFjjWLSDfvt1A65R0pA3lyHHuU4XzfN5/Gmal03VR3b
         zlDfz4c962Tbtd5jBkf1FfEdDnaJ9H/4zqRQ3HMPEo8bFqy1V8FKtJ5NQcZ+tM8iVmkJ
         wjLD/TX931ywKtCMvWUHlMgxEdnJBRZb6hxNiKlVcgf4tryFaZrhUnqY7ypZK+IUsAe+
         R20AFD46mJ97RndCDGviPtkAtXExMoHG+V2pPvneZP2gAJtbQHZA8TXlhg1tiKEyiZPB
         yu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791030611; x=1791635411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rcFnGwOBJPc4tgjdRKJpXz40Fnn5DOONKlluyZPLO0=;
        b=SSkgA8oWfi1AGFHt6/5+mfv8JdxqldkYXXLtrnzQUo1t+hKA77KZBKR3BbZdUWadzA
         QLv/6LRI+5FuGTa7z6oLrAv7XhG8+0+4RM9CgKPcrQW2OV9Lp4lJiAKKOUUsmcHq3/Jn
         zWpO9tE/l6XRr4bR4IXdwKtLECjYJaTjybKuSWPknQ2uhU+i8vVXgNuYQet1TsJLKhW5
         2jCRuj71GZLU5gpmeo2RLAXMnRhqoOxOjLlGSyImZCSm9QA7LjbGYntzm7uSL/jyo9+T
         v0/tYbDG57hU9g2fjbMZMXzDCRvy70gtsIZYHuLC3jvlVRCLFTZCKY/b05iAItfwBtIE
         T9Gw==
X-Forwarded-Encrypted: i=1; AKwUvBy6Db5eaCBhTw6xnCaASyUMLSAL+YLAmH+35e2R+dAr2+sTUt3s8zGOeFblpdC2KTQyNHXW+Yfdj+u6yEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYITCzswuYCnfatzFlQK6wHgMFy+Of9cefBINzmpnZtJl5/lga/N
	dDsRKiEeRrQn/s8CHceBnFHaKj2b0djS8SFYB5nqMYnRzHMvGjxI0ZH4AaDvbLtT8ONHbzPCxRn
	XrrsIzWqYwZrwQMQaoS6K7pPtMiItT+U=
X-Gm-Gg: AYBFou2RZg4tQgbLYK2cbKL+Z8vkk220+ysuRZ2qZlMZeW3+FKROQ0/towJjxZta60x
	TgZ5jPpIAbN4TGYfXcLW3Cy9sYVQjGDDZw8qv6fWHrjWH/0O6Bm3s0rrY2Oko0vC2DiNZnmDBOu
	r0XPUakyonVkccf9EGyJYp8VwX0igvnq4IX9S3fyFUMrv5R6Nxwp4qKl8CFPixHGXH7d/k7waBP
	BJnYVX0z88WlHujk4+ti7E+jMWCpSQRyTw6lABQULiS66dX3tf//N9dV42ayLicV/8wxrGY5TjH
	0PdUuZgJLloA5pdX5YDeveeTV7vMfgozr7uaq1QciSJv4B3En+y6V3rdho0qUx2Waxq+znvcQ4c
	qx9YUdXe1Y5t75zeXuc5qkA3ImEsxDjDMFjSKlyM+P78Md/xOf3dGW2H8UTtUqrLqusJMxr3mi1
	s1Vo9J3ufjfp1I3uhzjYoMby8C6rTqDdNDp6TFFSM0uFKuhWyCqKM=
X-Received: by 2002:a05:693c:6090:b0:351:18d3:dc3c with SMTP id
 5a478bee46e88-35118d3dd9fmr2927720eec.0.1791030610865; Sat, 03 Oct 2026
 05:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
In-Reply-To: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 14:29:56 +0200
X-Gm-Features: AclHuK8rsCn6lZolOMeCDhA0TDOEZE4YAnfFpck0egreN2YiZjMkFmzEgwJYFZY
Message-ID: <CANiq72mqUDt23jBFr1YVf_5WdO8xcdX0cXpAA9wiawy-sdfcPg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: Replace and dissolve procmacro-extension variable
To: Nicolas Schier <n.schier@fritz.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:10=E2=80=AFPM Nicolas Schier <n.schier@fritz.com>=
 wrote:
>
> Use make's $(basename) function [1] and substitution reference [2]
> instead of $(patsubst) to extract crate names for rust procmacro
> targets.  As there is only one user of the procmacro-extension variable,
> do the crate name extraction in-place and remove procmacro-extension.
>
> The procmacro-extension variable is used to record the binary file
> suffix of dynamically loadable rust libraries -- which is 'so' on Linux
> and others and 'dylib' in MacOS -- to remove that very suffix from a
> target file name for reconstructing the corresponding crate name in
> cmd_rustc_procmacro.  Extracting the crate name from the target name
> in-place is shorter and reduces complexity.
>
> Link: https://www.gnu.org/software/make/manual/html_node/File-Name-Functi=
ons.html # [1]
> Link: https://www.gnu.org/software/make/manual/html_node/Substitution-Ref=
s.html # [2]
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
> Tested-by: Tamir Duberstein <tamird@kernel.org>
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>

Applied to `rust-next` -- thanks everyone!

    [ Rebased. - Miguel ]

Cheers,
Miguel
