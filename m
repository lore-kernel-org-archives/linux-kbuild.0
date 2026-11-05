Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793908041;
	b=b9Qtr/GrKDCGte8KE46ntSSyW1PO2rSswaP5+eX2PG7K0t6wvb1QgD+Nz2e1dj2uW7jQ
	 I+ZPms8pqtgdhO6YSfNTiBnjShe1pIAM3kJXrtJCzwmVYPBSSYMDXVEdDnsJU3RP4mgxE
	 BDxZuaVWZBOLvciVLRJtMwNsMFSR/GaX7ANi9VCHFFMuUNNVCvmf38AZ3FV7b6kDisrkP
	 JJwXsFIRUi3bhL4+7Z2S2FOVjQ37H5bpryuF93iThAfOTNk92/vt7AVTd/3K8RXhD3dQy
	 gyG2zCJ3MpyMAx4xZhqWE3HNGwkUTmdxiWrKDeIuzMFkmP9wfFKkE8C5ebwaqrXXXlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
	b=wPKjeRSmHvXC2wKRfeMQbFhyaVx4yZhKpmzicKubTTvrKToHyFLmlVyhE+sZO1J15LDm
	 aRDkUeadb3OUwJvR3a+K53TsOL4e4n8g9dInFE3gXqKx5eVDIt5EVVybIwRnKKqvctFVZ
	 gFDWDmaERbk84VS4yMumYl1wGVlL4ix51wEkNrIz9dFdeskDWcVcUWG499kZeQMFmNAOv
	 c0NjMPvqg7u157n9KxyWVozDee/Y76k4+LJODO20JWq8miT2AG5ojc3s80WD5rFoSgI3p
	 r827I4/nNe8doeHtZfVF9rFJTBB+l+YAiMBS7Zy1jzI3X1Jv+tCiUGtTz1PQyuXUvAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVKv3WCh;
	arc=fail smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD0606B9CE
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 19:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDD0606B9CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVKv3WCh
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36d499f6ab6so250907eec.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 11:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793908040; cv=none;
        d=google.com; s=arc-20260327;
        b=eTFY76MtJcBtX1F1Q2IZYkiTqVR49swAklDrMICCB9K+xJzNe3Xhr8ND0+jMIPbvkz
         UquJRd8uhGL53TgND4AG8kuTlUr6gv3VyZ7V2qElax6PLeCoaQx/ol7DM/dNuJz7GFkw
         cTHY5PmE2NNu3DzJRfZ3eyF1L0Vccx+Iz9dcFx9xzbmCGTIVZNbh2X52oBSNYZM4cO7k
         B7bZjWAAnBPOPYwMBWqIYVDsF/yBNuZ2t3021xuYpl6msbjrCLJXZguNAHtbwvhKqd1E
         PowqE2AYFKaVNc4wAwTRYb9OPXwmeWLV00h2ddftxoKFwvFZd4yAWwGfkgkKz7PRx7+y
         CwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        fh=eNURy8RFM9Y4Lm7j6Hl43hNVAJitzyRZEaVUhsdAeAA=;
        b=jQcQnRT32p748iPeFzBj5CSni1JkhHVvZitHxexMtZXcVxRyFeZZr0dB5WBA1EMcmr
         fxo2/miKgLby0RUVyrJD95gcci6J6a9oHkWX6uqXhpIkzy+jRP/TADnvlQXjK4qVeAiT
         UzHe9oy5cvl9chMSmRWpEtekwzmp3WwSUtofslEFEoFYAVsUIvoFp/C5EtImFxP8n+TL
         1JAXtuU+gaN/NOzpqawa5IrbBoPLW9UE/2W71kFHrPmlDdBeHmLhObyDDophaoxkXDys
         1PFNirM+YevSPu129M/mvZ+bdCB/0HcdZNgKpAPA0bv2dKP3cRkiwrt5HCjmUOJ74hvk
         5d2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908040; x=1794512840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        b=EVKv3WChu9Kx8aUKP6ZsMkpRgy/gQHndf5kOtV41bsorTaM8Z1UhhPBJpX5Xp3akwb
         m6DbXgdoO0mYT93BW8uSA4Cic4KWk+CeSFU1KDrozz16EuBsPUdJkpQUHx79Vr6kes8l
         ZChdIvBwXDjpcLyIbFrGAWohqEuZtB9OsnS+1L4YXdOrxwzZd44XLmFUYBYZ1vjYqEBe
         tBA0n5JoNGmZJyLulSDXQ3amG8GE7pWM8//7PXIJNbcJ1Vn+Rcdt/ZqTzbOqW70MDLPo
         LCkqIXIu9c2hGgJ+kaWM5WShLXaPJ59BMdE13lwF+33HIBjOHz23S6VfAne2MjBX8kwA
         w79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908040; x=1794512840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7Rvc2eAAc7Ttj0gHC/vXpmQNYUgAbcj5VvsQjcHkOQ=;
        b=ruCUsEKPgTgWe61B220LtcRpVlMYeqZFwWNFTTZ6zyIj7/bgiZ/LL+ZP9KHcQToiVg
         V7rRDxP+rz5zUoNnFpI5kymatQulb9Neby82YAk/rWEdYN+49M+edzD2DdNl2MiOTR1E
         JEW7U1V2qrej4t6rVNhEUKWOqPfgdyniyd4p/AbfMvsQ7ie+CffBDNgo1d2TNj68zzD8
         JaMSp1ZiwJVH62pg8UzTMKH4QlTW3vKQxxx7oJO+ASffpDfCYydfwGAKFCux1yiLEcBE
         oCoTaw+sp6Ff5yIdOHV1QFUsHPBt+jl9pAoc95w0gWjVfglb0GXuD3XL6KGAkNNnkMVu
         lvjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhLHSpuwHUCJz9IfYb87QG1pHb+6jz2/WFd++E/DS98YvUmubqCX9OS9Ukx5dUUktQPAwLfgxYYQDvLDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pyYzpdfLj1b5xF6dqZ34l8M7pr2Z9OEwmfrqQVRghf4w3QUI6
	4jQtJyqU6NhPyIA0fiPj5C3XLHdO5hWj3ZTdFGVDNVZ7fd+SisewLcCR+3n55Yl5Bfl3SNmEr67
	gGkMWA8peZKm9CA/BnOR1OKJghQvINe0=
X-Gm-Gg: AYBFou0Z5tfNMPgtaJiCSQOX20NG9VHzP+n3IjLkMgBjIfDCb4JLRqCfflAXSlctD/Q
	6HE2pDMtHSdop+w751XMDsbn5K2Rd9MGeCYh6IUWpN6VkXoqdZGaGVSRJSbMDEDqh1aJc4jRo7F
	T3yEPSetl++DIVX1I0FB96u2IDQ8CztCHkuk+3MxIPFZ7P4t0lBUdLuhm95KBg0mrrltipKLmWn
	PvY76LrwrYRKXIWp6gXE440eepLfFwAzOLqz43urFxy3kmpAbihOM+quMHjZ1z/ygmAuL4fmb5P
	OavR2C/Ffzs7qPvN5ErDUTVxSkoq79PIZwCAqCgMVXTvz1dXTtYHQ4pIEiHZXx1SI5i+qxKiDDK
	8Ca08DKcz8O4KAM0mK2KVjxgwEiPAjzmiXKBiR8o1XrL61WnjS6dxs29mVcIuHoE5MSZ/L/Iesq
	Z2XFKG4f4J7q5mpZEIjBMZXUoZjYvN05dRtNnkQYIonNfEzHLfzaAGSDTVCywQgRqeEK90tuNJf
	zJsm8I0rytXij/vD4I3pDAxMUuOCMoHZhaR
X-Received: by 2002:a05:7301:da07:b0:36d:cd5d:d809 with SMTP id
 5a478bee46e88-36f75831c52mr274847eec.1.1793908039634; Thu, 05 Nov 2026
 11:47:19 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
In-Reply-To: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Nov 2026 20:47:05 +0100
X-Gm-Features: AclHuK8sCw5nDzEQ97QtRVn9Wki3tWu_M3cQQh4H35CVD10ErpOISlcCaQDiaQU
Message-ID: <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:46=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> since LLVM 17) for C, Rust, and ThinLTO builds when

> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-salvage-stale-profile

I double-checked that the flag was introduced in LLVM 17 as the cover
letter mentions, and so it is likely fine given the Rust 1.85.0
compiler (i.e. our minimum) supports LLVM 18 as the minimum major
version, but if the patch goes ahead in the end, then we should make
sure it works well with that one (or probably you already did, in
which case, please ignore this!).

Cheers,
Miguel
