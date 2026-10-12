Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01BE49B457
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818488; cv=pass; b=Af8tl8DqWwvskmrZfow5n74iqpUTQEgVJIO3TF0MVRffMsxytfvzbjjiexRsisQwND4o0vfuWJux/5rY66riVcEIL3IvNf1NRFqc5uOB5FPVziCkjuhprOSj5KzxO/H9SurSV5U2ncRzBZ9LbGTceyvBvfhqGP/LwtiAq4V6by8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818488; c=relaxed/simple;
	bh=acXxdYNI6vj4GN6tEYHBYlbXzhzxGLnqPGYWn+EXNdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsEteM8OV/mjYEAmFKJl9/beSMtwifypBlOQtIAJmCnSHPNGoGXuLonW4Z4tNhjIEgM6+aswEHFUoF34UZbJ54lCmcDXYRU8YIxyC5aPD6jFlyXS6Z/ly5Sds+BohCQK3xTLbU0PkYduyxvck3KgQHz0Wrk//M3AWCK1K/f8IAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9UVbICO; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9UVbICO"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-313bab9cfe7so207692eec.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 08:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818487; cv=none;
        d=google.com; s=arc-20260327;
        b=RZ3yPzkCgUV8Id42VwqiSXeJ2MvQbCf0yBNAsXuAMwZAMYvzfIMaFG5rffSiPi4Q24
         LhaE5dbY/Us3OH5R5Xn8CPkIMhKEGJVLaANQfdNDvnbTwI1E4+vJtOdqi4nXpRpxTEoo
         nSWsNTd6i5FTXyi3JGl17RxvjWbzCpZcycVIOs2QTRzl738dIr1VqSyFgqCBvfyELdq5
         IA8aT5rz54hSloLoRcxNuAXiMYPNSLGWWWcxIN2Jrqeb/3ObF/G/CEaj+VRfkKwb1mDX
         S7Dk89x9Trf77246B/HAiui76iXw+sGrnR657dcLMVh4cMtUbgFgN7e6JvBv5vTcoX0Q
         +c+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        fh=GKc1WnqncOy2HR0QEEjtxCJ7vKHCLvQVP+fTq+6Du28=;
        b=a4KTcq5ql9aCN9udFsMRHohZcSndPqIpaZiQdUeeC/e3shl0aAwH6xS/omlAvmzq4K
         9UVO5lKZdmY7xNlPWlWG3IiWWSSv5HHSyL6icnP20SpgdBk2CujG6/iPOOK/C8CDme5k
         xMdRCsdGXo+UrB0JxkPvoCU8UEEvreOXQQZubdu3GKV4WNMheXx0+DQTJ7D5p9hjYY8E
         kgCnHIZL+iEexAao4UQcNCsY1442KpO56vwatOhzB2PcWTJ68SaQg1uidEB6PwH1xobz
         gByKiOlkV3U89u13aMlBSd0/KwpIRKdC349DHN6S6EJeRGjvmvpURlRkZ8JrsD4UFt+F
         w5OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818487; x=1792423287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=V9UVbICO9Vb3G0dHVTiGb8S4WVniQxs6wmTmPNcXznYmsWz8kd1y+k31MFrHAf8vSr
         F/xu3g2v5JkYjvBeTbKIBSPdbOMtozVeZwNJe/sneeG+41EP6qmE4OlR8ZAft5Aw3GY8
         5QKTN1uz326YnQuvFOv/Dh4E5k3sn+Hyqa94/cPE5CWDlxlTTKSV8V6mLrRTozIwWcOH
         sqHovpjY6+6o70mawD+5zf6vV7GcNVQJpS1asU3zptVn8fG5vEtRCymo5tXcTJVdT/dg
         aOQpLbB7ySZzkjVQwzGgtzrtANP0OAgkCKgoS8RaZIK8+EPmpQgit/8WHVOlQr2kiIk8
         S0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818487; x=1792423287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=JOlbdL1wZQXaU5tnWaa3B7l3bc7ZE6oI53w7Vqv+RZ4oCmROi1u2MOnGalGI8HT02E
         +DvoBjDSwka1iTn/3FxSzymvCqcg8VB+nB+Lo5rfXSALLbn5u8HSui1IEp6FqjcAfKh0
         8bnUV6OiIOkHAAAib6tEoMjLZOfGaUkGBenRZEZAzgPXX/yiaHjvL/FdLq9iMp5qPYeY
         PIleUnmO/PfMMcLoF6MuuWSnIyN2Fb5DgTVnNvVntztxvGbITlUzCW7XijgLPfzFYDYX
         Vtt3XPS5iTh399TO0a8GMjiJorA9mlEKAba5Gdj7Dsa1W1YB/FOlwAtJPU/x8cEJPiAQ
         dCDA==
X-Forwarded-Encrypted: i=1; AKwUvByL9blnQaxC15vqI6A5joDku/ymfyGLlF+zhZiZ+s/MktGJcmQ/a2Yfn7a8tfF3COnzii/vjXleBnppB0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY/Qz586EE02EBvSFwGGSi2KQrcCySFwXxYLFK1WY8nGnjkQpm
	8bBnFucodwKVaeeWk+UOFMYjU661BZ59kPdBpkAL8zxhSFuyTXVDxznraW5YC2VHUfPkdL/p/zM
	PmFubA986sLhL61+5qoqQaYpmVmU/uMU=
X-Gm-Gg: AYBFou2TSOuRMA2T/f8iGxhUFOLUpuER4vm0mrB4pW1M3on0uvlAQhirk4GZlfufswZ
	PWcBNpG8w+26GnJOMsFyOFF9Etu2NBm92wWWZd7wPqzUqXjmrL/dtjiIxcrBsZKi9pthwQthbnE
	JvaobJ7VDXv+r4YU3Wv8Kck+ODPjaWnR+bUi5j78fln53lLFbuDCAr6hvY23c9i9JE6wydIM/mp
	Ptbz+yXBcgsU5+dCKjZkPX0yDAOlM3RHeKZ9z5b19yAsHKaX3kucDRN84Lr5jX/NLLENE8PbC6+
	cdXXRMGZ4mo601O37hiXYQTgTwGxqSg4aeQP4GtRCm2JoSl93miNMIIaHgzdIOD48Y43r6rXksn
	nSqlvOoyVeLEK9/isLrqC1LlXPSFHdNIyu+1lxhKzsM2mbdCt+z8vxgltu/MUEXqq3TgI/WWdP4
	kPr5TRkyuu2BkqKVIQIrpnuyAcgluArEtDOjNbsbJt8LIuekIsyqY=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr22095379eec.0.1791818486595; Mon, 12 Oct 2026
 08:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com> <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
In-Reply-To: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 17:21:12 +0200
X-Gm-Features: AclHuK8qicd0EkbAG2tR809BSGa88U6FRkGTx1gJTbJF14aEuOf_oW-ieXqq320
Message-ID: <CANiq72=p6a=4K+8jhbm8=y8i_4yMszacK-fu91s3-Eg69ACejg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:16=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Oops. I guess we'll make a v2.

Please also take the chance to use the kernel vertical imports style:

  https://docs.kernel.org/rust/coding-guidelines.html#imports

Thanks!

Cheers,
Miguel
